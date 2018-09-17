(* ::Package:: *)
(* ::Subchapter:: *)
(*Version*)
Version$WaifuIR = "V1.0";
Updated$WaifuIR = "2018-09-11";


(* ::Subchapter:: *)
(*WaifuDenoise*)
(* ::Subsubsection:: *)
(*Models*)
Waifu`Models`DnCNN::usage = "";
Waifu`Models`DnCNN := Ready[$Waifus["DnCNN-S15", "Remote"], Echo -> True];
Waifu`Models`DnCNN::usage = "";
Waifu`Models`DnCNN2 := Ready[$Waifus["DnCNN-S50", "Remote"], Echo -> True];
Waifu`Models`DnCNN::usage = "";
Waifu`Models`DnCNN3 := Ready[$Waifus["DnCNN-B", "Remote"], Echo -> True];


(* ::Subsubsection:: *)
(*Main*)
Options[WaifuDenoise$API] = {Method -> "Soft", TargetDevice -> "GPU"};
WaifuDenoise$API[img_Image, OptionsPattern[]] := Block[
	{catch},
	catch = Switch[OptionValue[Method],
		"Soft", WaifuDnCNN[img, OptionValue[TargetDevice]],
		"Hard", WaifuDnCNN2[img, OptionValue[TargetDevice]],
		_, WaifuDnCNN3[img, OptionValue[TargetDevice]]
	];
	If[
		MissingQ[catch],
		Return[Missing["NotAvailable"]],
		Return[catch]
	]
];


(* ::Subsubsection::Closed:: *)
(*DnCNN*)
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


(* ::Subchapter:: *)
(*Additional*)
SetAttributes[
	{WaifuDenoise$API},
	{Protected, ReadProtected}
]
