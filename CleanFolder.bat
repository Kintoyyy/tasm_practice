@echo off
:: Delete all .obj files except IO.OBJ
for %%f in (*.obj) do (
    if /I not "%%f"=="IO.OBJ" del /q "%%f"
)

:: Delete all .map files
del /q *.map

:: Delete all .exe files except tlink.exe and tasm.exe
for %%f in (*.exe) do (
    if /I not "%%f"=="tlink.exe" if /I not "%%f"=="tasm.exe" del /q "%%f"
)

:: Notify the user
echo All .obj, .map, and .exe files (except IO.OBJ, tlink.exe, and tasm.exe) have been deleted from the current folder.
pause
