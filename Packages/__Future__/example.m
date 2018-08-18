<|
	"Very Deep Net for Super-Resolution" -> <|
		"UUID" -> "7a379346-3f69-40ce-b0df-0f34a9d9ee7b",
		"ResourceType" -> "NeuralNet",
		"ByteCount" -> 2837896,
		"ContentElements" -> {
			"ConstructionNotebook",
			"ConstructionNotebookExpression",
			"EvaluationNet",
			"UninitializedEvaluationNet",
			"EvaluationExample"
		},
		"Version" -> "1.1.0",
		"Description" -> "Increase the resolution of an image",
		"InputDomains" -> {"Image"},
		"TaskType" -> {"Image Processing"},
		"Keywords" -> {"vdsr", "super resolution"},
		"TrainingSetInformation" -> "A dataset of 291 images, expanded with data augmentation.",
		"Performance" -> "This model achieves a peak signal-to-noise ratio of 30.76 on the Urban 100 dataset with a scale factor of 2.",
		"Attributes" -> {"LocalCopyable", "CloudCopyable", "Multipart"},
		"LatestUpdate" -> DateObject[{2018, 7, 26}, "Day", "Gregorian", -4.],
		"AlternativeNames" -> {},
		"AutoCopyExampleNotebook" -> True,
		"AutoUpdate" -> Automatic,
		"ContributedBy" -> Missing["NoInput"],
		"DefaultContentElement" -> "EvaluationNet",
		"Details" -> "Released in 2016, this net uses an architecture inspired by VGG in order to create super-resolution images.",
		"Discoverable" -> True,
		"DisplayedSourceFields" -> {},
		"ExampleNotebook" -> CloudObject["https://www.wolframcloud.com/objects/1162b5d4-cd33-4aef-87e4-16194161691f"],
		"ExternalLinks" -> {},
		"InformationElements" -> <||>,
		"LayerCount" -> 40,
		"OriginalUUID" -> "315cf1a5-a69f-41cc-b57d-096dfbd24379",
		"Originator" -> Missing["NoInput"],
		"ParameterCount" -> 665921, "PermissionsGroups" -> {},
		"PricingInformation" -> Marketplace`Private`pi,
		"Public" -> True,
		"PublisherUUID" -> "1ca97c83-1e23-4ef8-a6ef-83680a155d35",
		"ReleaseDate" -> DateObject[{2018, 7, 26}, "Day", "Gregorian", -4.],
		"SeeAlso" -> {},
		"ShortName" -> "Very-Deep-Net-for-Super-Resolution",
		"SourceMetadata" -> <|
			"Citation" -> "J. Kim, J. Kwon Lee and K. Mu Lee, \"Accurate Image Super-Resolution Using Very Deep Convolutional Networks",
			"Source" -> Hyperlink[
				"https://github.com/huangzehao/caffe-vdsr"
			],
			"Rights" -> Hyperlink["MIT License", "https://opensource.org/licenses/MIT"],
			"Date" -> DateObject[{2016}, "Year", "Gregorian", -4.]
		|>,
		"StoredElements" -> {
			"ConstructionNotebookExpression",
			"EvaluationNet",
			"UninitializedEvaluationNet",
			"EvaluationExample"
		},
		"SubmissionID" -> "4942",
		"SubmissionUUID" -> "e6038779-3b02-40c3-8622-622af08d3c52",
		"Submitter" -> "matteos@wolfram.com",
		"TrainingSetInformationLinks" -> {
			"291 images" -> Hyperlink["291 images", "https://github.com/huangzehao/caffe-vdsr#train-1"],
			"Urban 100" -> Hyperlink["Urban 100", "https://github.com/jbhuang0604/SelfExSR"]
		},
		"VersionHistory" -> <|
			"1.1.0" -> <|
				"Timestamp" -> DateObject[{2018, 7, 26}, "Instant", "Gregorian", -4.],
				"Approver" -> "meghanr@wolfram.com",
				"SubmissionID" -> Missing["NotAvailable"],
				"Submitter" -> Missing["NotAvailable"],
				"SubmissionUUID" -> Missing["NotAvailable"],
				"OriginalUUID" -> Missing["NotAvailable"]
			|>
		|>,
		"WolframLanguageVersionRequired" -> "11.3"
	|>
|>;