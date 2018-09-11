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
	- "Mixed", 自适应, 推荐使用
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
