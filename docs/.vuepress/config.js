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
		repo: 'Moe-Net/WaifuX',
		editLinks: true,
		docsDir: 'docs',
		markdown: {
			lineNumbers: true
		},
		sidebar: [
			{
				title: '开发文档',
				children: [
					'/Start/'
				]
			},
			{
				title: 'Waifu-SR',
				children: [
					'/Super-Revolution/'
				]
			},
			{
				title: 'Waifu-SY',
				children: [
					'/Shi-Yun/'
				]
			}
		]
	},
	serviceWorker: true
};
