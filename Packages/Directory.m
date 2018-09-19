(* ::Package:: *)
(* ::Title:: *)
(*Directories(Directories)*)
(* ::Subchapter:: *)
(*程序包介绍*)
(* ::Text:: *)
(*Mathematica Package*)
(*Created by Mathematica Plugin for IntelliJ IDEA*)
(*Establish from GalAster's template(v1.3)*)
(**)
(* ::Text:: *)
(*Author:Aster*)
(*Creation Date:2018-08-21*)
(*Copyright: Mozilla Public License Version 2.0*)
(* ::Program:: *)
(*1.软件产品再发布时包含一份原始许可声明和版权声明。*)
(*2.提供快速的专利授权。*)
(*3.不得使用其原始商标。*)
(*4.如果修改了源代码，包含一份代码修改说明。*)
(**)
(* ::Text:: *)
(*这里应该填这个函数的介绍*)
(* ::Section:: *)
(*函数说明*)
$WaifuDirectory::usage = "WaifuX 的安装路径.";
$WaifuData::usage = "WaifuX 的数据存放位置.";
$Waifus::usage = "WaifuX 的远程资源映射表";
(* ::Section:: *)
(*程序包正体*)
(* ::Subsection::Closed:: *)
(*主设置*)
Begin["`Directories`"];
(* ::Subsection::Closed:: *)
(*主体代码*)
Version$Directories = "V1.3";
Updated$Directories = "2018-09-11";
(* ::Subsubsection:: *)
(*功能块 1*)
$WaifuDirectory = DirectoryName[FindFile["Waifu`Kernel`"], 2];
$WaifuData = FileNameJoin[{$UserBaseDirectory, "ApplicationData", "WaifuX"}];
(*If[
	MissingQ[var = Ready[$Waifus[name, "Remote"], $Waifus[name, "Local"]]],
	Return[Missing[NotAvailable]]
];*)
UrlSR = Hyperlink["WaifuSR", "https://github.com/Moe-Net/Waifu-SR"];
UrlIR = Hyperlink["WaifuIR", "https://github.com/Moe-Net/Waifu-IR"];
UrlCU = Hyperlink["WaifuSY", "https://github.com/Moe-Net/Waifu-CU"];
UrlSY = Hyperlink["WaifuSY", "https://github.com/Moe-Net/Waifu-SY"];
$Waifus = <|
	"VGGSR" -> <|
		"Project" -> UrlSR,
		"Remote" -> "https://m.vers.site/Resources/WaifuX/Waifu-VGGSR.WMLF",
		"Local" -> FileNameJoin[{$WaifuData, "Waifu-VGGSR.WMLF"}]
	|>,
	"VDSR" -> <|
		"Project" -> UrlSR,
		"Remote" -> "https://m.vers.site/Resources/WaifuX/Waifu-VDSR.WMLF",
		"Local" -> FileNameJoin[{$WaifuData, "Waifu-VDSR.WMLF"}]
	|>,
	"LapSRN2x" -> <|
		"Project" -> UrlSR,
		"Remote" -> "https://m.vers.site/Resources/WaifuX/Waifu-LapSRN2x.WMLF",
		"Local" -> FileNameJoin[{$WaifuData, "Waifu-LapSRN2x.WMLF"}]
	|>,
	"LapSRN4x" -> <|
		"Project" -> UrlSR,
		"Remote" -> "https://m.vers.site/Resources/WaifuX/Waifu-LapSRN4x.WMLF",
		"Local" -> FileNameJoin[{$WaifuData, "Waifu-LapSRN4x.WMLF"}]
	|>,
	"SESR" -> <|
		"Project" -> UrlSR,
		"Remote" -> "https://m.vers.site/Resources/WaifuX/Waifu-SESR.WMLF",
		"Local" -> FileNameJoin[{$WaifuData, "Waifu-SESR.WMLF"}]
	|>,
	"ByNet9" -> <|
		"Project" -> UrlSR,
		"Remote" -> "https://m.vers.site/Resources/WaifuX/Waifu-ByNet9.WMLF",
		"Local" -> FileNameJoin[{$WaifuData, "Waifu-ByNet9.WMLF"}]
	|>,
	"RED30-SR" -> <|
		"Project" -> UrlSR,
		"Remote" -> "https://m.vers.site/Resources/WaifuX/Waifu-RED30.WMLF",
		"Local" -> FileNameJoin[{$WaifuData, "Waifu-RED30.WMLF"}]
	|>,
	"SRResNet2x" -> <|
		"Project" -> UrlSR,
		"Remote" -> "https://m.vers.site/Resources/WaifuX/Waifu-SRResNet2x.WXF",
		"Local" -> FileNameJoin[{$WaifuData, "Waifu-SRResNet2x.WXF"}]
	|>,
	"SRResNet3x" -> <|
		"Project" -> UrlSR,
		"Remote" -> "https://m.vers.site/Resources/WaifuX/Waifu-SRResNet3x.WXF",
		"Local" -> FileNameJoin[{$WaifuData, "Waifu-SRResNet2x.WXF"}]
	|>,
	"SRResNet4x" -> <|
		"Project" -> UrlSR,
		"Remote" -> "https://m.vers.site/Resources/WaifuX/Waifu-SRResNet4x.WXF",
		"Local" -> FileNameJoin[{$WaifuData, "Waifu-SRResNet2x.WXF"}]
	|>,
	"SRResNet8x" -> <|
		"Project" -> UrlSR,
		"Remote" -> "https://m.vers.site/Resources/WaifuX/Waifu-SRResNet8x.WXF",
		"Local" -> FileNameJoin[{$WaifuData, "Waifu-SRResNet2x.WXF"}]
	|>,
	
	
	
	"DnCNN-S15" -> <|
		"Project" -> UrlIR,
		"Remote" -> "https://m.vers.site/Resources/WaifuX/Waifu-DnCNN-S15.WMLF",
		"Local" -> FileNameJoin[{$WaifuData, "Waifu-DnCNN-S15.WMLF"}]
	|>,
	"DnCNN-S50" -> <|
		"Project" -> UrlIR,
		"Remote" -> "https://m.vers.site/Resources/WaifuX/Waifu-DnCNN-S50.WMLF",
		"Local" -> FileNameJoin[{$WaifuData, "Waifu-DnCNN-S50.WMLF"}]
	|>,
	"DnCNN-B" -> <|
		"Project" -> UrlIR,
		"Remote" -> "https://m.vers.site/Resources/WaifuX/Waifu-DnCNN-B.WMLF",
		"Local" -> FileNameJoin[{$WaifuData, "Waifu-DnCNN-B.WMLF"}]
	|>,
	"DRRN9" -> <|
		"Project" -> UrlIR,
		"Remote" -> "https://m.vers.site/Resources/WaifuX/Waifu-DRRN9.WXF",
		"Local" -> FileNameJoin[{$WaifuData, "Waifu-DRRN9.WXF"}]
	|>,
	"DRRN25" -> <|
		"Project" -> UrlIR,
		"Remote" -> "https://m.vers.site/Resources/WaifuX/Waifu-DRRN25.WXF",
		"Local" -> FileNameJoin[{$WaifuData, "Waifu-DRRN25.WXF"}]
	|>,
	
	
	
	"Resnet50" -> <|
		"Project" -> UrlCU,
		"Remote" -> "https://m.vers.site/Resources/WaifuX/Waifu-Resnet50.WMLF",
		"Local" -> FileNameJoin[{$WaifuData, "Waifu-Resnet50.WMLF"}]
	|>,
	
	
	
	"Tang-4" -> <|
		"Project" -> UrlSY,
		"Remote" -> "https://m.vers.site/Resources/WaifuX/Waifu-Tang-4.WMLF",
		"Local" -> FileNameJoin[{$WaifuData, "Waifu-Tang-4.WMLF"}]
	|>,
	"Tang-5" -> <|
		"Project" -> UrlSY,
		"Remote" -> "https://m.vers.site/Resources/WaifuX/Waifu-Tang-5.WMLF",
		"Local" -> FileNameJoin[{$WaifuData, "Waifu-Tang-5.WMLF"}]
	|>,
	"Tang-7" -> <|
		"Project" -> UrlSY,
		"Remote" -> "https://m.vers.site/Resources/WaifuX/Waifu-Tang-7.WMLF",
		"Local" -> FileNameJoin[{$WaifuData, "Waifu-Tang-7.WMLF"}]
	|>
|>;
(* ::Subsection::Closed:: *)
(*附加设置*)
SetAttributes[
	{$Waifus},
	{ReadProtected}
];
End[]
