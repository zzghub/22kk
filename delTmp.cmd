set prjNam=keyView

del *.sdf
rmdir release /s /q
rmdir debug   /s /q
rmdir ipch    /s /q

rmdir %cd%\%prjNam%\release /s /q
rmdir %cd%\%prjNam%\debug   /s /q
