$WaifuDirectory::usage = "WaifuX 的安装路径.";
$WaifuIcons::usage = "WaifuX 的图标映射.";
$WaifuData::usage = "WaifuX 的数据存放位置.";
Begin["`Directories`"];


$WaifuDirectory = DirectoryName[FindFile["Waifu`Kernel`"], 2];
$WaifuData = FileNameJoin[{$UserBaseDirectory, "ApplicationData", "WaifuX"}];


Waifu$ResourcesList::usage = "";

Waifu$ResourcesList = <|
	"SudokuMega" -> <|
		"Remote" -> "https://m.vers.site/Resources/Waifu/SudokuMega.wxf",
		"Local" -> FileNameJoin[{$UserBaseDirectory, "Applications", "Waifu", "Resources", "exe", "Sudoku", "SudokuMega.wxf"}]
	|>
|>;

SetAttributes[
	{ },
	{Protected, ReadProtected}
];
End[];
