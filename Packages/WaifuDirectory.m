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
$WaifuResourcesList::usage = "WaifuX 的远程资源映射表";
$WaifuModelLoader::usage = "WaifuX 的资源加载器.";
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
$WaifuResourcesList = <|
	"Waifu-VDSR" -> <|
		"Remote" -> "https://m.vers.site/NetModel/Waifu-VDSR.WMLF",
		"Local" -> FileNameJoin[{$WaifuData, "Models", "Waifu-VDSR.WMLF"}]
	|>
|>;



(* ::Subsubsection:: *)
(*功能块 2*)
downloadProgress[manifest_][event_] := manifest = <|manifest, event["Task"] -> event|>;
downloadFinished[manifest_][event_] := NotebookDelete /@ NotebookFind[SelectedNotebook[], "Print", All, CellStyle];
downloadStart[manifest_][src_, dest_] := URLDownloadSubmit[
	src, dest,
	HandlerFunctions -> <|
		"ConnectionFailed" -> connectionFailed[manifest],
		"CookiesReceived" -> cookiesReceived[manifest],
		"HeadersReceived" -> headersReceived[manifest],
		"TaskFinished" -> downloadFinished[manifest],
		"TaskProgress" -> downloadProgress[manifest],
		"TaskStatusChanged" -> taskStatusChanged[manifest]
	|>,
	HandlerFunctionsKeys -> {
		"Task", "TaskStatus", "File",
		"ByteCountTotal", "ByteCountDownloaded", "FractionComplete"
	}
];
downloadVisualize[manifest_] := If[
	manifest === <||>,
	GeneralUtilities`ProgressPanel["正在检查网络连接..."],
	GeneralUtilities`ProgressPanel[
		StringJoin[FileNameTake[#File], " 下载中..."],
		StringJoin[ToString /@ {Floor[#ByteCountTotal / 2^20, 0.01], "MB/", Floor[#ByteCountDownloaded / 2^20, 0.01]}, "MB"],
		#FractionComplete
	]&[First@Values[manifest]]
];
$WaifuModelLoader::lost = "`1` 模型加载失败.";
$WaifuModelLoader[var_, name_] := If[
	FileExistsQ@$WaifuResourcesList[name, "Local"],
	var = Import[$WaifuResourcesList[name, "Local"]],
	manifest = <||>;
	downloadStart[manifest][$WaifuResourcesList[name, "Remote"], $WaifuResourcesList[name, "Local"]];
	Print@Dynamic@downloadVisualize[manifest];
	Message[$WaifuModelLoader::lost, name];
	Return[Clear[var]]
];


(* ::Subsection::Closed:: *)
(*附加设置*)
If[!FileExistsQ@#, CreateDirectory@#]& /@ {
	$WaifuData,
	FileNameJoin[{$WaifuData, "Models"}]
};
SetAttributes[{downloadProgress, downloadFinished, downloadStart, downloadVisualize}, HoldFirst];
SetAttributes[
	{$WaifuResourcesList, $WaifuModelLoader},
	{ReadProtected}
];
End[]