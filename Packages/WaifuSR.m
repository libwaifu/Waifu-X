(* ::Package:: *)
(* ::Title:: *)
(*WaifuSR(WaifuSR)*)
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
WaifuSR::usage = "";
(* ::Section:: *)
(*程序包正体*)
(* ::Subsection::Closed:: *)
(*主设置*)
Begin["`WaifuSR`"];
(* ::Subsection::Closed:: *)
(*主体代码*)
Version$WaifuSR = "V1.0";
Updated$WaifuSR = "2018-08-21";
(* ::Subsubsection:: *)
(*功能块 1*)
WaifuSR = "";


(* ::Subsubsection:: *)
(*功能块 2*)
rgbMatrix = {{0.257, 0.504, 0.098}, {-0.148, -0.291, 0.439}, {0.439, -0.368, -0.071}};
rgbMatrixT = {{1.164, 0., 1.596}, {1.164, -0.392, -0.813}, {1.164, 2.017, 0.}};
WaifuVDSR[img_, zoom_ : 2, device_ : "GPU"] := Block[
	{covImg, ycbcr, channels, netResize, adjust},
	If[
		MissingQ[VDSR = Ready[$Waifus["Waifu-VDSR", "Remote"]]],
		Return[Missing[NotAvailable]]
	];
	covImg = ImageResize[img, Scaled[zoom], Resampling -> "Cubic"];
	ycbcr = ImageApply[rgbMatrix.# + {0.063, 0.502, 0.502}&, covImg];
	netResize = NetReplacePart[VDSR,
		"Input" -> NetEncoder[{"Image", ImageDimensions@covImg, ColorSpace -> "Grayscale"}]
	];
	adjust = ColorCombine[{#1 + Image@netResize[#1, TargetDevice -> device], #2, #3}]&;
	ImageApply[rgbMatrixT.# + {-0.874, 0.532, -1.086}&, adjust @@ ColorSeparate[ycbcr]]
];


(* ::Subsection::Closed:: *)
(*附加设置*)
SetAttributes[
	{WaifuSR},
	{Protected, ReadProtected}
];
End[]
