::用于构建项目所有文件
@echo off 
SET docPath=%gopath%\src\github.com\gogf\gf-doc
SET homePath=%gopath%\src\github.com\gogf\gf-home
SET projectName=gf-doc-offline

if exist %docPath% (
    echo %docPath%
) else (
    echo path "%docPath%" not exist
    goto stop
)

if exist %homePath% (
    echo %homePath%
) else (
    echo path "%homePath%" not exist
    goto stop
)

::复制文档文件
md gf-doc
xcopy %docPath% gf-doc /s /e /y
::复制资源文件
md template
xcopy %homePath%\template template /s /e /y
md public
xcopy %homePath%\public public /s /e /y

SET CGO_ENABLED=0
SET packFiles=config gf-doc public template %projectName%
::win32
SET GOOS=windows
SET GOARCH=386
SET binName=%projectName%-%GOOS%%GOARCH%.exe
go build -o %binName% %homePath%\main.go
ren %binName% %projectName%.exe
7z.exe a %projectName%-%GOOS%%GOARCH%.zip %packFiles%.exe run.bat
del %projectName%.exe /Q

::linux32
SET GOOS=linux
SET GOARCH=386
SET binName=%projectName%-%GOOS%%GOARCH%
go build -o %binName% %homePath%\main.go
ren %binName% %projectName%
7z.exe a %projectName%-%GOOS%%GOARCH%.zip %packFiles%
del %projectName% /Q


::darwin32
SET GOOS=darwin
SET GOARCH=386
SET binName=%projectName%-%GOOS%%GOARCH%
go build -o %binName% %homePath%\main.go
ren %binName% %projectName%
7z.exe a %projectName%-%GOOS%%GOARCH%.zip %packFiles%
del %projectName% /Q


REM GOOS：目标平台的操作系统（darwin、freebsd、linux、windows） 
REM GOARCH：目标平台的体系架构（386、amd64、arm） 
REM 交叉编译不支持 CGO 所以要禁用它

:stop
pause
