Dim objFSO, objFile, objStartFolder, objDelFolder, Subfolder, MinMinutesLastAccessed
'=== параметри===
objStartFolder = "E:\#TEMP_E#\____DELETE_1"
MinMinutesLastAccessed = 10080

Set objFSO = CreateObject("Scripting.FileSystemObject")



'Прохід по "кореневій" папці
OutPut_result (objStartFolder)
'Прохід по підпапках
ShowSubfolders objFSO.GetFolder(objStartFolder)
' delete emtpy folder
'Wscript.Echo (vbCrLf &"DELETE folder is empty")
Set oShell = WScript.CreateObject("WScript.Shell")
delFolder = oShell.run("%windir%\System32\cmd.exe /v:on /c (for /f %d in ('dir " & objStartFolder & " /s /b /ad ^| sort /r') do rd ""%d"")", 0, true)


'======== Підпрограма - Прохід по підпапках
Sub ShowSubFolders(Folder)
    For Each Subfolder in Folder.SubFolders
      OutPut_result (Subfolder)
      ShowSubFolders Subfolder
    Next
End Sub

'======= Sub Прохід по папці: аналіз файлів, дії з файлами, виведення результатів.
sub OutPut_result (objStartFolder)
Set objFolder = objFSO.GetFolder(objStartFolder)
'Wscript.Echo (vbCrLf & objFolder.Path & " (Files: " & objFolder.Files.count &", SubFolder: "  & objFolder.SubFolders.Count & ")")
if objFolder.Files.count + objFolder.SubFolders.Count = 0 then
  Wscript.Echo (objStartFolder &"    The folder is empty - delete?")
end if

Set colFiles = objFolder.Files
  For Each objFile in colFiles
'   if objFile.Name = desktop.ini then
   
    if DateDiff("N",objFile.DateLastAccessed, Now) < MinMinutesLastAccessed then 
'      Wscript.Echo (objStartFolder&"\"&objFile.Name & chr(9) &" == Last Accessed: " & objFile.DateLastAccessed & " Minutes since last Accessed: " & DateDiff("N",objFile.DateLastAccessed, Now))
    else
      
      
      Wscript.Echo (objStartFolder&"\"&objFile.Name & chr(9) &" == Last Accessed: " & objFile.DateLastAccessed & " Minutes since last Accessed: " & DateDiff("N",objFile.DateLastAccessed, Now) & " DELETE This Files")
      objFSO.DeleteFile objFile, force
    End If
  Next
End Sub  

' ==== вихід з програми
WScript.Quit(0)


'===== різне
sub DelEmptyFolder (startDelFolder)
   For Each Subfolder in startDelFolder.SubFolders
     Set DelFolder = objFSO.GetFolder(SubFolder)
     Wscript.Echo (vbCrLf & DelFolder.Path & " (Files: " & DelFolder.Files.count &", SubFolder: "  & DelFolder.SubFolders.Count & ")")
     if DelFolder.Files.count + DelFolder.SubFolders.Count = 0 then
       Wscript.Echo (DelFolder &" ==2==   The folder is empty - delete?")
' '  objFSO.DeleteFolder objStartFolder, force
     end if
     DelEmptyFolder Subfolder
   Next
end sub

'=============        
        Wscript.Echo (vbCrLf & Subfolder.Path)
        Set objFolder = objFSO.GetFolder(Subfolder.Path)
        Set colFiles = objFolder.Files
           Wscript.Echo (" The folder is empty - delete?")
        For Each objFile in colFiles
          if DateDiff("N",objFile.DateLastAccessed, Now) < 10080 then 
            Wscript.Echo (Subfolder.Path&"\"&objFile.Name & chr(9) &" == Last Accessed: " & objFile.DateLastAccessed & " Minutes since last Accessed: " & DateDiff("N",objFile.DateLastAccessed, Now))
          else
            Wscript.Echo (Subfolder.Path&"\"&objFile.Name & chr(9) &" == Last Accessed: " & objFile.DateLastAccessed & " Minutes since last Accessed: " & DateDiff("N",objFile.DateLastAccessed, Now) & " DELETE This Files")
          End If
        Next
'        Wscript.Echo



