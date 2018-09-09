# Waifu:X

## Install

一键安装:

```Mathematica
PacletInstall@"https://github.com/Moe-Net/Waifu-X/releases/download/v0.1.x/Waifu-0.1.x.paclet"
```

因为 API 快速变动, 不建议使用一键安装, 请按以下步骤手动安装

打开以下文件夹
```Mathematica
SystemOpen[FileNameJoin@{$UserBaseDirectory, "Applications"}]
```

接着使用 git 同步以下目录:
```bash
git clone https://github.com/Moe-Net/Waifu-X.git --depth 1 --branch master
```

手动安装的话也是解压到这个目录.

最终的目录结构为:

```yaml
- ApplicationData/
- Application/
    - Waifu/
        - Kernel/
        - PacletInfo.m
        - WaifuLoader.m
```



## License

> ©Copyright by **Mozilla Public License Version 2.0**.
