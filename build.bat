@echo off 
SET docPath=%gopath%\src\github.com\gogf\gf-doc
SET homePath=%gopath%\src\github.com\gogf\gf-home
echo %docPath%
echo %homePath%
::复制文档文件
md gf-doc
xcopy %docPath% gf-doc /s /e /y
::复制资源文件
md template
xcopy %homePath%\template template /s /e /y
md public
xcopy %homePath%\public public /s /e /y

go build -o gf-home.exe %homePath%\main.go