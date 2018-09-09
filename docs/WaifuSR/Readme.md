# Functions

超分辨率重建模块

## WaifuSR
### 参数说明

::: tip WaifuSR[i,zoom:2]
- i 类型为 `Imager`, 表示要放大的图片
- zoom 的类型为 `Real`, 表示要放大的倍数
	- 1 < zoom < 4
:::

### 可选项

- TargetDevice -> "GPU"
	- 运算单元, 可选 "CPU" 或者 "GPU"

### 返回值

`Image`

### 标准示例

#### 测试代码:

```Mathematica
test=Import["https://i.loli.net/2018/09/09/5b94b9b6e2574.png"];
WaifuSR[test,2]
ImageResize[test,Scaled[2]]
WaifuSR[test,4]
ImageResize[test,Scaled[4]]
```

#### 原始图像:

![sr0.png](https://i.loli.net/2018/09/09/5b94b9b6e2574.png)

#### 传统算法:

![sr2.png](https://i.loli.net/2018/09/09/5b94b9b7b2d5d.png)
![sr4.png](https://i.loli.net/2018/09/09/5b94b9b9208ea.png)

#### WaifuSR 超分辨率重建:

![sr1.png](https://i.loli.net/2018/09/09/5b94b9b7b9c1c.png)
![sr3.png](https://i.loli.net/2018/09/09/5b94b9b9d1b00.png)
