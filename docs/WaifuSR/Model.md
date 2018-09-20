# Models

如果你想使用其他超分辨率重建模型, 可以调用内部函数或者调整以下模型.

该项目的本体与源码在: [Moe-Net/Waifu-SR](https://github.com/Moe-Net/Waifu-SR)

::: warning Attention
注意, 所有模块都是惰性加载的

接口函数 ``Waifu`WaifuSR`WaifuSR$API[]`` 必须被调用过至少一次, 否则以下函数都无法被找到.
:::

## VGGSR
### Model

Waifu2X 所使用的模型, 使用 VGG 架构.

- Cite: [Waifu2X](https://github.com/nagadomi/waifu2x)

- ``Waifu`Models`VGGSR``

### Function

```haskell
Waifu`WaifuSR`WaifuSR$API[];
WaifuVGGSR[img, "GPU"]
```

## VDSR
### Model

深层神经网络模型, 至少在当时是深层神经网络.

- Cite

- ``Waifu`Models`VDSR``

![VDSR](https://i.loli.net/2018/09/20/5ba31764647a2.png)

### Function



## LapSRN

## ByNet

![ByNet](https://i.loli.net/2018/09/20/5ba317648a5e0.png)


## SRResNet
### Model

::: danger EXPERIMENTAL

实验级, 即便无法使用也不要提交 issue.

残差神经网络在超分辨率上的运用.

- Cite: [Photo-Realistic Single Image Super-Resolution Using a Generative Adversarial Network](https://arxiv.org/pdf/1609.04802v5.pdf)

:::

### Function

```haskell
Needs["MXNetLink`"];
Waifu`WaifuSR`WaifuSR$API[];
"2x 放大倍率";
Waifu`WaifuSR`WaifuSRResNet[img, "GPU"]
"3x 放大倍率";
Waifu`WaifuSR`WaifuSRResNet[img, "GPU"]
"4x 放大倍率";
Waifu`WaifuSR`WaifuSRResNet[img, "GPU"]
"8x 放大倍率";
Waifu`WaifuSR`WaifuSRResNet[img, "GPU"]
```
