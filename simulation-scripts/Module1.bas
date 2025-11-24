Attribute VB_Name = "Module1"
' Makro ini akan berjalan secara otomatis saat dokumen dibuka dan konten diaktifkan.
' Ini mensimulasikan TTP SilverTerrier yang menggunakan dokumen sebagai vektor.
Sub AutoOpen()
    ' Panggil fungsi utama kita
    ExecutePayload
End Sub

' Fungsi untuk menjalankan payload simulasi
Function ExecutePayload()
    ' Perintah ini hanya akan membuka Notepad sebagai payload yang aman.
    ' Dalam serangan nyata, ini akan menjadi perintah untuk mengunduh malware.
    ' Wazuh akan mendeteksi WINWORD.EXE yang menjalankan powershell.exe
    Dim command As String
    command = "powershell.exe -w hidden -c ""Start-Process notepad.exe"""

    ' Buat objek shell untuk menjalankan perintah
    Dim shell As Object
    Set shell = CreateObject("WScript.Shell")
    shell.Run command, 0, False ' Angka 0 menyembunyikan jendela

End Function
