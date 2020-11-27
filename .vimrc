" 更新时间：2019-4-26 14:36:56
"
" 一些常用快捷键:
" 1. 随时可以使用 ctrl+z 切换到终端下执行命令， 然后再通过 fg 切命令换回 VIM
" 2. 到N行  <Ngg> <NG> <:N>, 现在 normal mode 回车为到文件末尾, 12回车映射为到12行
" 3. H, M, L - 屏幕位置，分别为顶部，中间，尾部
" 4. zz -  normal模式下区中
" 5. 替换
"   不确认、非整词<Leader>R
"   不确认、整词  <Leader>rw
"   确认、非整词  <Leader>rc
"   确认、整词    <Leader>rcw <Leader>rwc
" 6. include <stdio.h> 将光标放到 stdio.h 上, 使用 g+f 可以跳转到 stdio.h
"   文件查看, include "xxx.h" 的不能使用(set path+=** 后可以)
" 7. 常用的 quickfix 命令为:
"   :cc     显示详细错误信息
"   :cp     跳到上一个错误
"   :cn     跳到下一个错误
"   :cl     列出所有错误
"   :cw     如果有错误列表，则打开 quickfix 窗口，没有则什么也不错
"   :copen  打开 quickfix 窗口，可以在后面添加窗口高度参数，如10行： :copen 10
"   :cclose 关闭 quickfix 窗口
"   :col    到前一个旧的错误列表
"   :cnew   到后一个较新的错误列表
" 8. vim-go 使用:
"   可以参考: https://github.com/fatih/vim-go 和 https://github.com/fatih/vim-go-tutorial
"
"   该配置会在保存 .go 文件的时候, 自动 import 使用的包,
"       自动使用 fmt 格式化源码格式
"
"   :GoImports                  vim 会自动导入使用到的包
"   :GoDef 或命令模式下敲入 gd  自动跳转到函数/变量的定义处
"   :GoLint                     运行 golint 在当前 Go 源文件上
"   :GoDoc                      打开当前光标对应符号的 Go 文档
"   :GoVet                      在当前目录下运行 go vet 在当前 Go 源文件上
"   :GoRun                      编译运行当前 main package
"   :GoBuild                    编译当前包，这取决于你的源文件，GoBuild 不产生结果文件
"   :GoInstall                  安装当前包
"   :GoTest                     测试你当前路径下地 _test.go 文件
"   :GoCoverage                 创建一个测试覆盖结果文件，并打开浏览器展示当前包的情况
"   :GoErrCheck                 检查当前包种可能的未捕获的 errors
"   :GoFiles                    显示当前包对应的源文件列表
"   :GoDeps                     显示当前包的依赖包列表
"   :GoImplements               显示当前类型实现的 interface 列表
"   :GoRename [to]              将当前光标下的符号替换为 [to]
" 9. vim-sneak 使用
"   正常模式下：
"   s{char}{char} ： 转到下一个{char}{char}；
"   S{char}{char} ： 转到上一次出现的{char}{char}；
"   s{char}<Enter> ： 转到下一个{char}；
"   S{char}<Enter> ： 转到上一个{char}；
"   s<Enter> ： 重复最后一次跳转；
"   S<Enter> ： 反方向重复最后一次跳转；
"   ; ： 转到[count]下一个匹配；
"   , 或 ： 转到上一个匹配的[count]；
"   s ： 转到[count]下一个匹配；
"   S ： 转到上一个匹配的[count]；
"   [count]s{char}{char} ： 跳转到向下的第 [count] 个匹配；
"   [count]S{char}{char} ： 跳转到向上的第 [count] 个匹配；
"   {operator}z{char}{char} ： 当前光标到上一个 {char}{char} 的 operator 操作；
"   {operator}Z{char}{char} ： 当前光标到下一个 {char}{char} 的 operator 操作；
"    可视模式的用法和正常模式相似。
"
" 10. <Leader>bl 打开/关闭打开文件状态栏

" 定义快捷键的前缀，即 <Leader>
let mapleader=";"

" >>
" 文件类型侦测

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on

" <<

