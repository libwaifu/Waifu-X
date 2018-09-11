(* ::Package:: *)
(* ::Subchapter:: *)
(*版本号*)
Version$WaifuIR = "V1.0";
Updated$WaifuIR = "2018-09-11";


(* ::Subchapter:: *)
(*DnCNN*)
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


(* ::Subsubsection:: *)
(*DnCNN*)
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


(* ::Subchapter:: *)
(*附加设置*)
SetAttributes[
	{WaifuDenoise},
	{Protected, ReadProtected}
]
