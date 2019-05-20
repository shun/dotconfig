let g:ale_cache_executable_check_failures = 1
let g:ale_change_sign_column_color = 0
let g:ale_completion_enabled = 0
let g:ale_cursor_detail = 1
let g:ale_echo_cursor = 1
let g:ale_echo_delay = 20
let g:ale_fix_on_save = 1
let g:ale_keep_list_window_open = 0
let g:ale_lint_delay = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_list_window_size = 10
let g:ale_open_list = 0
let g:ale_set_highlights = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_sign_column_always = 1
let g:ale_use_global_executables = 1
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_delay = 20
let g:ale_warn_about_trailing_blank_lines = 1
let g:ale_warn_about_trailing_whitespace = 1

"" linters
let g:ale_linters {
  'python' = ['pyls'],
  'yaml' = ['yamllint']
}

let g:ale_cpp_clang_executable = 'clang++'
let g:ale_cpp_clang_options = '-std=c++17 -Wall'
let g:ale_cpp_clangcheck_executable = 'clang-check'
let g:ale_cpp_clangcheck_options = '-std=c++17'
let g:ale_cpp_clangtidy_checks = ['*']
let g:ale_cpp_clangtidy_executable = 'clang-tidy'
let g:ale_cpp_clangtidy_options = '-std=c++17'
let g:ale_cpp_cppcheck_executable = 'clang-check'
let g:ale_cpp_cppcheck_options = '--enable=style'
let g:ale_cpp_cpplint_executable = 'cpplint'
let g:ale_cpp_cpplint_options = '-std=c++17'

let g:ale_yaml_yamllint_options = '--config-file=' . fnamemodify(findfile('.yamllint', '.;'), ':p')