" >>
" vim 自身（非插件）快捷键

" 定义快捷键到行首和行尾
" lh: line head
" le: line end
nmap lh 0
nmap le $

" fe(file end) : 文件末尾
" fh(file head): 文件开头
nmap fe G
nmap fh gg

" 通过 12<Enter> 跳转到第 12 行 (12G 我觉得不称手)
nmap <CR> G
nmap <BS> gg

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <Leader>p "+p

" 退出全部
nmap <Leader>qq :quitall<CR>
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>

" 设置快捷键遍历子窗口
" 依次遍历
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j

" 定义快捷键在结对符之间跳转
nmap <Leader>M %

" <<

" 让配置变更立即生效
"autocmd BufWritePost $MYVIMRC source $MYVIMRC

" >>
" 其他

" 开启实时搜索功能
set incsearch

" 搜索时大小写不敏感
"set ignorecase

" 如果按小写字母 搜索不分大小写，按大写字母则只按大写搜索
set ignorecase smartcase

" 关闭兼容模式
set nocompatible

" vim 自身命令行模式智能补全
set wildmenu

" <<

" >>>>
" 插件安装

" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" vim 文本编辑器的精确颜色方案
Plugin 'altercation/vim-colors-solarized'

" 配色方案
Plugin 'tomasr/molokai'

" 深蓝色背景配色方案
Plugin 'vim-scripts/phd'

" 废弃
"Plugin 'Lokaltog/vim-powerline'
Plugin 'powerline/powerline'

" c++语法高亮显示(包括c++ 11/14/17)
Plugin 'octol/vim-cpp-enhanced-highlight'

" 可视化显示在代码的缩进级别
Plugin 'nathanaelkane/vim-indent-guides'

" switching between companion source files (e.g. ".h" and ".cpp")
Plugin 'derekwyatt/vim-fswitch'

" toggle, display and navigate marks
Plugin 'kshenoy/vim-signature'
" mx           Toggle mark 'x' and display it in the leftmost column
" dmx          Remove mark 'x' where x is a-zA-Z
"
" m,           Place the next available mark
" m.           If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
" m-           Delete all marks from the current line
" m<Space>     Delete all marks from the current buffer
" ]`           Jump to next mark
" [`           Jump to prev mark
" ]'           Jump to start of next line containing a mark
" ['           Jump to start of prev line containing a mark
" `]           Jump by alphabetical order to next mark
" `[           Jump by alphabetical order to prev mark
" ']           Jump by alphabetical order to start of next line having a mark
" '[           Jump by alphabetical order to start of prev line having a mark
" m/           Open location list and display marks from current buffer
"
" m[0-9]       Toggle the corresponding marker !@#$%^&*()
" m<S-[0-9]>   Remove all markers of the same type
" ]-           Jump to next line having a marker of the same type
" [-           Jump to prev line having a marker of the same type
" ]=           Jump to next line having a marker of any type
" [=           Jump to prev line having a marker of any type
" m?           Open location list and display markers from current buffer
"  m<BS>        Remove all markers

" Easily Highlight Lines with Marks, and Add/Remove Marks
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
" <F1>            Turn on/update highlighting for all lines with markers
" <F2>            Turn off highlighting for lines with markers
" <SHIFT-F2> Erase all markers [a-z]
" <F5>             Add a mark on the current line (and highlight)
" <SHIFT-F5> Remove the mark on the current line

" displays tags in a window, ordered by scope
" <Leader> ta 就是用这个插件
Plugin 'majutsushi/tagbar'

" indexing all files in project with ctags
Plugin 'vim-scripts/indexer.tar.gz'

" Just a library for some scripts
Plugin 'vim-scripts/DfrankUtil'

" managing options for different projects
Plugin 'vim-scripts/vimprj'

" support asynchronous searching, and lets you edit file in-place with Edit Mode.
Plugin 'dyng/ctrlsf.vim'

