$PBExportHeader$pbfileservice.sra
$PBExportComments$Generated Application Object
forward
global type pbfileservice from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
string gs_dir
end variables

global type pbfileservice from application
string appname = "pbfileservice"
string themepath = "C:\Program Files (x86)\Appeon\PowerBuilder 21.0\IDE\theme"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = false
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 2
long richtexteditx64type = 3
long richtexteditversion = 1
string richtexteditkey = ""
string appicon = "icono.ico"
string appruntimeversion = "22.0.0.1878"
boolean manualsession = false
boolean unsupportedapierror = false
end type
global pbfileservice pbfileservice

type prototypes
//Funcion para tomar el directorio de la aplicacion
FUNCTION int GetModuleFileNameW(ulong hinstModule, REF string lpszPath,  ulong cchPath) LIBRARY "kernel32"
end prototypes

on pbfileservice.create
appname="pbfileservice"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on pbfileservice.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;String ls_Path
unsignedlong lul_handle

ls_Path = space(1024)
lul_handle = Handle(GetApplication())
GetModuleFilenameW(lul_handle, ls_Path, 1024)

if right(UPPER(ls_path), 9)="PB210.EXE" then
	ls_path="C:\projecto pw2021\Blog\pbfileservice\pbfileservice.exe"
end if

gs_dir=left(ls_path, len(ls_path) - 17)

Open(w_main)
end event

