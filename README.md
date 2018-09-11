# Waifu:X

[![Mathematica](https://img.shields.io/badge/Mathematica-%3E%3D11.3.5-brightgreen.svg)](https://www.wolfram.com/mathematica/)
[![Release Vision](https://img.shields.io/badge/release-v0.2.x-ff69b4.svg)](https://github.com/Moe-Net/Waifu-X/releases)
[![Repo Size](https://img.shields.io/github/repo-size/Moe-Net/Waifu-X.svg)](https://github.com/Moe-Net/Waifu-X.git)
[![Code Size](https://img.shields.io/github/languages/code-size/Moe-Net/Waifu-X.svg)](https://github.com/Moe-Net/Waifu-X.git)

## Install +1s

One-Key Installation:

```Mathematica
PacletUninstall["Waifu"]
PacletInstall@"https://github.com/Moe-Net/Waifu-X/releases/download/v0.2.x/Waifu-0.2.x.paclet"
```

因为 API 快速变动, 不建议使用一键安装, 请按以下步骤手动安装

打开以下文件夹
```Mathematica
SystemOpen[FileNameJoin@{$UserBaseDirectory, "Paclets", "Repository"}]
```

接着使用 git 同步以下目录:
```bash
git clone https://github.com/Moe-Net/Waifu-X.git Waifu --depth 1 --branch master
```

手动下载压缩包安装的话也是解压到这个目录, 以后更新手动覆盖即可.

最终的目录结构为:

```yaml
- Configuration/
- Repository/
    - Waifu/
        - Kernel/
        - PacletInfo.m
        - WaifuLoader.m
- Temporary/
```

## Patchouli♂Go

Use a notebook, starting with the following codes!

```
<<Waifu`
??Waifu`*
```

Find APIs in web documentation: https://waifu-x.netlify.com/WaifuSR

## License

> ©Copyright by **Mozilla Public License Version 2.0**.