" 废弃
"Plugin 'terryma/vim-multiple-cursors'
" Multiple cursors plugin
Plugin 'mg979/vim-visual-multi'
" select words with Ctrl-N (like Ctrl-d in Sublime Text/VS Code)
" create cursors vertically with Ctrl-Down/Ctrl-Up
" select one character at a time with Shift-Arrows
" press n/N to get next/previous occurrence
" press [/] to select next/previous cursor
" press q to skip current and get next occurrence
" press Q to remove current cursor/selection
" start insert mode with i,a,I,A

" Vim plugin for intensely nerdy commenting powers
Plugin 'preservim/nerdcommenter'

" Ascii drawing plugin: lines, ellipses, arrows, fills, and more!
Plugin 'vim-scripts/DrawIt'
" \di           (starts in normal     drawing mode)       *drawit-\di*
" :DrawIt       (starts in normal     drawing mode)       *drawit-DrawIt*
" :DIstart      (starts in normal     drawing mode)       *drawit-DIstart*
" :DIstart S    (starts in single-bar drawing mode)
" :DIstart D    (starts in double-bar drawing mode)
" :DInrml       (starts in normal     drawing mode)       *drawit-DInrml*
" :DIsngl       (starts in single-bar drawing mode)       *drawit-DIsngl*
" :DIdbl        (starts in double-bar drawing mode)       *drawit-DIdbl*

" The ultimate snippet solution for Vim
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them
Plugin 'honza/vim-snippets'

" A code-completion engine for Vim
Plugin 'Valloric/YouCompleteMe'

" pulling in C++ function prototypes into implementation files
Plugin 'derekwyatt/vim-protodef'

" A tree explorer plugin for vim
Plugin 'scrooloose/nerdtree'

" Elegant buffer explorer - takes very little screen space
Plugin 'fholgado/minibufexpl.vim'

" Smart selection of the closest text object
Plugin 'gcmt/wildfire.vim'

" A git mirror of gundo.vim
Plugin 'sjl/gundo.vim'

" Instant Markdown previews from VIm!
Plugin 'suan/vim-instant-markdown'
" Plugin 'iamcco/markdown-preview.vim'

" keep and restore fcitx state when leaving/re-entering insert mode
Plugin 'lilydjwg/fcitx.vim'

" Run interactive commands inside a Vim buffer
Plugin 'lrvick/Conque-Shell'
" :ConqueTerm bash
" :ConqueTerm mysql -h localhost -u joe -p sock_collection
" :ConqueTerm Powershell.exe
" :ConqueTerm C:\Python27\python.exe
"To open ConqueTerm in a new horizontal or vertical buffer use:
" :ConqueTermSplit <command>
" :ConqueTermVSplit <command>
" :ConqueTermTab <command>

" Vim plugin that allows you to visually select increasingly larger regions of
" text using the same key combination.
Plugin 'terryma/vim-expand-region'

" A command-line fuzzy finder
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plugin 'junegunn/fzf.vim'

" ring motion and visual selection to the :grep command
Plugin 'inside/vim-grep-operator'

" Go development plugin for Vim
Plugin 'fatih/vim-go'

" Vim compiler plugin for Go (golang)
Plugin 'rjohnsondev/vim-compiler-go'

" The missing motion for Vim
" 两个字符快速跳转
Plugin 'justinmk/vim-sneak'
" s{char}{char}

" Asynchronous translating plugin for Vim/Neovim
" 异步翻译
Plugin 'voldikss/vim-translate-me'

" Vim plugin to diff two directories
" vim 比较目录插件
" 使用方法 :DirDiff <dir1> <dir2>
Plugin 'will133/vim-dirdiff'

" 插件列表结束
call vundle#end()
filetype plugin indent on
" <<<<

" 配色方案
let g:solarized_termcolors=256

" 设置透明
" hi Normal ctermfg=252 ctermbg=none
" 设置不透明
" hi Normal ctermfg=252 ctermbg=256

" 主题选择: https://vimcolors.com/
"
"set background=dark
set background=light
" 白灰色
"colorscheme solarized
" 黑色
"colorscheme molokai
" 透明
colorscheme phd

" 换行用 $ 显示， tab 用 ^ 显示
"set list
let g:solarized_visibility='high'  "'low' 'high' 'normal'

" >>
" 营造专注气氛

