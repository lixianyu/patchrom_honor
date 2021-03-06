#
# Makefile for u8860
#

# The original zip file, MUST be specified by each product
local-zip-file     := stockrom.zip

# The output zip file of MIUI rom, the default is porting_miui.zip if not specified
local-out-zip-file := MIUI_u8860.zip

#
local-miui-modified-apps := MiuiSystemUI MiuiHome Mms Phone Settings

# All apps from original ZIP, but has smali files chanded
local-modified-apps := SettingsProvider

# All apks from MIUI
local-miui-removed-apps     := SettingsProvider MediaProvider

# All apps need to be removed from original ZIP file
local-remove-apps := AllBackup SystemUI SetupWizard Cloud NotePad HwIME Superuser MusicFx Launcher2 FileManager HwOUC \
	rootexplorer GenieWidget GalleryGoogle CalendarGoogle Gmail GoogleQuickSearchBox GooglePackageVerifier GooglePackageVerifierUpdater \
	GoogleTTS GooglePlayMusic Maps Talk TotemWeather Trebuchet ToolBox Vending VoiceSearch

# To include the local targets before and after zip the final ZIP file, 
# and the local-targets should:
# (1) be defined after including porting.mk if using any global variable(see porting.mk)
# (2) the name should be leaded with local- to prevent any conflict with global targets
local-pre-zip := local-zip-misc
local-after-zip:=

# The local targets after the zip file is generated, could include 'zip2sd' to 
# deliver the zip file to phone, or to customize other actions

include $(PORT_BUILD)/porting.mk

# To define any local-target
local-zip-misc:
	#rm -rf $(ZIP_DIR)/system/cdrom
	rm $(ZIP_DIR)/system/bin/su
	cp other/build.prop $(ZIP_DIR)/system/build.prop
	cp other/HuaWeiSettings.apk $(ZIP_DIR)/system/app/HuaWeiSettings.apk
	cp other/Generic.kl $(ZIP_DIR)/system/usr/keylayout/
