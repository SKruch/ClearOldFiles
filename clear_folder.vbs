Dim objFSO, objFile, objStartFolder, objDelFolder, Subfolder, MinMinutesLastAccessed, delFolder, counter, SkippedFolders, SkippedFiles
Dim oShell, PathDelFolder, MarkSkipFolder, SkFd, Folder, colFiles, objFolder, MarkSkipFile, SkFi, objLogFile, LogFile

'=== parameters ===
objStartFolder = "E:\#TEMP_E#\____DELETE_1\test" '"Root" folder for Clean
LogFile="_clear.log" ' Log file result programm Clean
MinMinutesLastAccessed = 10080 '7 days
'List folder for skip (Massive)
SkippedFolders = Array( _
"_Empty_Dir_Skip", _
"_Empty_Dir_Skip1", _
"_Empty_Dir_Skip2", _
"_Empty_Dir_Skip3" _
)
'List file name for skip (Massive)
SkippedFiles = Array("desktop.ini", "_clear.log")
'=== end parameters ===

Set objFSO = CreateObject("Scripting.FileSystemObject")
' Start programm, Write start to LogFile
WriteLog (vbCrLf &"Start run programm " & date()&" " & time())

'Traversing the "root" folder
WriteLog (vbCrLf &"    Delete files with old access")
OutPut_result (objStartFolder)

'Traversing subfolders
ShowSubfolders objFSO.GetFolder(objStartFolder)

'Delete empty folder
WriteLog (vbCrLf & "    Delete Empty folder")
Set oShell = WScript.CreateObject("WScript.Shell")
Set delFolder = oShell.exec("%windir%\System32\cmd.exe /v:on /c (dir " & objStartFolder & " /s /b /ad | sort /r)")
Do While delFolder.Status = 0
     WScript.Sleep 100
Loop
' Loop to get the output
Set TextStream = delFolder.StdOut
While Not TextStream.AtEndOfStream
'  WScript.Echo counter&" =While= " & Str & Trim(TextStream.ReadLine()) 
  PathDelFolder = Trim(TextStream.ReadLine())
  Set objDelFolder = objFSO.GetFolder(PathDelFolder)
  ' While for skipped folder and creating a skip flag
  MarkSkipFolder = 0
  For Each SkFd In SkippedFolders
'    WScript.Echo "PathDelFolder = "& PathDelFolder & "    SkippedFolders = " & objStartFolder & "\" & SkFd
    if PathDelFolder = (objStartFolder&"\"&SkFd) then
       WriteLog ( PathDelFolder & chr(9)&" == This folder is SKIPPED")
       MarkSkipFolder = 1
    end if
  Next
  if (MarkSkipFolder = 0) and (objDelFolder.Files.count + objDelFolder.SubFolders.Count = 0) then
    WriteLog (PathDelFolder & chr(9)&" == The folder is empty - DELETE")
    objFSO.DeleteFolder PathDelFolder, force
'  elseif objDelFolder.Files.count + objDelFolder.SubFolders.Count <> 0 then 
'    WriteLog (PathDelFolder & chr(9)&" == The folder is NOT EMPTY - Files: " & objDelFolder.Files.count & ", SubFolder: " & objDelFolder.SubFolders.Count)
  end if
Wend
'end delete empty folder

' End programm write this to log
WriteLog (vbCrLf &"End run programm " & date()&" " & time())

'======== Subroutine - Traversing subfolders
Sub ShowSubFolders(Folder)
  For Each Subfolder in Folder.SubFolders
    OutPut_result (Subfolder)
    ShowSubFolders Subfolder
  Next
End Sub

'======= Sub Subroutine - Folder traversal: file analysis, file actions, output of results.
sub OutPut_result (objStartFolder)
Set objFolder = objFSO.GetFolder(objStartFolder)
'WriteLog (vbCrLf & objFolder.Path & " (Files: " & objFolder.Files.count &", SubFolder: "  & objFolder.SubFolders.Count & ")")
'if objFolder.Files.count + objFolder.SubFolders.Count = 0 then
'  WriteLog (objStartFolder &"    The folder is empty - delete?")
'end if

Set colFiles = objFolder.Files
For Each objFile in colFiles
' loop in massive (skipped files) and create a skip flag
    MarkSkipFile = 0
    For Each SkFi In SkippedFiles
'      WScript.Echo "objFile.Name = "& objFile.Name & "    SkFi = " &  SkFi
      if objFile.Name = SkFi then
        WriteLog (objFile & chr(9) &" ==  This file is SKIPPED ")
        MarkSkipFile = 1
      end if
    Next
 if (MarkSkipFile = 0) and (DateDiff("N",objFile.DateLastAccessed, Now) > MinMinutesLastAccessed) then 
    WriteLog (objStartFolder&"\"&objFile.Name & chr(9) &" == Last Accessed: " & objFile.DateLastAccessed & " Minutes since last Accessed: " & DateDiff("N",objFile.DateLastAccessed, Now) & ", DELETE This Files")
    objFSO.DeleteFile (objStartFolder&"\"&objFile.Name), force
' elseif (MarkSkipFile = 0) then
'    WriteLog (objStartFolder&"\"&objFile.Name & chr(9) &" == Last Accessed: " & objFile.DateLastAccessed & " Minutes since last Accessed: " & DateDiff("N",objFile.DateLastAccessed, Now) & ", Skip, NO Delete")
 End If
Next
End Sub  

' Write text to the end of a log file. If the file does not exist, try to create it
sub WriteLog (Message)
If objFSO.FileExists(objStartFolder&"\"&LogFile) Then
  Set objLogFile = objFSO.OpenTextFile(objStartFolder&"\"&LogFile, 8, True)
Else
    Set objLogFile = objFSO.CreateTextFile(objStartFolder&"\"&LogFile, True)
end if
objLogFile.Writeline (Message)
objLogFile.Close
End Sub

' ==== 
WScript.Quit(0)
'==============================================================================================================================================================================