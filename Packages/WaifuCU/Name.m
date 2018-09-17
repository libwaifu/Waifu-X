(* ::Package:: *)
(* ::Subchapter:: *)
(*WaifuName*)
(* ::Text:: *)
(* $Updated = "2018-09-16"; *)


(* ::Subsubsection:: *)
(*Models*)
Waifu`Models`Resnet::usage = "";
Waifu`Models`Resnet := Ready[$Waifus["Resnet50", "Remote"]];


(* ::Subsubsection:: *)
(*Main*)
Options[WaifuName$API] = {Method -> "Soft", TargetDevice -> "GPU"};
WaifuName$API[img_Image, OptionsPattern[]] := Block[
	{catch},
	catch = Switch[OptionValue[Method],
		_, WaifuResnet[img, OptionValue[TargetDevice]]
	];
	If[
		MissingQ[catch],
		Return[Missing["NotAvailable"]],
		Return[catch]
	]
];


(* ::Subsubsection::Closed:: *)
(*Resnet50*)
WaifuResnet[img_, device_ : "GPU"] := Block[
	{top},
	If[
		MissingQ[Waifu`Models`Resnet],
		Return[Missing["NotAvailable"]]
	];
	top = Select[Waifu`Models`Resnet[img, "Probabilities", TargetDevice -> "GPU"], # > 0.001&];
	Dataset[ToString@Floor[100#, 0.01] <> "%"& /@ Take[ReverseSort@top, UpTo[10]]]
];


(* ::Subchapter:: *)
(*Additional*)
SetAttributes[
	{WaifuName$API},
	{Protected, ReadProtected}
]
