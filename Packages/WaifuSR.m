WaifuSR::usage = "";

Begin["`WaifuSR``"];
WaifuSR = "";



VDSR = Import@FileNameJoin[{NotebookDirectory[], "Waifu-VDSR.WMLF"}]
rgbMatrix = {{0.257, 0.504, 0.098}, {-0.148, -0.291, 0.439}, {0.439, -0.368, -0.071}};
rgbMatrixT = {{1.164, 0., 1.596}, {1.164, -0.392, -0.813}, {1.164, 2.017, 0.}};
WaifuVDSR[img_, zoom_ : 2, device_ : "GPU"] := Block[
	{covImg, ycbcr, channels, netResize, adjust},
	covImg = ImageResize[img, Scaled[zoom], Resampling -> "Cubic"];
	ycbcr = ImageApply[rgbMatrix.# + {0.063, 0.502, 0.502}&, covImg];
	netResize = NetReplacePart[VDSR,
		"Input" -> NetEncoder[{"Image", ImageDimensions@covImg, ColorSpace -> "Grayscale"}]
	];
	adjust = ColorCombine[{#1 + Image@netResize[#1, TargetDevice -> device], #2, #3}]&;
	ImageApply[rgbMatrixT.# + {-0.874, 0.532, -1.086}&, adjust @@ ColorSeparate[ycbcr]]
];

End[]