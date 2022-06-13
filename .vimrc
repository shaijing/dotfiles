"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 基础设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number                   " 显示行号
set nocompatible             " 兼容性设置
syntax on                    " 语法高亮
set noeb                     " 关闭错误提示
syntax enable                " 开启语法高亮功能
set showmode                 " 底部显示模式
set showcmd                  " 命令模式在底部显示当前键入指令
set mouse=a                  " 正常使用鼠标,可以在buffer的任何地方使用鼠标 类似office中在工作区双击鼠标定位
set selection=exclusive
set selectmode=mouse,key
set helplang=cn
set t_Co=256                 " 启用256色
set backspace=indent,eol,start " 设置使用backspace
filetype plugin on           " 载入文件类型插件
"set relativenumber          " 显示光标所在的当前行的行号，其他行都为相对于该行的相对行号。
set cursorline               " 光标所在的当前行高亮。
set wrap                     " 自动折行，即太长的行分成几行显示。
set linebreak                " 只有遇到指定的符号（比如空格、连词号和其他标点符号），才发生折行。也就是说，不会在单词内部折行。
set laststatus=2             " 是否显示状态栏。0 表示不显示 1表示只在多窗口时显示 2表示显示。两行状态行+一行命令行
set ruler                    " 在状态栏显示光标的当前位置（位于哪一行哪一列）。
set hlsearch                 " 高亮度反白
set incsearch
set clipboard+=unnamed       " 共享剪贴板
set fillchars=vert:\ ,stl:\ ,stlnc:\ " 在被分割的窗口间显示空白，便于阅读
set showmatch                " 高亮显示匹配的括号
set matchtime=1              " 匹配括号高亮的时间（单位是十分之一秒）
set scrolloff=3              " 光标移动到buffer的顶部和底部时保持3行距离
set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 主题设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd vimenter * ++nested colorscheme gruvbox
set bg=dark                  " 背景颜色
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进与排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent        " 按下回车键后，下一行缩进会自动和上一行的缩进保持一致
set tabstop=4         " 按下tab键时 vim显示的空格数
set shiftwidth=4      " 在文本上按下>>（增加一级缩进）、<<（取消一级缩进）或者==（取消全部缩进）时，每一级的字符数。
set expandtab         " 自动将tab转化为空格
set softtabstop=4     " tab转化为多少个空格
set smartindent       " 为C程序提供自动缩进
set cinoptions=g0,:0,N-s,(0 " 设置使用C/C++语言的具体缩进方式
set smarttab          " 在行和段开始处使用制表符
filetype indent on    " 自适应不同语言的智能缩进

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 底部状态栏显示
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set statusline=
set laststatus=2      " 显示两行状态栏
"set cmdheight=2       " 状态栏高度,默认为1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildmenu                    " vim自身命令行模式智能补全
"set wildmode=list:longest      " vim cmdline 补全
set completeopt-=preview,menu   " 补全时不显示窗口，只显示补全列表

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编译
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"按r编译运行
map r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!gcc % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'lua'
    exec "!time lua ./%"
  elseif &filetype == 'cpp'
    exec "!g++ -ltensorflow % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time sh %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  endif
endfunc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"代码折叠
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=syntax       "设置基于语法进行代码折叠
set nofoldenable            "关闭代码折叠

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置 保留 撤销 操作历史
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup          " 从不备份
set noswapfile        " 禁止生成临时文件
set autoread          " 设置当文件被改动时自动载入
set confirm           " 在处理未保存或只读文件的时候，弹出确认
set history=1000      " 设置历史记录条数

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8           "编码
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set langmenu=zh_CN.UTF-8     "语言设置


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 优化设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "
imap jj <Esc>                "映射 esc 键为 jj
map qq :q!<CR>
nmap <Leader>wq :wq<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
let g:plug_url_format = 'git@github.com:%s.git'
" nerdtree
Plug 'scrooloose/nerdtree'

"theme
Plug 'shaijing/gruvbox'

"快速打开大文件
Plug 'vim-scripts/LargeFile'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-m> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" coc
let g:coc_global_extensions = [
        \'coc-clangd',
        \'coc-marketplace',
		\'coc-json',
        \'coc-vimlsp',
        \'coc-sh',
        \'coc-snippets',
        \'coc-pyright',
        \'coc-yaml',
        \'coc-tabnine',
        \'coc-translator',
        \'coc-java',
        \'coc-java-intellicode',
        \'coc-xml',
        \]
