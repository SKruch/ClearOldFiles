 @if (@x)==(@y) @end /***** jscript comment ******
     @echo off
     cscript //E:JScript //nologo "%~f0" %1
     exit /b 0

 @if (@x)==(@y) @end ******  end comment *********/

//JScript
var Args = WScript.Arguments;
//WScript.Echo(Args(0));

var d = new Date();
d.setDate(d.getDate() - Args(0));

var mm=(d.getMonth())+1
if (mm<10){
  mm="0"+mm;
}
var dd=d.getDate();
if (dd<10) {
 dd="0"+dd;
}
//15-05-2004 11:22:12
WScript.Echo(dd+"-"+mm+"-"+d.getFullYear()+" 01:01:00");
