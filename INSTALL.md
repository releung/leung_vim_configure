这个是自己安装过程的记录:
# 安装流程

> vim 配合 Guake(默认 f12 唤醒), 以及 tmux 很好用.

## 1. 
```bash
git clone https://github.com/releung/leung_vim_configure
```

## 2. 
```bash
mv ~/.vimrc ~/vimrc_back
mv ~/.vim ~/.vim_back
```

## 3. 
```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## 4. 
```bash
cp -a leung_vim_configure/.vimrc ~/.vimrc
```

## 5.
```bash
# 打开 vim 执行
:PluginInstall
```

## 6. install vim8
```bash
# add add-apt-repository command
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
# 查看版本
vim --version
```

7. markdown 浏览器自动打开预览
> suan/vim-instant-markdown 插件需要安装以下依赖才可以正常工作
```bash
# 安装 nodejs, npm
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo apt-get install npm

# 更新 npm
sudo npm install npm -g

# 切换国内源，安装
sudo npm config set registry https://registry.npm.taobao.org
sudo npm -g install instant-markdown-d
```

# error 处理
## error 00:

    `The ycmd server SHUT DOWN (restart with ':YcmRestartServer'). YCM co...le YCM before using it. F
    ollow the instructions in the documentation.`

处理:
```bash
cd ~/.vim/bundle/YouCompleteMe
./install.py
```

在 install.py 的时候, 可能会出现如下错误:

    `Could NOT find PythonLibs (missing: PYTHON_INCLUDE_DIRS) (found version "2.7.6")`

处理:

    参考: https://github.com/Yelp/MOE/issues/465

OK, this seems to be a bug in /usr/share/cmake-2.8/Modules/FindPythonLibs.cmake file in Ubuntu 14.04.4, not related to MOE at all.
Following patch fixed the problem, I'm closing the bug:
```patch
diff --git a/FindPythonLibs.cmake b/FindPythonLibs.cmake
index 1cf6bde..61c83d2 100644
--- a/FindPythonLibs.cmake
+++ b/FindPythonLibs.cmake
@@ -190,7 +190,7 @@ mark_as_advanced(
 # cache entries because they are meant to specify the location of a single
 # library. We now set the variables listed by the documentation for this
 # module.
-set(PYTHON_INCLUDE_DIRS "${PYTHON_INCLUDE_DIR}" "${PYTHON_INCLUDE_DIR2}")
+set(PYTHON_INCLUDE_DIRS "${PYTHON_INCLUDE_DIR}")
 set(PYTHON_DEBUG_LIBRARIES "${PYTHON_DEBUG_LIBRARY}")

 # These variables have been historically named in this module different from
```

## error 01:
选择句子不能翻译问题:  
```
[vim-translator] translator.py: error: unrecognized arguments: 
```

处理:  
参考[这里](https://github.com/voldikss/vim-translator/issues/24#issuecomment-683264363)  
~/.vim/bundle/vim-translate-me  
```patch
diff --git a/autoload/translator/util.vim b/autoload/translator/util.vim
index c068101..36c98c0 100644
--- a/autoload/translator/util.vim
+++ b/autoload/translator/util.vim
@@ -153,6 +153,7 @@ function! translator#util#text_proc(text) abort
   let text = substitute(text, "\n\r", ' ', 'g')
   let text = substitute(text, '\v^\s+', '', '')
   let text = substitute(text, '\v\s+$', '', '')
-  let text = shellescape(text)
+   let text = escape(text, '"')
+  let text = printf('"%s"', text)
   return text
 endfunction
```

## error 02: vim 中 fzf 错误

```shell
/home/elliot/.vim/bundle/fzf/bin/fzf'  '--multi' '--prompt' '~/w/k/l/linux-5.0.1/' --expect=ctrl-v,ctrl-x,ctrl-t --no-height > /tmp/vyvfakx/9

# 单独执行段错误
/home/elliot/.vim/bundle/fzf/bin/fzf 

# 解决
cd ~/.vim/bundle/fzf/
git pull
./install

# 再次执行 /home/elliot/.vim/bundle/fzf/bin/fzf, 不会段错误就没问题了


```