" 禁止光标闪烁
set gcr=a:block-blinkon0

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
fun! ToggleFullscreen()
	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>
"" 启动 vim 时自动全屏
"autocmd VimEnter * call ToggleFullscreen()

" <<

" >>
" 辅助信息

" 总是显示状态栏
set laststatus=2

" 显示光标当前位置
set ruler

" 开启行号显示
set number

" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 设置高亮风格
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

" 高亮显示搜索结果
set hlsearch

" <<

" >>
" 其他美化

" 设置 gvim 显示字体
set guifont=YaHei\ Consolas\ Hybrid\ 10.5

" 禁止折行
set nowrap

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

" <<

" >>
" 语法分析

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" <<

" >>
" 缩进

" 自适应不同语言的智能缩进
filetype indent on

" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 缩进可视化插件 Indent Guides
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" <<

" >>
" 代码折叠

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" <<

" >>
" 接口与实现快速切换

" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>

" <<

" >>
" 代码收藏

" 自定义 vim-signature 快捷键
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

" <<

" >>
" 标签列表

" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_left=1
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <Leader>ilt :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=32
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
     \ 'ctagstype' : 'c++',
     \ 'kinds'     : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

" <<

" >>
" 代码导航
 
" 基于标签的代码导航

" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>

" 基于语义的代码导航

nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>

" <<

" >>
" 查找

" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>

" <<

" >>
" 内容替换

" 快捷替换
let g:multi_cursor_next_key='<S-n>'
let g:multi_cursor_skip_key='<S-k>'

" 精准替换
" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

" <<

" 模板补全
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" >>
" YCM 补全

" YCM 补全菜单配色
" 菜单
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900

" 自动补全窗口及选中颜色
"hi PmenuSel ctermfg=255 ctermbg=242

" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1

" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0

" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=0
"" 引入 C++ 标准库 tags
"set tags+=/data/misc/software/app/vim/stdcpp.tags
"set tags+=/data/misc/software/app/vim/sys.tags

" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>

" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview

" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1

" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0

" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1

" <<
 
" >>
" 由接口快速生成实现框架

" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1

" <<

" >>
" 库信息参考
 
" 启用:Man命令查看各类man信息
source $VIMRUNTIME/ftplugin/man.vim

" 定义:Man命令查看各类man信息的快捷键
nmap <Leader>ma :Man 2 <cword><CR>
nmap <Leader>man :Man 3 <cword><CR>

" <<

" >>
" 工程文件浏览

" 当前文件目录 current file
nmap <Leader>cf :NERDTreeFind<CR>
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置 NERDTree 子窗口宽度
let NERDTreeWinSize=22
" 设置 NERDTree 子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

" <<

" >>
" 多文档编辑
 
" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>

" buffer 切换快捷键
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>

" <<


" >>
" 环境恢复

" 设置环境保存项
set sessionoptions="blank,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"

" 保存 undo 历史。必须先行创建 .undo_history/
set undodir=~/.undo_history/
set undofile

" 保存快捷键
"map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
map <leader>ss :mksession! my.vim<cr>

" 恢复快捷键
"map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>
map <leader>rs :source my.vim<cr>

" <<
 
" 设置快捷键实现一键编译及运行
nmap <Leader>m :wa<CR> :cd build/<CR> :!rm -rf main<CR> :!cmake CMakeLists.txt<CR>:make<CR><CR> :cw<CR> :cd ..<CR>
nmap <Leader>g :wa<CR>:cd build/<CR>:!rm -rf main<CR>:!cmake CMakeLists.txt<CR>:make<CR><CR>:cw<CR>:cd ..<CR>:!build/main<CR>

" >>
" 快速选中结对符内的文本
 
" 快捷键
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)

" 适用于哪些结对符
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]

" <<

" 调用 gundo 树
nnoremap <Leader>ud :GundoToggle<CR>

" 设置当文件被改动时自动载入
set autoread

" 当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif

" 自动补全, 并将光标移回中间
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>

" 运行 ConqueTerm 的时候, 不显示警告
let g:ConqueTerm_StartMessages = 0

