setlocal
echo off

set DEVTOOL=%TEST_BED_BIN_DIR%\DevTool.exe
if exist %DEVTOOL% goto CheckDevToolPathingSuccess

set DEVTOOL=..\..\..\Gui\testfiles\DevTool.exe
if exist %DEVTOOL% goto CheckDevToolPathingSuccess

echo *************************************************
echo UNABLE TO FIND THE DEVELOPMENT TOOL!
echo *************************************************
goto errors

:CheckDevToolPathingSuccess

echo .
echo %DEVTOOL%
echo .

echo .
del *.coff *.elf *.eao *.report *_scm.* *_struct.h *_idata.* *_defines.h *_ana.html *.o *.map
echo .

echo Running Dev Tool Test ...
%DEVTOOL% -p=Proj.ETpuIdeProj -AutoRun -AutoBuild  -ForceDemoIde  -ForceDemoEtec
if  %ERRORLEVEL% NEQ 0 ( goto errors )

echo Demo Test Passes

goto end
:errors
echo *************************************************
echo        YIKES, WE GOT ERRORS!!
echo *************************************************
exit /b -1
:end
exit /b 0