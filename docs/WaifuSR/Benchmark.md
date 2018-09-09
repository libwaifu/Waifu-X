# BenchMark

成绩来自: https://github.com/Moe-Net/Waifu-SR/blob/8fee83987e2e2d28aff08c23e618c85b0e66841d/Models/Readme.md

## WaifuSR

### Quantity score

Name|size|paras|layers|nodes|speed|FLOPS|
----|----|-----|------|-----|-----|-----|
Nearest|None|None|None|None|1.141 ms|136.9 M
Linear|None|None|None|None|4.184 ms|486.1 M
Cubic|None|None|None|None|10.83 ms|1.380 G
o-MOMS|None|None|None|None|9.975 ms|1.292 G
VGGSR|2.11 MB|552.5 K|13|-|97.57 ms|63.20 G
VDSR|2.54 MB|665.9 K|40|82|344.1 ms|222.9 G
ByNet+|4.36 MB|1.145 M|63|99|455 ms|249.9 G
SESR|1.19 MB|312.5 K|65|-|358.9 ms|232.5 G
SESR+|-|-|-|-|-|-
LapSRN|1.66 MB|435.3 K|28|92|381.4 ms|247.0 G
LapSRN+|3.32 MB|870.1 K|53|174|1.085 s|703.0 G
RED30|15.7 MB|4.135 M|68|130|807.1 ms|522.7 G
-|-|-|-|-|-|-

### Quality score

Name|Zoom|-SAD-|+PSNR+|+SSIM+|+FSIM+|+GMSD+
----|----|-----|------|------|------|------|
Nearest|Auto|15617.3|27.0725|0.80129|-|-
Linear|Auto|14525.1|28.2834|0.83432|-|-
Cubic|Auto|12699.4|30.0381|0.88529|-|-
o-MOMS|Auto|12697.5|30.3557|-|-|-
VGGSR|×2|78561.5|14.8726|-|-|-
**VDSR**|Auto|11215.1|30.8817|-|-|-
**ByNet+**|Auto|11516.5|31.1093|-|-|-
**SESR**|×2|14200.5|28.9835|-|-|-
**SESR+**|×4|-|-|-|-|-
LapSRN|×2|8671.42|33.6572|-|-|-
LapSRN+|×4|8315.27|33.6519|-|-|-
**RED30**|Auto|12119.1|30.8003|-|-|-
-|-|-|-|-|-|-

- Bold: **YCbCr Only**, single-channel rendering in YCbCr space, speed up but quality lost.
- Auto: **AutoZoom**, non-fixed magnification, can be scaled at any magnification
