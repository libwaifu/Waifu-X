# Functions

超分辨率重建模块

## WaifuSR

```Mathematica
test=Import["https://i.loli.net/2018/09/09/5b94b9b6e2574.png"];
WaifuSR[test,2]
ImageResize[test,Scaled[2]]
WaifuSR[test,4]
ImageResize[test,Scaled[4]]
```

原始图像:

![sr0.png](https://i.loli.net/2018/09/09/5b94b9b6e2574.png)

传统算法:
![sr2.png](https://i.loli.net/2018/09/09/5b94b9b7b2d5d.png)
![sr4.png](https://i.loli.net/2018/09/09/5b94b9b9208ea.png)

WaifuSR 超分辨率重建:
![sr1.png](https://i.loli.net/2018/09/09/5b94b9b7b9c1c.png)
![sr3.png](https://i.loli.net/2018/09/09/5b94b9b9d1b00.png)
