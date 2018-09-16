(* ::Package:: *)
(* ::Subchapter:: *)
(*WaifuDenoise*)
(* ::Text:: *)
(* $Updated = "2018-09-11"; *)


(* ::Subsubsection:: *)
(*Models*)
Waifu`Models`Resnet::usage = "";
Waifu`Models`Resnet := Ready[$Waifus["Resnet50", "Remote"]];


(* ::Subsubsection:: *)
(*Main*)
Options[WaifuDenoise$API] = {Method -> "Soft", TargetDevice -> "GPU"};
WaifuDenoise$API[img_Image, OptionsPattern[]] := Block[
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


(* ::Subsubsection::Closed:: *)
(*Resnet50*)
WaifuResnet[img_, device_ : "GPU"] := Block[
	{top},
	top = Select[Waifu`Models`Resnet[img, "Probabilities", TargetDevice -> "GPU"], # > 0.001&];
	Dataset[ToString@Floor[100#, 0.01] <> "%"& /@ Take[ReverseSort@top, UpTo[10]]]
];


(* ::Subchapter:: *)
(*Additional*)
SetAttributes[
	{WaifuDenoise$API},
	{Protected, ReadProtected}
]
