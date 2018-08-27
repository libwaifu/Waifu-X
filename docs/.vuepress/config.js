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
					'/Start/',
					'/Start/Developer.md',
					'/Start/Editor.md',
					'/Start/EditorAdv.md'
				]
			},
			{
				title: 'Waifu-SR',
				children: [
					'/WaifuSR/'
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
