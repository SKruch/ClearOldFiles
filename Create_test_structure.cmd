@echo off

set Root=E:\#TEMP_E#\____DELETE_1

pushd %Root%

FOR %%G IN (_DIR_new\_SubDir, _DIR_old_3Day\_SubDir, _DIR_old_7Day\_SubDir, _DIR_old_10Day\_SubDir, Empty_Dir, Empty_SubDir\Empty_Dir ) DO (
  @md %Root%\test\_%%G
  echo test >%Root%\test\_%%G\file_new.txt
  echo test >%Root%\test\_%%G\file_old_7Day.txt
  echo test >%Root%\test\_%%G\file_old_10Day.txt
  echo test >%Root%\test\_%%G\file_old_300Day.txt
  nircmd setfiletime "" "15-05-2004 11:22:12" "22-01-2005 21:22:55"
  >%Root%\test\_%%G\file_old_7Day.txt
  >%Root%\test\_%%G\file_old_10Day.txt
  >%Root%\test\_%%G\file_old_300Day.txt
)

FOR %%G IN (Empty_Dir, Empty_SubDir\Empty_Dir ) DO (
  @md %Root%\test\_%%G
)



popd
exit 0




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



