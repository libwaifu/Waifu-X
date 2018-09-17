(* ::Package:: *)
(* ::Subchapter:: *)
(*Version*)
Version$WaifuSR = "V1.0";
Updated$WaifuSR = "2018-08-21";
(* ::Subchapter:: *)
(*WaifuSR*)
(* ::Subsubsection:: *)
(*Models*)
Waifu`Models`LapSRN := Ready[$Waifus["LapSRN2x", "Remote"]];
Waifu`Models`LapSRN2 := Ready[$Waifus["LapSRN4x", "Remote"]];
Waifu`Models`RED30 := Ready[$Waifus["RED30-SR", "Remote"]];
Waifu`Models`VDSR := Ready[$Waifus["VDSR", "Remote"]];
Waifu`Models`SESR := Ready[$Waifus["SESR", "Remote"]];
Waifu`Models`VGGSR := Ready[$Waifus["VGGSR", "Remote"]];
Waifu`Models`ByNet := Ready[$Waifus["ByNet9", "Remote"]];


(* ::Subsubsection:: *)
(*Main*)
rgbMatrix = {{0.257, 0.504, 0.098}, {-0.148, -0.291, 0.439}, {0.439, -0.368, -0.071}};
rgbMatrixT = {{1.164, 0., 1.596}, {1.164, -0.392, -0.813}, {1.164, 2.017, 0.}};
Options[WaifuSR$API] = {TargetDevice -> "GPU"};
WaifuSR$API[i_Image, zoom_ : 2, OptionsPattern[]] := Block[
	{
		device = OptionValue[TargetDevice],
		img = ColorConvert[RemoveAlphaChannel@i, "RGB"],
		catch
	},
	catch = Which[
		1 < zoom <= 2, WaifuLapSRN[img, device],
		2 < zoom <= 4, WaifuLapSRN2[img, device],
		True, img
	];
	If[
		MissingQ[catch],
		Return[Missing["NotAvailable"]]
	];
	Which[
		1 < zoom <= 2, ImageResize[catch, zoom ImageDimensions[i]],
		zoom == 2, catch,
		2 < zoom <= 4, ImageResize[catch, zoom ImageDimensions[i]],
		zoom == 4, catch,
		True, ImageResize[catch, Scaled[zoom], Resampling -> {"OMOMS", 7}]
	]
];


(* ::Subsubsection::Closed:: *)
(*Traditional*)
WaifuNearset[img_, zoom_] := ImageResize[img, Scaled[zoom], Resampling -> "Nearest"] ;
WaifuLinear[img_, zoom_] := ImageResize[img, Scaled[zoom], Resampling -> "Linear"] ;
WaifuCubic[img_, zoom_] := ImageResize[img, Scaled[zoom], Resampling -> "Cubic"] ;
WaifuOMOMS[img_, zoom_] := ImageResize[img, Scaled[zoom], Resampling -> {"OMOMS", 7}] ;


(* ::Subsubsection::Closed:: *)
(*LapSRN*)
WaifuLapSRN[img_, device_ : "GPU"] := Block[
	{render},
	If[MissingQ[Waifu`Models`LapSRN], Return[Missing["NotAvailable"]]];
	render[channel_] := Image[NetReplacePart[Waifu`Models`LapSRN, {
		"Input" -> NetEncoder[{"Image", ImageDimensions@img, ColorSpace -> "Grayscale"}]
	}][channel, TargetDevice -> device]];
	ColorCombine[render /@ ColorSeparate[img]]
];
WaifuLapSRN2[img_, device_ : "GPU"] := Block[
	{render},
	If[MissingQ[Waifu`Models`LapSRN2], Return[Missing["NotAvailable"]]];
	render[channel_] := Image[NetReplacePart[Waifu`Models`LapSRN2, {
		"Input" -> NetEncoder[{"Image", ImageDimensions@img, ColorSpace -> "Grayscale"}]
	}][channel, TargetDevice -> device]];
	ColorCombine[render /@ ColorSeparate[img]]
];


