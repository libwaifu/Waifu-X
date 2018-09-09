(* ::Package:: *)
(* ::Title:: *)
(*WaifuSY(诗云)*)
(* ::Subchapter:: *)
(*程序包介绍*)
(* ::Text:: *)
(*Mathematica Package*)
(*Created by Mathematica Plugin for IntelliJ IDEA*)
(*Establish from GalAster's template(v1.3)*)
(**)
(* ::Text:: *)
(*Author:Aster*)
(*Creation Date:2018-08-27*)
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
WaifuTang::usage = "生成古诗";
$TangShiComplex::usage = "生成古诗用字的生僻程度";
(* ::Section:: *)
(*程序包正体*)
(* ::Subsection::Closed:: *)
(*主设置*)
WaifuSY::usage = "";
Begin["`WaifuSY`"];
(* ::Subsection::Closed:: *)
(*主体代码*)
Version$WaifuSY = "V1.0";
Updated$WaifuSY = "2018-08-27";


(* ::Subsubsection:: *)
(*Models*)
$TangShiComplex = 10;
Waifu`Models`Tang4::usage = "";
Waifu`Models`Tang4 := Ready[$Waifus["Tang-4", "Remote"], Echo -> True];
Waifu`Models`Tang5::usage = "";
Waifu`Models`Tang5 := Ready[$Waifus["Tang-5", "Remote"], Echo -> True];
Waifu`Models`Tang7::usage = "";
Waifu`Models`Tang7 := Ready[$Waifus["Tang-7", "Remote"], Echo -> True];



(* ::Subsubsection:: *)
(*功能块 1*)
WaifuTang[l_Integer : 5, len_Integer : 4] := Block[
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
		7, Waifu`Models`WaifuTang7,
		5, Waifu`Models`WaifuTang5,
		_, Waifu`Models`WaifuTang4
	];
	choose[asc_, str_] := Block[
		{keys = Rest@KeyDrop[asc, Append[{"，", "。", "？", _}, StringTake[str, -1]]]},
		RandomChoice[Sqrt[Values@keys] -> Keys@keys]
	];
	next[str_] := choose[net[str, {"TopProbabilities", $TangShiComplex + 4}], str];
	one[char_] := Nest[StringJoin[#, next[#]]&, Nest[StringJoin[#, next[#]]&, char, l - 1] <> "，", l] <> "。";
	head = choose[net["_", {"TopProbabilities", 10$TangShiComplex + 100}], "_"];
	shi = NestList[one@next[StringTake[#, {-1 - l, -2}] <> "，"]&, one@head, len - 1];
	TableForm[Text /@ shi]
];
WaifuTang[l_Integer : 5, len_String] := Block[
	{net, choose, next, one, shi},
	If[Or @@ {
		MissingQ[Waifu`Models`Tang4],
		MissingQ[Waifu`Models`Tang5],
		MissingQ[Waifu`Models`Tang7]
	},
		Return[Missing["NotAvailable"]]
	];
	net = NetStateObject@Switch[l,
		7, Waifu`Models`WaifuTang7,
		5, Waifu`Models`WaifuTang5,
		_, Waifu`Models`WaifuTang4
	];
	choose[asc_, str_] := Block[
		{keys = Rest@KeyDrop[asc, Append[{"，", "。", "？", _}, StringTake[str, -1]]]},
		RandomChoice[Sqrt[Values@keys] -> Keys@keys]
	];
	next[str_] := choose[net[str, {"TopProbabilities", $TangShiComplex + 4}], str];
	one[char_] := Nest[StringJoin[#, next[#]]&, Nest[StringJoin[#, next[#]]&, char, l - 1] <> "，", l] <> "。";
	shi = one /@ Characters@len;
	TableForm[Text /@ shi]
];
(* ::Subsection::Closed:: *)
(*附加设置*)
SetAttributes[
	{WaifuTang},
	{Protected, ReadProtected}
];
End[]
