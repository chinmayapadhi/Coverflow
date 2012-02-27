# ==============================================================================
# Generated by qmake (2.01a) (Qt 4.7.0) on: Wed 18. Aug 15:08:31 2010
# This file is generated by qmake and should not be modified by the
# user.
#  Name        : T:/projects/cflow//Makefile
#  Description : Wrapper Makefile for calling Symbian build tools
#
# ==============================================================================


MAKEFILE          = Makefile
QMAKE             = \epoc32\tools\qmake.exe
DEL_FILE          = del 2> NUL
DEL_DIR           = rmdir
CHK_DIR_EXISTS    = if not exist
MKDIR             = mkdir
MOVE              = move
DEBUG_PLATFORMS   = winscw gcce armv5 armv6
RELEASE_PLATFORMS = gcce armv5 armv6
MAKE              = make
SBS               = sbs

DEFINES	 = -DSYMBIAN -DUNICODE -DQT_KEYPAD_NAVIGATION -DQT_SOFTKEYS_ENABLED -DQT_USE_MATH_H_FLOATS -DQT_DECLARATIVE_LIB -DQT_SQL_LIB -DQT_GUI_LIB -DQT_NETWORK_LIB -DQT_CORE_LIB
INCPATH	 =  -I"T:/epoc32/include/mw/QtCore"  -I"T:/epoc32/include/mw/QtNetwork"  -I"T:/epoc32/include/mw/QtGui"  -I"T:/epoc32/include/mw/QtSql"  -I"T:/epoc32/include/mw/QtDeclarative"  -I"T:/epoc32/include/mw"  -I"T:/sf/mw/qt/mkspecs/common/symbian"  -I"T:/epoc32/include"  -I"T:/epoc32/include/stdapis"  -I"T:/epoc32/include/stdapis/sys"  -I"T:/epoc32/include/platform/mw"  -I"T:/epoc32/include/platform"  -I"T:/epoc32/include/platform/loc"  -I"T:/epoc32/include/platform/mw/loc"  -I"T:/epoc32/include/platform/loc/sc"  -I"T:/epoc32/include/platform/mw/loc/sc"  -I"T:/projects/cflow/cpp"  -I"T:/epoc32/include/stdapis/stlportv5"  -I"T:/projects/cflow" 
first: default
default: debug-winscw
all: debug release

qmake:
	$(QMAKE) -spec symbian-sbsv2 -o "bld.inf" "T:/projects/cflow/MusicPlayer.pro"

bld.inf:
	$(QMAKE)

debug: bld.inf
	$(SBS) -c winscw_udeb.mwccinc -c gcce_udeb -c armv5_udeb -c armv6_udeb
release: bld.inf
	$(SBS) -c gcce_urel -c armv5_urel -c armv6_urel
debug-winscw: bld.inf
	$(SBS) -c winscw_udeb.mwccinc
debug-gcce: bld.inf
	$(SBS) -c gcce_udeb
debug-armv5: bld.inf
	$(SBS) -c armv5_udeb
debug-armv6: bld.inf
	$(SBS) -c armv6_udeb
release-gcce: bld.inf
	$(SBS) -c gcce_urel
release-armv5: bld.inf
	$(SBS) -c armv5_urel
release-armv6: bld.inf
	$(SBS) -c armv6_urel

export: bld.inf
	$(SBS) export

cleanexport: bld.inf
	$(SBS) cleanexport

check: first

run:
	call /epoc32/release/winscw/udeb/MusicPlayer.exe $(QT_RUN_OPTIONS)

runonphone: sis
	runonphone $(QT_RUN_ON_PHONE_OPTIONS) --sis MusicPlayer.sis MusicPlayer.exe $(QT_RUN_OPTIONS)

sis:
	$(if $(wildcard MusicPlayer_template.pkg), $(if $(wildcard .make.cache), $(MAKE) -f $(MAKEFILE) ok_sis MAKEFILES=.make.cache , $(if $(QT_SIS_TARGET), $(MAKE) -f $(MAKEFILE) ok_sis , $(MAKE) -f $(MAKEFILE) fail_sis_nocache ) ) , $(MAKE) -f $(MAKEFILE) fail_sis_nopkg )

ok_sis:
	createpackage.bat $(QT_SIS_OPTIONS) MusicPlayer_template.pkg $(QT_SIS_TARGET) $(QT_SIS_CERTIFICATE) $(QT_SIS_KEY) $(QT_SIS_PASSPHRASE)

unsigned_sis:
	$(if $(wildcard MusicPlayer_template.pkg), $(if $(wildcard .make.cache), $(MAKE) -f $(MAKEFILE) ok_unsigned_sis MAKEFILES=.make.cache , $(if $(QT_SIS_TARGET), $(MAKE) -f $(MAKEFILE) ok_unsigned_sis , $(MAKE) -f $(MAKEFILE) fail_sis_nocache ) ) , $(MAKE) -f $(MAKEFILE) fail_sis_nopkg )

ok_unsigned_sis:
	createpackage.bat $(QT_SIS_OPTIONS) -o MusicPlayer_template.pkg $(QT_SIS_TARGET)

