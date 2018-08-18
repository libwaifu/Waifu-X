
file = URLExecute@NeuralNetworks`Private`NetModel`$NetModelIndexURL

NeuralNetworks`Private`NetModel`AdditionalIndex



NeuralNetworks`Private`NetModel`readIndex[file_] := Block[
	{ass},
	ass = BinaryDeserialize@ReadByteArray@file;
	If[
		!Developer`AssociationVectorQ[ass],
		$Failed,
		Association[Map[Function[#Name -> KeyDrop[#, "Name"]], ass]]
	]

];