(* ::Subsubsection::Closed:: *)
(*RED30*)
WaifuRED30[img_, zoom_ : 2, device_ : "GPU"] := Block[
	{upsample, ycbcr, channels, netResize, adjust},
	If[MissingQ[Waifu`Models`RED30], Return[Missing["NotAvailable"]]];
	upsample = ImageResize[img, Scaled[zoom], Resampling -> "Cubic"];
	ycbcr = ImageApply[rgbMatrix.# + {0.063, 0.502, 0.502}&, upsample];
	netResize = NetReplacePart[Waifu`Models`RED30,
		"Input" -> NetEncoder[{"Image", ImageDimensions@upsample, ColorSpace -> "Grayscale"}]
	];
	adjust = ColorCombine[{#1 + Image@netResize[#1, TargetDevice -> device], #2, #3}]&;
	ImageApply[rgbMatrixT.# + {-0.874, 0.532, -1.086}&, adjust @@ ColorSeparate[ycbcr]]
];



(* ::Subsubsection::Closed:: *)
(*VDSR*)
WaifuVDSR[img_, zoom_ : 2, device_ : "GPU"] := Block[
	{upsample, ycbcr, channels, netResize, adjust},
	If[MissingQ[Waifu`Models`VDSR], Return[Missing["NotAvailable"]]];
	upsample = ImageResize[img, Scaled[zoom], Resampling -> "Cubic"];
	ycbcr = ImageApply[rgbMatrix.# + {0.063, 0.502, 0.502}&, upsample];
	netResize = NetReplacePart[Waifu`Models`VDSR,
		"Input" -> NetEncoder[{"Image", ImageDimensions@upsample, ColorSpace -> "Grayscale"}]
	];
	adjust = ColorCombine[{#1 + Image@netResize[#1, TargetDevice -> device], #2, #3}]&;
	ImageApply[rgbMatrixT.# + {-0.874, 0.532, -1.086}&, adjust @@ ColorSeparate[ycbcr]]
];



(* ::Subsubsection::Closed:: *)
(*ByNet+*)
WaifuByNet[img_, zoom_ : 2, device_ : "GPU"] := Block[
	{upsample, ycbcr, channels, netResize, adjust},
	If[MissingQ[Waifu`Models`ByNet], Return[Missing["NotAvailable"]]];
	upsample = ImageResize[img, Scaled[zoom], Resampling -> "Cubic"];
	ycbcr = ImageApply[rgbMatrix.# + {0.063, 0.502, 0.502}&, upsample];
	netResize = NetReplacePart[Waifu`Models`ByNet,
		"Input" -> NetEncoder[{"Image", ImageDimensions@upsample, ColorSpace -> "Grayscale"}]
	];
	adjust = ColorCombine[{#1 + Image@netResize[#1, TargetDevice -> device], #2, #3}]&;
	ImageApply[rgbMatrixT.# + {-0.874, 0.532, -1.086}&, adjust @@ ColorSeparate[ycbcr]]
];



(* ::Subsubsection::Closed:: *)
(*VGGSR*)
WaifuVGGSR[img_, device_ : "GPU"] := Module[
	{covImg, covNet, x, y},
	If[MissingQ[Waifu`Models`VGGSR], Return[Missing["NotAvailable"]]];
	{x, y} = ImageDimensions[img];
	covImg = ColorCombine[Reverse@ColorSeparate[ImageResize[img, {x + 14, y + 14}]]];
	covNet = NetReplacePart[Waifu`Models`VGGSR, "Input" -> NetEncoder[{"Image", ImageDimensions@covImg}]];
	covNet[covImg, TargetDevice -> device]
];



(* ::Subsubsection::Closed:: *)
(*SESR*)
WaifuSESR[img_, device_ : "GPU"] := Block[
	{upsample, ycbcr, netResize, adjust},
	If[MissingQ[Waifu`Models`SESR], Return[Missing["NotAvailable"]]];
	upsample = ImageResize[img, Scaled[2], Resampling -> "Cubic"];
	ycbcr = ImageApply[rgbMatrix.# + {0.063, 0.502, 0.502}&, upsample];
	netResize = NetReplacePart[Waifu`Models`SESR, {
		"Input" -> NetEncoder[{"Image", ImageDimensions@img, ColorSpace -> "Grayscale"}]
	}];
	adjust = ColorCombine[{Image@netResize[#1, TargetDevice -> device], #2, #3}]&;
	ImageApply[rgbMatrixT.# + {-0.874, 0.532, -1.086}&, adjust @@ ColorSeparate[ycbcr]]
];


(* ::Subsection::Closed:: *)
(*Additional*)
SetAttributes[
	{WaifuSR$API},
	{Protected, ReadProtected}
]