MusicPlayer.sis:
	$(MAKE) -f $(MAKEFILE) sis

installer_sis: MusicPlayer.sis
	$(if $(wildcard MusicPlayer_installer.pkg), $(MAKE) -f $(MAKEFILE) ok_installer_sis , $(MAKE) -f $(MAKEFILE) fail_sis_nopkg )

ok_installer_sis:
	createpackage.bat $(QT_SIS_OPTIONS) MusicPlayer_installer.pkg - $(QT_SIS_CERTIFICATE) $(QT_SIS_KEY) $(QT_SIS_PASSPHRASE)

fail_sis_nopkg:
	$(error PKG file does not exist, 'sis' and 'installer_sis' target are only supported for executables or projects with DEPLOYMENT statement)

fail_sis_nocache:
	$(error Project has to be built or QT_SIS_TARGET environment variable has to be set before calling 'SIS' target)

stub_sis:
	$(if $(wildcard MusicPlayer_template.pkg), $(if $(wildcard .make.cache), $(MAKE) -f $(MAKEFILE) ok_stub_sis MAKEFILES=.make.cache , $(if $(QT_SIS_TARGET), $(MAKE) -f $(MAKEFILE) ok_stub_sis , $(MAKE) -f $(MAKEFILE) fail_sis_nocache ) ) , $(MAKE) -f $(MAKEFILE) fail_sis_nopkg )

ok_stub_sis:
	createpackage.bat -s $(QT_SIS_OPTIONS) MusicPlayer_stub.pkg $(QT_SIS_TARGET) $(QT_SIS_CERTIFICATE) $(QT_SIS_KEY) $(QT_SIS_PASSPHRASE)

deploy: sis
	call MusicPlayer.sis

mocclean: compiler_moc_header_clean compiler_moc_source_clean

mocables: compiler_moc_header_make_all compiler_moc_source_make_all

compiler_moc_header_make_all:
compiler_moc_header_clean:
compiler_rcc_make_all:
compiler_rcc_clean:
compiler_image_collection_make_all: qmake_image_collection.cpp
compiler_image_collection_clean:
	-$(DEL_FILE) qmake_image_collection.cpp
compiler_moc_source_make_all:
compiler_moc_source_clean:
compiler_uic_make_all:
compiler_uic_clean:
compiler_yacc_decl_make_all:
compiler_yacc_decl_clean:
compiler_yacc_impl_make_all:
compiler_yacc_impl_clean:
compiler_lex_make_all:
compiler_lex_clean:
compiler_clean: 

dodistclean:
	-@ if EXIST "t:\projects\cflow\MusicPlayer_template.pkg" $(DEL_FILE)  "t:\projects\cflow\MusicPlayer_template.pkg"
	-@ if EXIST "t:\projects\cflow\MusicPlayer_stub.pkg" $(DEL_FILE)  "t:\projects\cflow\MusicPlayer_stub.pkg"
	-@ if EXIST "t:\projects\cflow\MusicPlayer_installer.pkg" $(DEL_FILE)  "t:\projects\cflow\MusicPlayer_installer.pkg"
	-@ if EXIST "t:\projects\cflow\Makefile" $(DEL_FILE)  "t:\projects\cflow\Makefile"
	-@ if EXIST "t:\projects\cflow\MusicPlayer_0xE1111235.mmp" $(DEL_FILE)  "t:\projects\cflow\MusicPlayer_0xE1111235.mmp"
	-@ if EXIST "t:\projects\cflow\MusicPlayer_reg.rss" $(DEL_FILE)  "t:\projects\cflow\MusicPlayer_reg.rss"
	-@ if EXIST "t:\projects\cflow\MusicPlayer.rss" $(DEL_FILE)  "t:\projects\cflow\MusicPlayer.rss"
	-@ if EXIST "t:\projects\cflow\MusicPlayer.loc" $(DEL_FILE)  "t:\projects\cflow\MusicPlayer.loc"
	-@ if EXIST "t:\projects\cflow\bld.inf" $(DEL_FILE)  "t:\projects\cflow\bld.inf"

distclean: clean dodistclean

clean: bld.inf
	-$(SBS) reallyclean

clean-debug: bld.inf
	$(SBS) reallyclean -c winscw_udeb -c gcce_udeb -c armv5_udeb -c armv6_udeb
clean-release: bld.inf
	$(SBS) reallyclean -c gcce_urel -c armv5_urel -c armv6_urel
clean-debug-winscw: bld.inf
	$(SBS) reallyclean -c winscw_udeb
clean-debug-gcce: bld.inf
	$(SBS) reallyclean -c gcce_udeb
clean-debug-armv5: bld.inf
	$(SBS) reallyclean -c armv5_udeb
clean-debug-armv6: bld.inf
	$(SBS) reallyclean -c armv6_udeb
clean-release-gcce: bld.inf
	$(SBS) reallyclean -c gcce_urel
clean-release-armv5: bld.inf
	$(SBS) reallyclean -c armv5_urel
clean-release-armv6: bld.inf
	$(SBS) reallyclean -c armv6_urel

