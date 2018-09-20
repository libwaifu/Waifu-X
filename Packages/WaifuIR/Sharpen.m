(* ::Package:: *)
(* ::Subchapter:: *)
(*Sharpen *)
(* ::Text:: *)
(*$Updated = "2018-09-19";*)


(* ::Subchapter:: *)
(*WaifuSharpen*)
(* ::Subsubsection:: *)
(*Models*)
DRRN := Ready[$Waifus["DRRN9", "Remote"]];
DRRN2 := Ready[$Waifus["DRRN25", "Remote"]];


(* ::Subsubsection:: *)
(*Main*)
Options[WaifuSharpen$API] = {Method -> "Soft", TargetDevice -> "GPU"};
WaifuSharpen$API[img_Image, OptionsPattern[]] := Block[
	{catch},
	catch = Switch[OptionValue[Method],
		"Soft", WaifuDRRN[img, OptionValue[TargetDevice]],
		_, WaifuDnCNN2[img, OptionValue[TargetDevice]]
	];
	If[
		MissingQ[catch],
		Return[Missing["NotAvailable"]],
		Return[catch]
	]
];


(* ::Subsubsection::Closed:: *)
(*DRRN*)
WaifuDRRN[img_, device_ : "GPU"] := Block[
	{ne, nd, geass},
	If[MissingQ[DRRN], Return[Missing["NotAvailable"]]];
	ne = NetEncoder[{"Image", ImageDimensions@img, ColorSpace -> "Grayscale"}];
	nd = NetDecoder[{"Image", ColorSpace -> "Grayscale"}];
	geass = Waifu`Models`$MXNet[DRRN, TargetDevice -> device];
	ColorCombine[nd@geass[ne@#] & /@ ColorSeparate[img]]
];
WaifuDRRN2[img_, device_ : "GPU"] := Block[
	{ne, nd, geass},
	If[MissingQ[DRRN2], Return[Missing["NotAvailable"]]];
	ne = NetEncoder[{"Image", ImageDimensions@img, ColorSpace -> "Grayscale"}];
	nd = NetDecoder[{"Image", ColorSpace -> "Grayscale"}];
	geass = Waifu`Models`$MXNet[DRRN2, TargetDevice -> device];
	ColorCombine[nd@geass[ne@#] & /@ ColorSeparate[img]]
];

(* ::Subchapter:: *)
(*Additional*)
SetAttributes[
	{WaifuSharpen$API},
	{Protected, ReadProtected}
]
