#!/bin/sh

# 下载相关文件
wget https://oligarchy.co.uk/xapian/1.4.23/xapian-bindings-1.4.23.tar.xz
wget https://oligarchy.co.uk/xapian/1.4.23/xapian-core-1.4.23.tar.xz
# 安装python依赖
pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip3 install sphinx
# 安装 xapian-core
tar -xf xapian-core-1.4.23.tar.xz
cd xapian-core-1.4.23
./configure
make -j12 install 
cd ..
# 安装
tar -xf xapian-bindings-1.4.23.tar.xz
cd xapian-bindings-1.4.23
./configure --with-python3 
make -j12 install || true
cd ..
rm -rf xapian-*
rm -rf get-pip.py
pip cache purge
apk cache clean
apk cache purge
rm install.sh
