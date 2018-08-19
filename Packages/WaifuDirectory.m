$WaifuDirectory::usage = "WaifuX 的安装路径.";
$WaifuData::usage = "WaifuX 的数据存放位置.";
$WaifuResourcesList::usage = "WaifuX 的远程资源映射表";
$WaifuModelLoader::usage = "WaifuX 的资源加载器.";
Begin["`Directories`"];
$WaifuDirectory = DirectoryName[FindFile["Waifu`Kernel`"], 2];
$WaifuData = FileNameJoin[{$UserBaseDirectory, "ApplicationData", "WaifuX"}];
$WaifuResourcesList = <|
	"Waifu-VDSR" -> <|
		"Remote" -> "https://m.vers.site/NetModel/Waifu-VDSR.WMLF",
		"Local" -> FileNameJoin[{$WaifuData, "Models", "Waifu-VDSR.WMLF"}]
	|>
|>;
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
$WaifuModelLoader[name_] := If[
	FileExistsQ@$WaifuResourcesList[name, "Local"],
	Import[FileExistsQ@$WaifuResourcesList[name, "Local"]],
	manifest = <||>;
	downloadStart[manifest][$WaifuResourcesList[name, "Remote"], $WaifuResourcesList[name, "Local"]];
	Print@Dynamic@downloadVisualize[manifest];
	Message[$WaifuModelLoader::lost, name];Return[$Failed]
];
Quiet[CreateDirectory/@{
	$WaifuData,
	FileNameJoin[{$WaifuData, "Models"}]
}];
SetAttributes[{downloadProgress, downloadFinished, downloadStart, downloadVisualize}, HoldFirst];
SetAttributes[
	{$WaifuResourcesList, $WaifuModelLoader},
	{Protected, ReadProtected}
];
End[];
