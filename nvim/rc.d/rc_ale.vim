"let g:airline#extensions#ale#enabled
"let g:ale_cache_executable_check_failures
"let g:ale_change_sign_column_color
"let g:ale_close_preview_on_insert
"let g:ale_command_wrapper
"let g:ale_completion_delay
"let g:ale_completion_enabled
"let g:ale_completion_tsserver_remove_warnings
"let g:ale_completion_autoimport
"let g:ale_completion_excluded_words
"let g:ale_completion_symbols
"let g:ale_completion_max_suggestions
"let g:ale_cursor_detail
"let g:ale_default_navigation
"let g:ale_detail_to_floating_preview
let g:ale_disable_lsp = 1
"let g:ale_echo_cursor
"let g:ale_echo_delay
"let g:ale_echo_msg_error_str
"let g:ale_echo_msg_format
"let g:ale_echo_msg_info_str
"let g:ale_echo_msg_log_str
"let g:ale_echo_msg_warning_str
"let g:ale_enabled
"let g:ale_exclude_highlights
"let g:ale_fixers
let g:ale_fix_on_save = 1
"let g:ale_fix_on_save_ignore
"let g:ale_floating_preview
"let g:ale_history_enabled
"let g:ale_history_log_output
"let g:ale_hover_cursor
"let g:ale_hover_to_preview
"let g:ale_hover_to_floating_preview
"let g:ale_keep_list_window_open
"let g:ale_list_window_size
"let g:ale_lint_delay
"let g:ale_lint_on_enter
"let g:ale_lint_on_filetype_changed
"let g:ale_lint_on_save
"let g:ale_lint_on_text_changed
"let g:ale_lint_on_insert_leave
"let g:ale_linter_aliases
"let g:ale_filename_mappings
"let g:ale_linters
"let g:ale_linters_explicit
"let g:ale_linters_ignore
"let g:ale_list_vertical
"let g:ale_loclist_msg_format
"let g:ale_lsp_show_message_format
"let g:ale_lsp_show_message_severity
"let g:ale_lsp_suggestions
"let g:ale_lsp_root
"let g:ale_max_buffer_history_size
"let g:ale_max_signs
"let g:ale_maximum_file_size
"let g:ale_open_list
"let g:ale_pattern_options
"let g:ale_pattern_options_enabled
"let g:ale_popup_menu_enabled
"let g:ale_rename_tsserver_find_in_comments
"let g:ale_rename_tsserver_find_in_strings
"let g:ale_set_balloons
"let g:ale_set_balloons_legacy_echo
"let g:ale_set_highlights
"let g:ale_set_loclist
"let g:ale_set_quickfix
"let g:ale_set_signs
"let g:ale_sign_priority
"let g:ale_shell
"let g:ale_shell_arguments
"let g:ale_sign_column_always
"let g:ale_sign_error
"let g:ale_sign_info
"let g:ale_sign_style_error
"let g:ale_sign_style_warning
"let g:ale_sign_offset
"let g:ale_sign_warning
"let g:ale_sign_highlight_linenrs
"let g:ale_update_tagstack
"let g:ale_type_map
"let g:ale_use_global_executables
"let g:ale_virtualtext_cursor
"let g:ale_virtualtext_delay
"let g:ale_virtualtext_prefix
"let g:ale_virtualenv_dir_names
"let g:ale_warn_about_trailing_blank_lines
"let g:ale_warn_about_trailing_whitespace
"let g:ale_windows_node_executable_path
"let g:ale_alex_executable
"let g:ale_alex_use_global
"let g:ale_languagetool_executable
"let g:ale_languagetool_options
"let g:ale_writegood_executable
"let g:ale_writegood_options
"let g:ale_writegood_use_global
"let g:ale_want_results_buffer

"let g:ale_cache_executable_check_failures = 1
"let g:ale_change_sign_column_color = 0
"let g:ale_completion_enabled = 0
"let g:ale_cursor_detail = 0
"let g:ale_disable_lsp = 0
"let g:ale_echo_cursor = 1
"let g:ale_echo_delay = 20
"let g:ale_fix_on_save = 1
"let g:ale_keep_list_window_open = 0
"let g:ale_lint_delay = 0
"let g:ale_lint_on_enter = 1
"let g:ale_lint_on_filetype_changed = 0
"let g:ale_lint_on_insert_leave = 1
"let g:ale_lint_on_save = 1
"let g:ale_lint_on_text_changed = 0
"let g:ale_list_window_size = 10
"let g:ale_open_list = 0
"let g:ale_set_balloons = 0
"let g:ale_set_highlights = 0
"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 0
"let g:ale_sign_column_always = 1
"let g:ale_use_global_executables = 1
"let g:ale_virtualtext_cursor = 0
"let g:ale_virtualtext_delay = 20
"let g:ale_warn_about_trailing_blank_lines = 1
"let g:ale_warn_about_trailing_whitespace = 1
""let g:ale_sign_error = '✗'
""let g:ale_sign_warning = '⚠'
"let g:ale_sign_error = 'EE'
"let g:ale_sign_style_error = 'EE'
"let g:ale_sign_warning = 'WW'
"let g:ale_sign_style_warning = 'WW'
"
"" fixers
let g:ale_fixers = {
\  '*': ['trim_whitespace'],
\  'c': ['clang-format'],
\  'cpp': ['clang-format'],
\  'go': ['gofmt'],
\  'javascript': ['prettier-eslint'],
\  'typescript': ['prettier-eslint'],
\  'json': ['prettier'],
\}
"
"let g:ale_fix_on_save_ignore = {'stpl': ['trim_whitespace']}
"
""" linters
"let g:ale_linters = {
"\  'python': ['pyls'],
"\  'yaml': ['yamllint'],
"\  'vue': ['eslint'],
"\  'c': ['cpplint'],
"\  'cpp': ['cpplint']
"\}
"
"let g:ale_c_clangformat_options = '-style=file'
"let g:ale_cpp_clang_executable = 'clang++'
""let g:ale_cpp_clang_options = '-std=c++17 -Wall'
"let g:ale_cpp_clangd_options = '-std=c++17 -Wall'
""let g:ale_cpp_clangcheck_executable = 'clang-check'
""let g:ale_cpp_clangcheck_options = '-std=c++17'
""let g:ale_cpp_clangtidy_checks = ['*']
""let g:ale_cpp_clangtidy_executable = 'clang-tidy'
""let g:ale_cpp_clangtidy_options = '-std=c++17'
""let g:ale_cpp_cppcheck_executable = 'clang-check'
""let g:ale_cpp_cppcheck_options = '--enable=style'
""let g:ale_cpp_cpplint_executable = 'cpplint'
"let g:ale_cpp_cpplint_options = '--filter=-legal/copyright,-whitespace/blank_line,-whitespace/end_of_line'
"
"let g:ale_yaml_yamllint_options = '--config-file=' . fnamemodify(findfile('.yamllint', '.;'), ':p')
"
""highlight clear ALEErrorSign
""highlight clear ALEWarningSign
"highlight clear ALEErrorLine
"highlight clear ALEWarningLine
"highlight clear ALEInfoLine
"highlight clear ALEErrorSignLineNr
"highlight clear ALEStyleErrorSignLineNr
"highlight clear ALEWarningSignLineNr
"highlight clear ALEStyleWarningSignLineNr
"highlight clear ALEInfoSignLineNr
