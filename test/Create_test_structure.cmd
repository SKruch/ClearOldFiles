@echo off

set Root=E:\#TEMP_E#\____DELETE_1

pushd %Root%
:: test folder
FOR %%G IN (_DIR_new\_SubDir, _DIR_old_3Day\_SubDir, _DIR_old_7Day\_SubDir, _DIR_old_10Day\_SubDir, _DIR_new, _DIR_old_3Day, _DIR_old_7Day, _DIR_old_10Day) DO (
  @echo FOLDER: %Root%\test\_%%G
  if not exist %Root%\test\_%%G (mkdir %Root%\test\_%%G)
  echo test >%Root%\test\_%%G\file_new.txt
  for %%f in (3, 7, 10, 100) do (
   echo test >%Root%\test\_%%G\file_old_%%fDay.txt
   for /F %%a in ('%~dp0GetDate.cmd %%f') do (%~dp0nircmdc.exe setfiletime "%Root%\test\_%%G\file_old_%%fDay.txt"  "%%a" "%%a" "%%a")
  )
)

:: Empty folder
FOR %%G IN (Empty_Dir, Empty_SubDir\Empty_Dir ) DO (
  @echo FOLDER: %Root%\test\_%%G
  if not exist %Root%\test\_%%G (mkdir %Root%\test\_%%G)
)



popd
exit 0

:setfiletime


mkdir %Root%\test\_DIR_new\_SubDir
mkdir %Root%\test\_DIR_old_3Day\_SubDir
mkdir %Root%\test\_DIR_old_7Day\_SubDir
mkdir %Root%\test\_DIR_old_10Day\_SubDir
mkdir %Root%\test\Empty_Dir
mkdir %Root%\test\Empty_SubDir\Empty_Dir

echo test >%Root%\test\_DIR_new\file_new.txt
echo test >%Root%\test\_DIR_new\file_old_7Day.txt
echo test >%Root%\test\_DIR_new\file_old_10Day.txt
echo test >%Root%\test\_DIR_new\file_old_300Day.txt

echo test >%Root%\test\_DIR_new\_SubDir\file_new.txt
echo test >%Root%\test\_DIR_new\_SubDir\file_old_7Day.txt
echo test >%Root%\test\_DIR_new\_SubDir\file_old_10Day.txt
echo test >%Root%\test\_DIR_new\_SubDir\file_old_300Day.txt


echo test >%Root%\test\_DIR_new\file_new.txt
echo test >%Root%\test\_DIR_\file_old_7Day.txt
echo test >%Root%\test\_DIR_new\fileold_10Day.txt
echo test >%Root%\test\_DIR_new\fileold_300Day.txt



