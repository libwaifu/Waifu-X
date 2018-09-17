(* ::Package:: *)
(* ::Subchapter:: *)
(*Version*)
Version$WaifuSY = "V1.0";
Updated$WaifuSY = "2018-08-27";


(* ::Subchapter:: *)
(*WaifuTang*)
(* ::Subsubsection:: *)
(*Models*)
Waifu`$TangShiComplex = 10;
Waifu`Models`Tang4::usage = "";
Waifu`Models`Tang4 := Ready[$Waifus["Tang-4", "Remote"], Echo -> True];
Waifu`Models`Tang5::usage = "";
Waifu`Models`Tang5 := Ready[$Waifus["Tang-5", "Remote"], Echo -> True];
Waifu`Models`Tang7::usage = "";
Waifu`Models`Tang7 := Ready[$Waifus["Tang-7", "Remote"], Echo -> True];


(* ::Subsubsection:: *)
(*Main*)
WaifuTang$API[l_Integer : 5, len_Integer : 4] := Block[
	{
		net, choose, next, one, head, shi
	},
	If[Or @@ {
		MissingQ[Waifu`Models`Tang4],
		MissingQ[Waifu`Models`Tang5],
		MissingQ[Waifu`Models`Tang7]
	},
		Return[Missing["NotAvailable"]]
	];
	net = NetStateObject@Switch[l,
		7, Waifu`Models`Tang4,
		5, Waifu`Models`Tang5,
		_, Waifu`Models`Tang4
	];
	choose[asc_, str_] := Block[
		{keys = Rest@KeyDrop[asc, Append[{"，", "。", "？", _}, StringTake[str, -1]]]},
		RandomChoice[Sqrt[Values@keys] -> Keys@keys]
	];
	next[str_] := choose[net[str, {"TopProbabilities", Waifu`$TangShiComplex + 4}], str];
	one[char_] := Nest[StringJoin[#, next[#]]&, Nest[StringJoin[#, next[#]]&, char, l - 1] <> "，", l] <> "。";
	head = choose[net["_", {"TopProbabilities", 10 Waifu`$TangShiComplex + 100}], "_"];
	shi = NestList[one@next[StringTake[#, {-1 - l, -2}] <> "，"]&, one@head, len - 1];
	TableForm[Text /@ shi]
];
WaifuTang$API[l_Integer : 5, len_String] := Block[
	{net, choose, next, one, shi},
	If[Or @@ {
		MissingQ[Waifu`Models`Tang4],
		MissingQ[Waifu`Models`Tang5],
		MissingQ[Waifu`Models`Tang7]
	},
		Return[Missing["NotAvailable"]]
	];
	net = NetStateObject@Switch[l,
		7, Waifu`Models`Tang7,
		5, Waifu`Models`Tang5,
		_, Waifu`Models`Tang4
	];
	choose[asc_, str_] := Block[
		{keys = Rest@KeyDrop[asc, Append[{"，", "。", "？", _}, StringTake[str, -1]]]},
		RandomChoice[Sqrt[Values@keys] -> Keys@keys]
	];
	next[str_] := choose[net[str, {"TopProbabilities", Waifu`$TangShiComplex + 4}], str];
	one[char_] := Nest[StringJoin[#, next[#]]&, Nest[StringJoin[#, next[#]]&, char, l - 1] <> "，", l] <> "。";
	shi = one /@ Characters@len;
	TableForm[Text /@ shi]
];


(* ::Subsection::Closed:: *)
(*Additional*)
SetAttributes[
	{WaifuTang$API},
	{Protected, ReadProtected}
]