"颜色主题设置
set t_Co=256
let g:solarized_termcolors=16

" 系统c函数的查找： ctags -R -f ~/.vim/tags/systags --c-kinds=+p /usr/include /usr/local/include
autocmd FileType c,cpp set tags+=~/.vim/tags/systags

" 打开 ConqueTerm bash
nmap <Leader>sh :ConqueTermSplit bash<CR>

" 打开 tagbar
nmap <Leader>ta :TagbarToggle<CR>

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

" 排序 0:安装位置顺序
let g:tagbar_sort=0
" 自动将光标移动过去
let g:tagbar_autofocus=0
" 右侧显示 tagbar
let g:tagbar_left=0

" 按一次 v 选择一个字符, 再按一次 v 自动扩展选择一个单词,
" 再按一次 v 自动扩展选择一段代码
" 以此类推…, 按<C-v> 回退上一次的选择操作
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" 在 insert mode 中, 将 jj 映射为 ESC 功能
imap jj <ESC>

" 快速生成 tag 文件
" nmap <Leader>tg :! ctags -R --languages=c++ --langmap=c++:+.inl -h +.inl --c++-kinds=+px --fields=+aiKSz --extra=+q `pwd` <CR>
nmap <Leader>tg :! ctags -R `pwd` <CR>


:let $FZF_DEFAULT_COMMAND  = 'find . -type f ! -path "./node_modules/*" ! -path "./bower_components/*" ! -path "./.git/*" ! -path "*.swp" ! -path "tags"'
map <C-P> :tabnew<CR>:FZF<CR>
map!<C-P> <ESc>:w<CR> :tabnew<CR>:FZF<CR>

" Ctrl+] 跳转提示文件未保存, 不能跳转问题
set hidden

" 当前目录找不到tags文件时请, 到上层目录查找
set tags+=./tags
set tags+=,tags
set tags+=~/.vim/systags
set tags+=/tdGUI/output/include/tags


