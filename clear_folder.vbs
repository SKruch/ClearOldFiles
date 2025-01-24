Dim objFSO, objFile
'Set objFSO = CreateObject("scripting.filesystemobject")

'Set objFile = objFSO.GetFile("d:\GPO-res.html")
'Wscript.Echo ("d:\GPO-res.html")

'WScript.Echo "Minutes since last modified: " & DateDiff("N",objFile.DateLastModified, Now)
'WScript.Echo "Last Modified: " & objFile.DateLastModified
'WScript.Echo "Minutes since last Accessed: " & DateDiff("N",objFile.DateLastAccessed, Now)
'WScript.Echo "Last Accessed: " & objFile.DateLastAccessed

'=======================================

Set objFSO = CreateObject("Scripting.FileSystemObject")
objStartFolder = "E:\#TEMP_E#\____DELETE_1"

Set objFolder = objFSO.GetFolder(objStartFolder)
Wscript.Echo (vbCrLf & objFolder.Path)
Set colFiles = objFolder.Files
For Each objFile in colFiles
'    Wscript.Echo objStartFolder&"\"&objFile.Name
    if DateDiff("N",objFile.DateLastAccessed, Now) < 10080 then 
      Wscript.Echo (objStartFolder&"\"&objFile.Name & chr(9) &" == Last Accessed: " & objFile.DateLastAccessed & " Minutes since last Accessed: " & DateDiff("N",objFile.DateLastAccessed, Now))
    else
      Wscript.Echo (objStartFolder&"\"&objFile.Name & chr(9) &" == Last Accessed: " & objFile.DateLastAccessed & " Minutes since last Accessed: " & DateDiff("N",objFile.DateLastAccessed, Now) & " DELETE This Files")
    End If


Next
'Wscript.Echo

ShowSubfolders objFSO.GetFolder(objStartFolder)

Sub ShowSubFolders(Folder)
    For Each Subfolder in Folder.SubFolders
        Wscript.Echo (vbCrLf & Subfolder.Path)
        Set objFolder = objFSO.GetFolder(Subfolder.Path)
        Set colFiles = objFolder.Files
        For Each objFile in colFiles
          if DateDiff("N",objFile.DateLastAccessed, Now) < 10080 then 
            Wscript.Echo (Subfolder.Path&"\"&objFile.Name & chr(9) &" == Last Accessed: " & objFile.DateLastAccessed & " Minutes since last Accessed: " & DateDiff("N",objFile.DateLastAccessed, Now))
          else
            Wscript.Echo (Subfolder.Path&"\"&objFile.Name & chr(9) &" == Last Accessed: " & objFile.DateLastAccessed & " Minutes since last Accessed: " & DateDiff("N",objFile.DateLastAccessed, Now) & " DELETE This Files")
          End If
        Next
'        Wscript.Echo
        ShowSubFolders Subfolder
    Next
End Sub
