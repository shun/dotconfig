let g:ale_cache_executable_check_failures = 1
let g:ale_change_sign_column_color = 0
let g:ale_completion_enabled = 0
let g:ale_cursor_detail = 0
let g:ale_disable_lsp = 0
let g:ale_echo_cursor = 1
let g:ale_echo_delay = 20
let g:ale_fix_on_save = 1
let g:ale_keep_list_window_open = 0
let g:ale_lint_delay = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_list_window_size = 10
let g:ale_open_list = 0
let g:ale_set_balloons = 0
let g:ale_set_highlights = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_sign_column_always = 1
let g:ale_use_global_executables = 1
let g:ale_virtualtext_cursor = 0
let g:ale_virtualtext_delay = 20
let g:ale_warn_about_trailing_blank_lines = 1
let g:ale_warn_about_trailing_whitespace = 1
"let g:ale_sign_error = '✗'
"let g:ale_sign_warning = '⚠'
let g:ale_sign_error = 'EE'
let g:ale_sign_style_error = 'EE'
let g:ale_sign_warning = 'WW'
let g:ale_sign_style_warning = 'WW'

"" fixers
let g:ale_fixers = {
\  '*': ['trim_whitespace'],
\  'c': ['clang-format'],
\  'cpp': ['clang-format'],
\}

let g:ale_fix_on_save_ignore = {'stpl': ['trim_whitespace']}

"" linters
let g:ale_linters = {
\  'python': ['pyls'],
\  'yaml': ['yamllint'],
\  'vue': ['eslint'],
\  'c': ['cpplint'],
\  'cpp': ['cpplint']
\}

let g:ale_c_clangformat_options = '-style=file'
let g:ale_cpp_clang_executable = 'clang++'
"let g:ale_cpp_clang_options = '-std=c++17 -Wall'
let g:ale_cpp_clangd_options = '-std=c++17 -Wall'
"let g:ale_cpp_clangcheck_executable = 'clang-check'
"let g:ale_cpp_clangcheck_options = '-std=c++17'
"let g:ale_cpp_clangtidy_checks = ['*']
"let g:ale_cpp_clangtidy_executable = 'clang-tidy'
"let g:ale_cpp_clangtidy_options = '-std=c++17'
"let g:ale_cpp_cppcheck_executable = 'clang-check'
"let g:ale_cpp_cppcheck_options = '--enable=style'
"let g:ale_cpp_cpplint_executable = 'cpplint'
let g:ale_cpp_cpplint_options = '--filter=-legal/copyright,-whitespace/blank_line,-whitespace/end_of_line'

let g:ale_yaml_yamllint_options = '--config-file=' . fnamemodify(findfile('.yamllint', '.;'), ':p')

"highlight clear ALEErrorSign
"highlight clear ALEWarningSign
highlight clear ALEErrorLine
highlight clear ALEWarningLine
highlight clear ALEInfoLine
highlight clear ALEErrorSignLineNr
highlight clear ALEStyleErrorSignLineNr
highlight clear ALEWarningSignLineNr
highlight clear ALEStyleWarningSignLineNr
highlight clear ALEInfoSignLineNr
