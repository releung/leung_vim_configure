这个是自己安装过程的记录:
# 安装流程

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

# error 处理
error 00:

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