"""""""""""""
" 新文件标题
"""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func! SetTitle()
	"如果文件类型为.sh文件
	if &filetype == 'sh'
        call setline(1, "\# Brief        : ")
        call append(line("."), "\# Author       : Zen Leung")
		call append(line(".")+1, "\# Mail         : re2leung@gmail.com")
		call append(line(".")+2, "\# Created Time : ".strftime("%c"))
		call append(line(".")+3, "")
		call append(line(".")+4,"\#!/bin/bash")
		call append(line(".")+5, "")
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# -*- coding:utf-8 -*-")
	    call append(line(".")+1, "")

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: UTF-8")
	    call append(line(".")+1, "")

"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
	else
		call setline(1, "/**")
		call append(line("."), " * @file Name    : ".expand("%"))
		call append(line(".")+1, " * @brief        : ")
		call append(line(".")+2, " * @author       : Zen Leung")
		call append(line(".")+3, " * @mail         : re2leung@gmail.com")
		call append(line(".")+4, " * @created Time : ".strftime("%c"))
		call append(line(".")+5, " */")
		call append(line(".")+6, "")
	endif
	if expand("%:e") == 'cpp'
		call append(line(".")+7, "#include <iostream>")
		call append(line(".")+8, "using namespace std;")
		call append(line(".")+9, "")
	endif
	if &filetype == 'c'
		call append(line(".")+7, "#include <stdio.h>")
		call append(line(".")+8, "")
		call append(line(".")+9, "int main(int argc, char **argv)")
		call append(line(".")+10, "{")
		call append(line(".")+11, "    ")
		call append(line(".")+12, "    return 0;")
		call append(line(".")+13, "}")
        " cursor 无效
        "call cursor(11, 4, 1)
	endif
	if expand("%:e") == 'h'
		call append(line(".")+7, "#ifndef _".toupper(expand("%:r"))."_H_")
		call append(line(".")+8, "#define _".toupper(expand("%:r"))."_H_")
		call append(line(".")+9, "#endif")
	endif
	if &filetype == 'java'
		call append(line(".")+7,"public class ".expand("%:r"))
		call append(line(".")+8,"")
	endif
	"新建文件后，自动定位到文件末尾
endfunc
autocmd BufNewFile * normal G

set grepprg=git\ grep\ -n\ $*
let g:grep_operator_set_search_register = 1
nmap <Leader>g <Plug>GrepOperatorOnCurrentDirectory
vmap <Leader>g <Plug>GrepOperatorOnCurrentDirectory
nmap <Leader><Leader>g <Plug>GrepOperatorWithFilenamePrompt
vmap <Leader><Leader>g <Plug>GrepOperatorWithFilenamePrompt

" gf 跳转 include <xxx.h>, include "xxx.h" 头文件
set path+=**

" grep 搜索
:nnoremap <leader>g :silent execute "grep! --full-name " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" go setting
" go 设置
"
" 高亮操作符
let g:go_highlight_operators = 1

" format with goimports instead of gofmt
" 这个会自动 import 用到的包
let g:go_fmt_command = "goimports"

" disable fmt on save
" 保存的时候禁止自动调整格式及自动 import
let g:go_fmt_autosave = 1

"
" disable calling Golang every time a buffer is saved
"let g:golang_onwrite = 0

" Setting highlights for the lines can be disabled
"let g:golang_inline_highlight = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 粘贴上一次 yy 的内容
nnoremap <leader>00 "0p

let g:sneak#label = 1

" <Leader>t 翻译光标下的文本，在命令行回显翻译内容
"nmap <silent> <Leader>t <Plug>Translate
"vmap <silent> <Leader>t <Plug>TranslateV
" Leader>t 翻译光标下的文本，在窗口中显示翻译内容
nmap <silent> <Leader>t <Plug>TranslateW
vmap <silent> <Leader>t <Plug>TranslateWV
" Leader>r 替换光标下的文本为翻译内容
nmap <silent> <Leader>r <Plug>TranslateR
vmap <silent> <Leader>r <Plug>TranslateRV

let g:go_version_warning = 0
" 解决插入模式下delete/backspce键失效问题
" 参考![这里](https://www.smslit.top/2016/11/27/vim-backspace-invalid/)
set backspace=2

" 取消对 vim 版本不符合的警告
let g:go_version_warning = 0

" https://github.com/SirVer/ultisnips/issues/593
" UltiSnips#TrackChange   Could not load library libpython3.7m.a 问题
" autocmd! UltiSnips_AutoTrigger
" 解决 'autocmd! UltiSnips_AutoTrigger' 的 E216: No such group or event: UltiSnips_AutoTrigger
augroup ultisnips_no_auto_expansion
    au!
    au VimEnter * au! UltiSnips_AutoTrigger
augroup END

set showmode autoindent autowrite tabstop=2 shiftwidth=2 showmatch wm=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" octol/vim-cpp-enhanced-highlight

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nathanaelkane/vim-indent-guides

let g:indent_guides_enable_on_vim_startup = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" preservim/nerdcommenter

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:sneak#label = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" cscode
if has("cscope")
    set cscopetag   " 使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳来跳去
    " check cscope for definition of a symbol before checking ctags:
    " set to 1 if you want the reverse search order.
     set csto=1

     " add any cscope database in current directory
     if filereadable("cscope.out")
         cs add cscope.out
     " else add the database pointed to by environment variable
     elseif $CSCOPE_DB !=""
         cs add $CSCOPE_DB
     endif

     " show msg when any other cscope db added
     set cscopeverbose

     nmap <C-/>s :cs find s <C-R>=expand("<cword>")<CR><CR>
     nmap <C-/>g :cs find g <C-R>=expand("<cword>")<CR><CR>
     nmap <C-/>c :cs find c <C-R>=expand("<cword>")<CR><CR>
     nmap <C-/>t :cs find t <C-R>=expand("<cword>")<CR><CR>
     nmap <C-/>e :cs find e <C-R>=expand("<cword>")<CR><CR>
     nmap <C-/>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
     nmap <C-/>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
     nmap <C-/>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif


set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,latin1
set termencoding=utf-8
set encoding=utf-8

"let g:mkdp_path_to_chrome = "firefox"
"let g:mkdp_auto_open = 1
