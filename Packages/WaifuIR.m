(* ::Package:: *)
(* ::Title:: *)
(*WaifuIR(WaifuIR)*)
(* ::Subchapter:: *)
(*程序包介绍*)
(* ::Text:: *)
(*Mathematica Package*)
(*Created by Mathematica Plugin for IntelliJ IDEA*)
(*Establish from GalAster's template(v1.3)*)
(**)
(* ::Text:: *)
(*Author:Aster*)
(*Creation Date:2018-09-11*)
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
WaifuDenoise::usage = "";
(* ::Section:: *)
(*程序包正体*)
(* ::Subsection::Closed:: *)
(*主设置*)
WaifuIR::usage = "程序包的说明,这里抄一遍";
Begin["`WaifuIR`"];
(* ::Subsection::Closed:: *)
(*主体代码*)
Version$WaifuIR = "V1.0";
Updated$WaifuIR = "2018-09-11";
(* ::Subsubsection:: *)
(*功能块 1*)
Waifu`Models`DnCNN := Ready[$Waifus["DnCNN-S15", "Remote"]];
Waifu`Models`DnCNN2 := Ready[$Waifus["DnCNN-S50", "Remote"]];
Waifu`Models`DnCNN3 := Ready[$Waifus["DnCNN-B", "Remote"]];
WaifuDnCNN[img_, device_ : "GPU"] := Block[
	{getN, getNoise, noise},
	If[MissingQ[Waifu`Models`DnCNN], Return[Missing["NotAvailable"]]];
	getN = NetReplacePart[Waifu`Models`DnCNN, {
		"Input" -> NetEncoder[{"Image", ImageDimensions@img, ColorSpace -> "Grayscale"}],
		"Output" -> NetDecoder[{"Image", ColorSpace -> "Grayscale"}]
	}];
	getNoise = getN[#, TargetDevice -> device]&;
	noise = ColorCombine[getNoise /@ ColorSeparate[img]];
	img - noise
];
WaifuDnCNN2[img_, device_ : "GPU"] := Block[
	{getN, getNoise, noise},
	If[MissingQ[Waifu`Models`DnCNN2], Return[Missing["NotAvailable"]]];
	getN = NetReplacePart[Waifu`Models`DnCNN2, {
		"Input" -> NetEncoder[{"Image", ImageDimensions@img, ColorSpace -> "Grayscale"}],
		"Output" -> NetDecoder[{"Image", ColorSpace -> "Grayscale"}]
	}];
	getNoise = getN[#, TargetDevice -> device]&;
	noise = ColorCombine[getNoise /@ ColorSeparate[img]];
	img - noise
];
WaifuDnCNN3[img_, device_ : "GPU"] := Block[
	{getN, getNoise, noise},
	If[MissingQ[Waifu`Models`DnCNN3], Return[Missing["NotAvailable"]]];
	getN = NetReplacePart[Waifu`Models`DnCNN3, {
		"Input" -> NetEncoder[{"Image", ImageDimensions@img, ColorSpace -> "Grayscale"}],
		"Output" -> NetDecoder[{"Image", ColorSpace -> "Grayscale"}]
	}];
	getNoise = getN[#, TargetDevice -> device]&;
	noise = ColorCombine[getNoise /@ ColorSeparate[img]];
	img - noise
];
Options[WaifuDenoise] = {Method -> "Soft", TargetDevice -> "GPU"};
WaifuDenoise[img_Image, OptionsPattern[]] := Block[
	{ },
	If[Or @@ {
		MissingQ[Waifu`Models`DnCNN],
		MissingQ[Waifu`Models`DnCNN2],
		MissingQ[Waifu`Models`DnCNN3]
	},
		Return[Missing["NotAvailable"]]
	];
	Switch[OptionValue[Method],
		"Soft", WaifuDnCNN[img, OptionValue[TargetDevice]],
		"Hard", WaifuDnCNN2[img, OptionValue[TargetDevice]],
		_, WaifuDnCNN3[img, OptionValue[TargetDevice]]
	]
];

(* ::Subsection::Closed:: *)
(*附加设置*)
SetAttributes[
	{WaifuDenoise},
	{Protected, ReadProtected}
];
End[]
