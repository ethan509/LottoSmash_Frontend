@echo off
chcp 65001 >nul
setlocal

set ADB=%LOCALAPPDATA%\Android\Sdk\platform-tools\adb.exe

echo [LottoSmash Dev] ADB reverse 설정 중...
"%ADB%" reverse tcp:8080 tcp:8080
if %ERRORLEVEL% neq 0 (
    echo [오류] ADB reverse 실패. 기기가 연결되어 있는지 확인하세요.
    pause
    exit /b 1
)
echo [OK] localhost:8080 터널 설정 완료

echo.
echo [LottoSmash Dev] Flutter 실행...
flutter run

endlocal
