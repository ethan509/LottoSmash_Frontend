# adb_watch.ps1
# ADB reverse tcp:8080 자동 유지 워처
# USB 재연결 / ADB 재시작 시 자동으로 재설정합니다.
# 실행: PowerShell -ExecutionPolicy Bypass -File adb_watch.ps1

$ADB = "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe"
$Port = 8080
$CheckInterval = 5  # 초

Write-Host "[adb_watch] 시작 (간격: ${CheckInterval}초) — Ctrl+C로 종료" -ForegroundColor Cyan

function Get-ConnectedDevice {
    $output = & $ADB devices 2>&1
    # "device" 상태인 라인이 있으면 연결됨
    return ($output | Select-String -Pattern "^\w+\s+device$").Count -gt 0
}

function Test-ReverseActive {
    $output = & $ADB reverse --list 2>&1
    return ($output | Select-String -Pattern "tcp:$Port").Count -gt 0
}

while ($true) {
    if (Get-ConnectedDevice) {
        if (-not (Test-ReverseActive)) {
            $result = & $ADB reverse tcp:$Port tcp:$Port 2>&1
            if ($LASTEXITCODE -eq 0) {
                $time = Get-Date -Format "HH:mm:ss"
                Write-Host "[$time] ADB reverse tcp:$Port 설정 완료" -ForegroundColor Green
            } else {
                Write-Host "[오류] ADB reverse 실패: $result" -ForegroundColor Red
            }
        }
    }
    Start-Sleep -Seconds $CheckInterval
}
