rem @echo off
SET origin=
SET destination=

SET origin_dir=/cygdrive/C/FolderToCopy
SET origin_local_copy_dir=/cygdrive/C/CopyFolder
SET destination_address=username@domain::Folder/%origin%

SET exclude={"DataToExclude/TMP/*"}
