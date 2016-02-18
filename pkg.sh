#!/bin/bash

pkg="./pkg"

if [ ! -d "$pkg" ]
then
    echo "dosen't exist dir named pkg on current dir!"
    exit 1
fi

srcPkg="$1"

if [ ! -d "$srcPkg" ]
then
    echo "dosen't exist dir named $srcPkg on current dir!"
    exit 2
fi

cd $srcPkg
GOOS=linux GOARCH=amd64 go build -o $srcPkg main.go
cd ../
echo "交叉编译完成"

if [ -d "$pkg/$srcPkg" ]
then
    rm -rf "$pkg/$srcPkg"
fi

mkdir $pkg/$srcPkg

cp -rf $srcPkg"/conf" $pkg"/"$srcPkg
cp -rf $srcPkg"/views" $pkg"/"$srcPkg
cp -rf $srcPkg"/"$srcPkg $pkg"/"$srcPkg

cd $pkg

tarFile=$srcPkg".tar.gz"

if [ -f $tarFile ]
then
    rm -f $tarFile
fi

tar -zcvf $tarFile $srcPkg

echo "打包成功，开始上传..."

scp $tarFile sosop@104.129.60.147:/data/

echo "上传成功"

rm -rf $srcPkg
rm -f $tarFile

exit 0
