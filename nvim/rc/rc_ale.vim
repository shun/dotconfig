
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_completion_enabled = 0
" let g:ale_lint_on_enter = 0

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
let g:ale_cpp_gcc_executable = ''
let g:ale_cpp_gcc_options = ''

let g:ale_python_autopep8_executable =''
let g:ale_python_flake8_executable =''
let g:ale_python_isort_executable =''
let g:ale_python_mypy_executable =''
let g:ale_python_pycodestyle_executable =''
let g:ale_python_pylint_executable =''
let g:ale_python_yapf_executable =''
