#!/bin/sh
# jm3.net
# uninstall the 162 non-English fonts that Apple installs that clog up Photoshop's font menu.

# ========================
## RUN AT YOUR OWN RISK ##
# ========================

# if this formats your hard drive or deletes your fonts or changes the sex
# of your dog, I'm super sorry, but there's nothing I can do.

system_font_dirs="/Library/Fonts /System/Library/Fonts"
uninstall_dir="$HOME/Desktop/uninstalled-fonts"

for dir in $system_font_dirs
do
  cd $dir
  pwd

  mv "Al Nile.ttc" $uninstall_dir
  mv "Al Tarikh.ttc" $uninstall_dir
  mv "AlBayan.ttc" $uninstall_dir
  mv "AppleMyungjo.ttf" $uninstall_dir
  mv "AppleSDGothicNeo-Bold.otf" $uninstall_dir
  mv "AppleSDGothicNeo-ExtraBold.otf" $uninstall_dir
  mv "AppleSDGothicNeo-Heavy.otf" $uninstall_dir
  mv "AppleSDGothicNeo-Light.otf" $uninstall_dir
  mv "AppleSDGothicNeo-Medium.otf" $uninstall_dir
  mv "AppleSDGothicNeo-Regular.otf" $uninstall_dir
  mv "AppleSDGothicNeo-SemiBold.otf" $uninstall_dir
  mv "AppleSDGothicNeo-Thin.otf" $uninstall_dir
  mv "AppleSDGothicNeo-UltraLight.otf" $uninstall_dir
  mv "AquaKana.ttc" $uninstall_dir
  mv "ArialHB.ttc" $uninstall_dir
  mv "Ayuthaya.ttf" $uninstall_dir
  mv "Baghdad.ttc" $uninstall_dir
  mv "Bangla MN.ttc" $uninstall_dir
  mv "Bangla Sangam MN.ttc" $uninstall_dir
  mv "Baoli.ttc" $uninstall_dir
  mv "Beirut.ttc" $uninstall_dir
  mv "Bodoni 72 OS.ttc" $uninstall_dir
  mv "Bodoni 72 Smallcaps Book.ttf" $uninstall_dir
  mv "Bodoni 72.ttc" $uninstall_dir
  mv "Bodoni Ornaments.ttf" $uninstall_dir
  mv "Bradley Hand Bold.ttf" $uninstall_dir
  mv "Chalkboard.ttc" $uninstall_dir
  mv "ChalkboardSE.ttc" $uninstall_dir
  mv "Chalkduster.ttf" $uninstall_dir
  mv "Damascus.ttc" $uninstall_dir
  mv "DecoTypeNaskh.ttc" $uninstall_dir
  mv "Devanagari Sangam MN.ttc" $uninstall_dir
  mv "DevanagariMT.ttc" $uninstall_dir
  mv "Diwan Kufi.ttc" $uninstall_dir
  mv "Diwan Thuluth.ttf" $uninstall_dir
  mv "EuphemiaCAS.ttc" $uninstall_dir
  mv "Farah.ttc" $uninstall_dir
  mv "Farisi.ttf" $uninstall_dir
  mv "Gujarati Sangam MN.ttc" $uninstall_dir
  mv "GujaratiMT.ttf" $uninstall_dir
  mv "GujaratiMTBold.ttf" $uninstall_dir
  mv "Gungseouche.ttf" $uninstall_dir
  mv "Gurmukhi MN.ttc" $uninstall_dir
  mv "Gurmukhi Sangam MN.ttc" $uninstall_dir
  mv "Gurmukhi.ttf" $uninstall_dir
  mv "Hannotate.ttc" $uninstall_dir
  mv "Hanzipen.ttc" $uninstall_dir
  mv "HiraKakuInterface-W1.otf" $uninstall_dir
  mv "HiraKakuInterface-W2.otf" $uninstall_dir
  mv "Hiragino Sans GB W3.otf" $uninstall_dir
  mv "Hiragino Sans GB W6.otf" $uninstall_dir
  mv "ITFDevanagari.ttc" $uninstall_dir
  mv "InaiMathi.ttf" $uninstall_dir
  mv "Iowan Old Style.ttc" $uninstall_dir
  mv "Kailasa.ttf" $uninstall_dir
  mv "Kaiti.ttc" $uninstall_dir
  mv "Kannada MN.ttc" $uninstall_dir
  mv "Kannada Sangam MN.ttc" $uninstall_dir
  mv "Kefa.ttc" $uninstall_dir
  mv "Khmer MN.ttc" $uninstall_dir
  mv "Khmer Sangam MN.ttf" $uninstall_dir
  mv "Kohinoor.ttc" $uninstall_dir
  mv "Kokonor.ttf" $uninstall_dir
  mv "Krungthep.ttf" $uninstall_dir
  mv "KufiStandardGK.ttc" $uninstall_dir
  mv "Lantinghei.ttc" $uninstall_dir
  mv "Lao MN.ttc" $uninstall_dir
  mv "Lao Sangam MN.ttf" $uninstall_dir
  mv "Libian.ttc" $uninstall_dir
  mv "Luminari.ttf" $uninstall_dir
  mv "Malayalam MN.ttc" $uninstall_dir
  mv "Malayalam Sangam MN.ttc" $uninstall_dir
  mv "Microsoft Sans Serif.ttf" $uninstall_dir
  mv "Mishafi Gold.ttf" $uninstall_dir
  mv "Mishafi.ttf" $uninstall_dir
  mv "MshtakanBold.ttf" $uninstall_dir
  mv "MshtakanBoldOblique.ttf" $uninstall_dir
  mv "MshtakanOblique.ttf" $uninstall_dir
  mv "MshtakanRegular.ttf" $uninstall_dir
  mv "Muna.ttc" $uninstall_dir
  mv "Myanmar MN.ttc" $uninstall_dir
  mv "Myanmar Sangam MN.ttf" $uninstall_dir
  mv "NISC18030.ttf" $uninstall_dir
  mv "Nadeem.ttc" $uninstall_dir
  mv "NanumGothic.ttc" $uninstall_dir
  mv "NanumMyeongjo.ttc" $uninstall_dir
  mv "NanumScript.ttc" $uninstall_dir
  mv "NewPeninimMT.ttc" $uninstall_dir
  mv "Oriya MN.ttc" $uninstall_dir
  mv "Oriya Sangam MN.ttc" $uninstall_dir
  mv "Osaka.ttf" $uninstall_dir
  mv "OsakaMono.ttf" $uninstall_dir
  mv "PCmyoungjo.ttf" $uninstall_dir
  mv "Pilgiche.ttf" $uninstall_dir
  mv "PlantagenetCherokee.ttf" $uninstall_dir
  mv "Raanana.ttc" $uninstall_dir
  mv "STHeiti Light.ttc" $uninstall_dir
  mv "STHeiti Medium.ttc" $uninstall_dir
  mv "STHeiti Thin.ttc" $uninstall_dir
  mv "STHeiti UltraLight.ttc" $uninstall_dir
  mv "STIXGeneral.otf" $uninstall_dir
  mv "STIXGeneralBol.otf" $uninstall_dir
  mv "STIXGeneralBolIta.otf" $uninstall_dir
  mv "STIXGeneralItalic.otf" $uninstall_dir
  mv "STIXIntDBol.otf" $uninstall_dir
  mv "STIXIntDReg.otf" $uninstall_dir
  mv "STIXIntSmBol.otf" $uninstall_dir
  mv "STIXIntSmReg.otf" $uninstall_dir
  mv "STIXIntUpBol.otf" $uninstall_dir
  mv "STIXIntUpDBol.otf" $uninstall_dir
  mv "STIXIntUpDReg.otf" $uninstall_dir
  mv "STIXIntUpReg.otf" $uninstall_dir
  mv "STIXIntUpSmBol.otf" $uninstall_dir
  mv "STIXIntUpSmReg.otf" $uninstall_dir
  mv "STIXNonUni.otf" $uninstall_dir
  mv "STIXNonUniBol.otf" $uninstall_dir
  mv "STIXNonUniBolIta.otf" $uninstall_dir
  mv "STIXNonUniIta.otf" $uninstall_dir
  mv "STIXSizFiveSymReg.otf" $uninstall_dir
  mv "STIXSizFourSymBol.otf" $uninstall_dir
  mv "STIXSizFourSymReg.otf" $uninstall_dir
  mv "STIXSizOneSymBol.otf" $uninstall_dir
  mv "STIXSizOneSymReg.otf" $uninstall_dir
  mv "STIXSizThreeSymBol.otf" $uninstall_dir
  mv "STIXSizThreeSymReg.otf" $uninstall_dir
  mv "STIXSizTwoSymBol.otf" $uninstall_dir
  mv "STIXSizTwoSymReg.otf" $uninstall_dir
  mv "STIXVar.otf" $uninstall_dir
  mv "STIXVarBol.otf" $uninstall_dir
  mv "Sana.ttc" $uninstall_dir
  mv "Sathu.ttf" $uninstall_dir
  mv "Savoye LET.ttc" $uninstall_dir
  mv "Seravek.ttc" $uninstall_dir
  mv "Shree714.ttc" $uninstall_dir
  mv "Silom.ttf" $uninstall_dir
  mv "Sinhala MN.ttc" $uninstall_dir
  mv "Sinhala Sangam MN.ttc" $uninstall_dir
  mv "Skia.ttf" $uninstall_dir
  mv "SnellRoundhand.ttc" $uninstall_dir
  mv "Songti.ttc" $uninstall_dir
  mv "SukhumvitSet.ttc" $uninstall_dir
  mv "Tamil MN.ttc" $uninstall_dir
  mv "Tamil Sangam MN.ttc" $uninstall_dir
  mv "Telugu MN.ttc" $uninstall_dir
  mv "Telugu Sangam MN.ttc" $uninstall_dir
  mv "Thonburi.ttc" $uninstall_dir
  mv "Trattatello.ttf" $uninstall_dir
  mv "Waseem.ttc" $uninstall_dir
  mv "WawaSC-Regular.otf" $uninstall_dir
  mv "WawaTC-Regular.otf" $uninstall_dir
  mv "Webdings.ttf" $uninstall_dir
  mv "WeibeiSC-Bold.otf" $uninstall_dir
  mv "WeibeiTC-Bold.otf" $uninstall_dir
  mv "Wingdings 2.ttf" $uninstall_dir
  mv "Wingdings 3.ttf" $uninstall_dir
  mv "Wingdings.ttf" $uninstall_dir
  mv "Xingkai.ttc" $uninstall_dir
  mv "Yu Gothic Bold.otf" $uninstall_dir
  mv "Yu Gothic Medium.otf" $uninstall_dir
  mv "Yu Mincho Demibold.otf" $uninstall_dir
  mv "Yu Mincho Medium.otf" $uninstall_dir
  mv "Yuanti.ttc" $uninstall_dir
  mv "YuppySC-Regular.otf" $uninstall_dir
  mv "YuppyTC-Regular.otf" $uninstall_dir
  mv "Zapfino.ttf" $uninstall_dir
  mv "儷宋 Pro.ttf" $uninstall_dir
  mv "儷黑 Pro.ttf" $uninstall_dir
  mv "华文仿宋.ttf" $uninstall_dir
  mv "华文细黑.ttf" $uninstall_dir
  mv "华文黑体.ttf" $uninstall_dir
  mv "ヒラギノ明朝 Pro W3.otf" $uninstall_dir
  mv "ヒラギノ明朝 Pro W6.otf" $uninstall_dir
  mv "ヒラギノ明朝 ProN W3.otf" $uninstall_dir
  mv "ヒラギノ明朝 ProN W6.otf" $uninstall_dir
  mv "ヒラギノ角ゴ Pro W3.otf" $uninstall_dir
  mv "ヒラギノ丸ゴ Pro W4.otf" $uninstall_dir
  mv "ヒラギノ角ゴ Pro W6.otf" $uninstall_dir
  mv "ヒラギノ角ゴ ProN W3.otf" $uninstall_dir
  mv "ヒラギノ丸ゴ ProN W4.otf" $uninstall_dir
  mv "ヒラギノ角ゴ ProN W6.otf" $uninstall_dir
  mv "ヒラギノ角ゴ Std W8.otf" $uninstall_dir
  mv "ヒラギノ角ゴ StdN W8.otf" $uninstall_dir

done
