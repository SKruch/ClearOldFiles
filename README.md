# ClearOldFiles

My temporary folder (%TEMP%) is cleared every time I turn_on/restart my computer.

However, I created several folders in which there are files that I work with for a certain period of time and then they become unnecessary. These can be installation files, temporary documents, photos, pictures, etc.
Since there can be a lot of such files even during a working day, sorting them and deleting the oldest ones is not productive...
This program goes through the specified folders and deletes files from them that were not used (not created, but used (a property of the NTFS file system) for a certain period of time. Also, if empty folders remain after deleting files, they must also be deleted.

Of course, this can be done quite simply through the forfiles.exe program. But it does not know how to work with the file attribute "access", but works only with the attribute "Modified/Written".

In addition, I keep a log of when a file was deleted and there are several files that cannot be deleted.

This prompted me to write this program.

From now on, I will only write the description in Ukrainian.
For those who are interested, Google Translate will help.

==================================

UKR

Моя тимчасова папка (%TEMP%) очищається кожного разу, коли я вмикаю/перезавантажую комп’ютер.

Проте я створив декілька папок у яких знаходяться файли з якими працю впродовж деякого періоду часу і потім вони стають непотрібні. Це можуть бути інсталяційні файли, тимчасові документи, фото, картинки та інше.
Оскільки таких файлів навіть впродовж робочого дня може бути багато займатись їх сортуванням та видаленням найстаріших не продуктивно...
Ця програма проходить по визначеним папкам і видаляє з них файли якими не користувались (не створених, а саме використаних (властивість файлової системи NTFS) впродовж визначеного проміжку часу. Також якщо після видалення файлів залишаються порожні папки то вони теж підлягають видаленню.

Звичайно це можна досить просто зробити через програму forfiles.exe. Але вона не вміє працювати з атрибутом файлу "доступ", а працює тільки з атрибутом "Модифіковано/Записано".

Крім цього в мене ведеться журнал коли який файл видалено і є декілька файлів котрі не можна видаляти. 

Це спонукало мене до написання цієї програми.

VS code через Git

