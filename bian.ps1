Set-Location $PSScriptRoot

$ndk = "C:\Users\Administrator\AppData\Local\Android\Sdk\ndk\28.2.13676358"
$make = "$ndk\prebuilt\windows-x86_64\bin\make.exe"
$clang = "$ndk\toolchains\llvm\prebuilt\windows-x86_64\bin\aarch64-linux-android35-clang.cmd"

# Makefile 中硬编码了 linux-x86_64，在 Windows 上改为 windows-x86_64
$target = "xperia1vi-jp-69.2.A.4.24"

& $make TARGET=$target TARGET_CC="$clang" ANDROID_NDK_HOME="$ndk"

if ($LASTEXITCODE -ne 0) {
    Write-Host "BUILD FAILED" -ForegroundColor Red
    exit 1
}
Write-Host "BUILD OK: $target" -ForegroundColor Green
