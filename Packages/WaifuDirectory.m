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
Version$Directories = "V1.0";
Updated$Directories = "2018-08-21";
(* ::Subsubsection:: *)
(*功能块 1*)
$WaifuDirectory = DirectoryName[FindFile["Waifu`Kernel`"], 2];
$WaifuData = FileNameJoin[{$UserBaseDirectory, "ApplicationData", "WaifuX"}];
(*If[
	MissingQ[var = Ready[$Waifus[name, "Remote"], $Waifus[name, "Local"]]],
	Return[Missing[NotAvailable]]
];*)
$Waifus = <|
	"Waifu-VDSR" -> <|
		"Remote" -> "https://m.vers.site/NetModel/Waifu-VDSR.WMLF",
		"Local" -> FileNameJoin[{$WaifuData, "Models", "Waifu-VDSR.WMLF"}]
	|>,
	"Waifu-LapSRN" -> <|
		"Remote" -> "https://m.vers.site/NetModel/Waifu-LapSRN2.WMLF",
		"Local" -> FileNameJoin[{$WaifuData, "Models", "Waifu-LapSRN2.WMLF"}]
	|>
|>;
(* ::Subsection::Closed:: *)
(*附加设置*)
SetAttributes[
	{$Waifus},
	{ReadProtected}
];
End[]
