// rc/plugins/dpp/dpp.ts: dpp の設定を記述する TypeScript ファイル

import type {
  ContextBuilder,
  ExtOptions,
  Plugin,
} from "jsr:@shougo/dpp-vim@~4.1.0/types";
import {
  BaseConfig,
} from "jsr:@shougo/dpp-vim@~4.1.0/config";
import type {
  ConfigReturn,
  MultipleHook,
} from "jsr:@shougo/dpp-vim@~4.1.0/config";
import { mergeFtplugins } from "jsr:@shougo/dpp-vim@~4.1.0/utils";

import type {
  Ext as TomlExt,
  Params as TomlParams,
} from "jsr:@shougo/dpp-ext-toml@~1.3.0";
import type {
  Ext as LocalExt,
  Params as LocalParams,
} from "jsr:@shougo/dpp-ext-local@~1.3.0";
import type {
  Ext as PackspecExt,
  Params as PackspecParams,
} from "jsr:@shougo/dpp-ext-packspec@~1.3.0";
import type {
  Ext as LazyExt,
  LazyMakeStateResult,
  Params as LazyParams,
} from "jsr:@shougo/dpp-ext-lazy@~1.5.0";

import type { Denops } from "jsr:@denops/std@~7.4.0";
import * as fn from "jsr:@denops/std@~7.4.0/function";

import { expandGlob } from "jsr:@std/fs@~1.0.0/expand-glob";

export class Config extends BaseConfig {
  // config メソッドを実装
  override async config(args: {
    denops: Denops;
    contextBuilder: ContextBuilder;
    basePath: string;
  }): Promise<ConfigReturn> {
    const inlineVimrcs = await this.getInlineVimrcs(args.denops, args.basePath);
    args.contextBuilder.setGlobal({
        inlineVimrcs,
        //extParams: await this.getGlobalOptions(),
        extParams: {
          installer: {
            checkDiff: true,
            logFilePath: "~/.cache/dppn/installer-log.txt",
            // TODO: GitHub API の制限があれば追加する
            //githubAPIToken: Deno.env.get("GITHUB_API_TOKEN"),
          },
        },
      protocols: ["git"],
    });
    const { recordPlugins, ftplugins, hooksFiles, multipleHooks } =
      await this.loadPlugins(args);
    const lazyResult = await this.getLazyPlugins(args, recordPlugins);
    const checkFiles = await this.getCheckFiles(args.basePath);

    // dpp に必要な情報を返す
    return {
      checkFiles,
      ftplugins,
      hooksFiles,
      multipleHooks,
      plugins: lazyResult?.plugins ?? [],
      stateLines: lazyResult?.stateLines ?? [],
      // 必要なら inlineVimrcs をどこかで使う
    };
  }

  /*
   * インライン Vim script のパスを取得する関数
   *  - 非同期で fn.has() を呼び出すので async 関数に
   *  - denops を引数に取る
   */
  private async getInlineVimrcs(denops: Denops, basePath: string): Promise<string[]> {
    const inlineVimrcs = [
      "$VIMHOME/rc/core/options.vim",
      "$VIMHOME/rc/core/mappings.vim",
      "$VIMHOME/rc/core/filetype.vim",
    ];

    return inlineVimrcs;
  }

  /*
   * dpp.toml からプラグインの設定を読み込む関数
   */
  private async loadPlugins(args: {
    denops: Denops;
    contextBuilder: ContextBuilder;
    basePath: string;
  }): Promise<{
    recordPlugins: Record<string, Plugin>;
    ftplugins: Record<string, string>;
    hooksFiles: string[];
    multipleHooks: MultipleHook[];
  }> {
    const [context, options] = await args.contextBuilder.get(args.denops);
    const protocols = await args.denops.dispatcher.getProtocols() as Record<
      string,
      Protocol
    >;
    const recordPlugins: Record<string, Plugin> = {};
    const ftplugins: Record<string, string> = {};
    const hooksFiles: string[] = [];
    let multipleHooks: MultipleHook[] = [];

    const [tomlExt, tomlOptions, tomlParams]: [
      TomlExt | undefined,
      ExtOptions,
      TomlParams,
    ] = (await args.denops.dispatcher.getExt("toml")) as [
      TomlExt | undefined,
      ExtOptions,
      TomlParams
    ];

    // toml 拡張機能が存在する場合
    if (tomlExt) {
      const action = tomlExt.actions.load;

      // 読み込む toml ファイルのリスト
      const tomlPromises = [
        { path: "$VIMHOME/rc/plugins/dpp/dpp.toml", lazy: false },
        { path: "$VIMHOME/rc/plugins/dpp/dpp_lazy.toml", lazy: false },
        { path: "$VIMHOME/rc/plugins/ddc/ddc.toml", lazy: true },
        { path: "$VIMHOME/rc/plugins/ddu/ddu.toml", lazy: true },
      ].map((tomlFile) =>
        action.callback({
          denops: args.denops,
          context: context,
          options: options,
          protocols: protocols,
          extOptions: tomlOptions,
          extParams: tomlParams,
          actionParams: {
            path: tomlFile.path,
            options: {
              lazy: tomlFile.lazy,
            },
          },
        })
      );

      const tomls = await Promise.all(tomlPromises);

      // 読み込んだ toml ファイルの結果を処理
      for (const toml of tomls) {
        //console.log("#### toml: ", JSON.stringify(toml))
        for (const plugin of toml.plugins ?? []) {
          recordPlugins[plugin.name] = plugin;
        }

        if (toml.ftplugins) {
          mergeFtplugins(ftplugins, toml.ftplugins);
        }

        if (toml.multiple_hooks) {
          multipleHooks = multipleHooks.concat(toml.multiple_hooks);
        }

        if (toml.hooks_file) {
          hooksFiles.push(toml.hooks_file);
        }
      }
    }

    return { recordPlugins, ftplugins, hooksFiles, multipleHooks };
  }

  /*
   * dpp-ext-lazy の設定を取得する関数
   */
  private async getLazyPlugins(
    args: {
      denops: Denops;
      contextBuilder: ContextBuilder;
      basePath: string;
    },
    recordPlugins: Record<string, Plugin>
  ): Promise<LazyMakeStateResult | undefined> {
    const [lazyExt, lazyOptions, lazyParams]: [
      LazyExt | undefined,
      ExtOptions,
      LazyParams,
    ] = (await args.denops.dispatcher.getExt("lazy")) as [
      LazyExt | undefined,
      ExtOptions,
      LazyParams
    ];

    let lazyResult: LazyMakeStateResult | undefined = undefined;

    if (lazyExt) {
      const action = lazyExt.actions.makeState;
      lazyResult = await action.callback({
        denops: args.denops,
        context: args.contextBuilder.context,
        options: args.contextBuilder.options,
        protocols: args.contextBuilder.protocols,
        extOptions: lazyOptions,
        extParams: lazyParams,
        actionParams: {
          plugins: Object.values(recordPlugins),
        },
      });
    }
    return lazyResult;
  }

  /*
   * 監視するファイルリストを取得する関数
   */
  private async getCheckFiles(basePath: string): Promise<string[]> {
    const checkFiles: string[] = [];
    // 環境変数 BASE_DIR が設定されていない場合の考慮も必要
    const envBaseDir = Deno.env.get("BASE_DIR") ?? ".";
    for await (const file of expandGlob(`${envBaseDir}/*`)) {
      checkFiles.push(file.path);
    }
    return checkFiles;
  }
}
