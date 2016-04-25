@echo off
:-
:-  Build script for iMatix GSLgen Code Generator, for generic MS-DOS.
:-  Requires the iMatix 'c' batch file.
:-
:-  Generated by Otto v2.2 from buildgsl.txt on 100/02/20, 15:35:59
:-  For more info see Otto documentation at http://www.imatix.com.
:-  Bug reports & questions to <ph@imatix.com>
:-  ---------------------------------------------------------------
:-
echo Building the iMatix GSLgen Code Generator
echo Press [Enter] to continue, or Ctrl-C to abort.
if .%1==. pause >nul
echo Checking for required files...

:-  require $LIB libsfl
if exist libsfl.lib goto end_1
if exist \usr\lib\libsfl.lib goto end_1
    echo libsfl.lib missing - aborting
    goto exit
:end_1

:-  require ggcode.c ggcode.l ggcode.d ggcode.i ggcode.h
if exist ggcode.c goto end_2
    echo ggcode.c missing - aborting
    goto exit
:end_2
if exist ggcode.l goto end_3
    echo ggcode.l missing - aborting
    goto exit
:end_3
if exist ggcode.d goto end_4
    echo ggcode.d missing - aborting
    goto exit
:end_4
if exist ggcode.i goto end_5
    echo ggcode.i missing - aborting
    goto exit
:end_5
if exist ggcode.h goto end_6
    echo ggcode.h missing - aborting
    goto exit
:end_6

:-  require ggpars.c ggpars.l ggpars.d ggpars.i ggpars.h
if exist ggpars.c goto end_7
    echo ggpars.c missing - aborting
    goto exit
:end_7
if exist ggpars.l goto end_8
    echo ggpars.l missing - aborting
    goto exit
:end_8
if exist ggpars.d goto end_9
    echo ggpars.d missing - aborting
    goto exit
:end_9
if exist ggpars.i goto end_10
    echo ggpars.i missing - aborting
    goto exit
:end_10
if exist ggpars.h goto end_11
    echo ggpars.h missing - aborting
    goto exit
:end_11

:-  require gslgen.c gslgen.l gslgen.d gslgen.i
if exist gslgen.c goto end_12
    echo gslgen.c missing - aborting
    goto exit
:end_12
if exist gslgen.l goto end_13
    echo gslgen.l missing - aborting
    goto exit
:end_13
if exist gslgen.d goto end_14
    echo gslgen.d missing - aborting
    goto exit
:end_14
if exist gslgen.i goto end_15
    echo gslgen.i missing - aborting
    goto exit
:end_15

:-  require ggeval.c ggeval.h
if exist ggeval.c goto end_16
    echo ggeval.c missing - aborting
    goto exit
:end_16
if exist ggeval.h goto end_17
    echo ggeval.h missing - aborting
    goto exit
:end_17

:-  require ggcomm.c ggcomm.h
if exist ggcomm.c goto end_18
    echo ggcomm.c missing - aborting
    goto exit
:end_18
if exist ggcomm.h goto end_19
    echo ggcomm.h missing - aborting
    goto exit
:end_19

:-  require ggobjt.c ggobjt.h
if exist ggobjt.c goto end_20
    echo ggobjt.c missing - aborting
    goto exit
:end_20
if exist ggobjt.h goto end_21
    echo ggobjt.h missing - aborting
    goto exit
:end_21

:-  require ggfunc.c ggfunc.h
if exist ggfunc.c goto end_22
    echo ggfunc.c missing - aborting
    goto exit
:end_22
if exist ggfunc.h goto end_23
    echo ggfunc.h missing - aborting
    goto exit
:end_23

:-  require ggfile.c ggfile.h
if exist ggfile.c goto end_24
    echo ggfile.c missing - aborting
    goto exit
:end_24
if exist ggfile.h goto end_25
    echo ggfile.h missing - aborting
    goto exit
:end_25

:-  require ggstrn.c ggstrn.h
if exist ggstrn.c goto end_26
    echo ggstrn.c missing - aborting
    goto exit
:end_26
if exist ggstrn.h goto end_27
    echo ggstrn.h missing - aborting
    goto exit
:end_27

:-  require license.txt
if exist license.txt goto end_28
    echo license.txt missing - aborting
    goto exit
:end_28

:-  delete $lib libgsl
if exist libgsl.lib del libgsl.lib

:-  library libgsl

:-  compile ggcode ggpars ggeval ggcomm ggobjt ggfunc ggfile ggstrn
call c ggcode
if not exist ggcode.obj goto exit
call c -r libgsl.lib ggcode
call c ggpars
if not exist ggpars.obj goto exit
call c -r libgsl.lib ggpars
call c ggeval
if not exist ggeval.obj goto exit
call c -r libgsl.lib ggeval
call c ggcomm
if not exist ggcomm.obj goto exit
call c -r libgsl.lib ggcomm
call c ggobjt
if not exist ggobjt.obj goto exit
call c -r libgsl.lib ggobjt
call c ggfunc
if not exist ggfunc.obj goto exit
call c -r libgsl.lib ggfunc
call c ggfile
if not exist ggfile.obj goto exit
call c -r libgsl.lib ggfile
call c ggstrn
if not exist ggstrn.obj goto exit
call c -r libgsl.lib ggstrn

:-  library

:-  compile gslgen
call c gslgen
if not exist gslgen.obj goto exit

:-  link    gslgen
call c -L gslgen

:exit
:-- end script
