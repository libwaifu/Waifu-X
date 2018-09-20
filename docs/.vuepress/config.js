module.exports = {
	dest: 'docs/.build',
	locales: {
		'/': {
			lang: 'zh-CN',
			title: 'WaifuX',
			description: 'No game no life ♕'
		}
	},
	head: [
		['link', {rel: 'icon', href: '/favicon.png'}]
	],
	themeConfig: {
		repo: 'Moe-Net/Waifu-X',
		editLinks: true,
		docsDir: 'docs',
		markdown: {
			lineNumbers: true
		},
		sidebar: [
			{
				title: 'Readme',
				children: [
					'/Start/'
				]
			},
			{
				title: 'Waifu-SR',
				children: [
					'/WaifuSR/',
					'/WaifuSR/Model.md',
					'/WaifuSR/Benchmark.md'
				]
			},
			{
				title: 'Waifu-IR',
				children: [
					'/WaifuIR/',
					'/WaifuIR/Model.md'
				]
			},
			{
				title: 'Waifu-CU',
				children: [
					'/WaifuCU/'
				]
			},
			{
				title: 'Waifu-SY',
				children: [
					'/WaifuSY/'
				]
			}
		]
	},
	serviceWorker: true
};
