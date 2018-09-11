# Models

如果你想使用其他超分辨率重建模型, 可以调用内部函数或者调整以下模型.

该项目的本体与源码在: [Moe-Net/Waifu-SR](https://github.com/Moe-Net/Waifu-SR)

::: warning Attention
注意, 所有模块都是惰性加载的

因此入口函数 `WaifuSR` 必须被调用过, 否则以下函数都无法被找到.
:::

## VGGSR

### Model

```haskell
Waifu`Models`VGGSR
```

### Function

```haskell
WaifuVGGSR[img_, device_ : "GPU"]
```

## VDSR


### Model


### Function

## LapSRN
