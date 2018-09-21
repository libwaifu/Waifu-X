# Functions

图像修复模块.

## WaifuDenoise
### 参数说明

::: tip WaifuDenoise[img]
- img 类型为 `Image`, 表示要降噪的图片
:::

### 可选项

Method -> "Soft"
	- 模式, 可选 "Soft"|"Hard"|"Mixed"
	- "Soft", 轻柔, 正常情况使用轻柔即可
	- "Hard", 强力, 轻柔无法处理时使用, 不推荐
	- "Mixed", 自适应, 但其实没法很完美的自动识别
TargetDevice -> "GPU"
	- 运算单元, 可选 "CPU" 或者 "GPU"

### 返回值

`Image`

### 标准示例

#### 测试代码:
```haskell
Import[]
```

#### 测试输出:



## WaifuSharpen
### 参数说明

::: tip WaifuSharpen[img]
- img 类型为 `Image`, 表示要锐化的图片
:::

### 可选项

- Method -> "Soft"
	- 模式, 可选 "Soft"|"Hard"
	- "Soft", 轻柔, 正常情况使用轻柔即可
	- "Hard", 强力, 轻柔无法处理时使用
- TargetDevice -> "GPU"
	- 运算单元, 可选 "CPU" 或者 "GPU"

### 返回值 `Image`

::: danger EXPERIMENTAL

实验级, 即便无法使用也不要提交 issue.

*Soft* 适用于那些已经被拉伸过了的模糊图片, 尤其是不清楚拉伸倍数的情况.

效果比 `WaifuSR` 压到一半再拉伸回来要好很多.

*Hard* 提供比 *Soft* 更强力的修正, 但容易修正过度, 导致图片出现色块.
:::

### 标准示例

#### 测试代码:
```haskell
Import[]
```

#### 测试输出:
