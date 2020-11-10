::用于构建项目所有文件
@echo off
SET basePath=%cd%
SET projectName=gf-doc-offline
echo basePath: %basePath%
SET tempPath=%basePath%\build_temp
echo tempPath: %tempPath%
if not exist %tempPath% (
    mkdir %tempPath%
)

SET docPath=%tempPath%\gf-doc
SET homePath=%tempPath%\gf-home
echo docPath: %docPath%

if not exist %docPath% (
    echo path "%docPath%" not exist
    cd %tempPath%
    git clone https://github.com/gogf/gf-doc.git
)

echo homePath: %homePath%
if not exist %homePath% (
    echo path "%homePath%" not exist
    cd %tempPath%
    git clone https://github.com/gogf/gf-home.git
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
SET GO111MODULE=on
SET packFiles=config gf-doc public template %projectName%

@REM start build

::win32
echo "build win32"
cd %homePath%
SET GOOS=windows
SET GOARCH=386
SET binName=%homePath%\%projectName%-%GOOS%%GOARCH%.exe
go build -o %binName% %homePath%\main.go
cd %basePath%
copy %binName% %projectName%.exe
7z.exe a %projectName%-%GOOS%%GOARCH%.zip %packFiles%.exe run.bat
del %projectName%.exe /Q
del %binName% /Q

::linux32
echo "build linux32"
cd %homePath%
SET GOOS=linux
SET GOARCH=386
SET binName=%homePath%\%projectName%-%GOOS%%GOARCH%
go build -o %binName% %homePath%\main.go
cd %basePath%
copy %binName% %projectName%
7z.exe a %projectName%-%GOOS%%GOARCH%.zip %packFiles%
del %projectName% /Q
del %binName% /Q

::linux64
echo "build linux64"
cd %homePath%
SET GOOS=linux
SET GOARCH=amd64
SET binName=%homePath%\%projectName%-%GOOS%%GOARCH%
go build -o %binName% %homePath%\main.go
cd %basePath%
copy %binName% %projectName%
7z.exe a %projectName%-%GOOS%%GOARCH%.zip %packFiles%
del %projectName% /Q
del %binName% /Q

@REM cmd/go: unsupported GOOS/GOARCH pair darwin/386
@REM ::darwin32
@REM echo "build darwin32"
@REM cd %homePath%
@REM SET GOOS=darwin
@REM SET GOARCH=386
@REM SET binName=%homePath%\%projectName%-%GOOS%%GOARCH%
@REM echo go build -o %binName% %homePath%\main.go
@REM cd %basePath%
@REM copy %binName% %projectName%
@REM 7z.exe a %projectName%-%GOOS%%GOARCH%.zip %packFiles%
@REM del %projectName% /Q
@REM del %binName% /Q

::darwin64
echo "build darwin64"
cd %homePath%
SET GOOS=darwin
SET GOARCH=amd64
SET binName=%homePath%\%projectName%-%GOOS%%GOARCH%
go build -o %binName% %homePath%\main.go
cd %basePath%
copy %binName% %projectName%
7z.exe a %projectName%-%GOOS%%GOARCH%.zip %packFiles%
del %projectName% /Q
del %binName% /Q

REM GOOS：目标平台的操作系统（darwin、freebsd、linux、windows） 
REM GOARCH：目标平台的体系架构（386、amd64、arm） 
REM 交叉编译不支持 CGO 所以要禁用它

@REM goto stop

:stop
pause
