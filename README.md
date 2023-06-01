## 导出 onnx

因为 flagai 的依赖复杂，所以构建容器便于导出

`./export.sh` 将导出 onnx

## onnxruntime

onnxruntime 有很多版本可以选择，见[onnxruntime](https://onnxruntime.ai/)。

对于 python 而言，常见的运行时推荐如下：

* 显卡 `pip install onnxruntime-gpu`
* INTEL 的 CPU `pip install onnxruntime-openvino`
* 其他 CPU `pip install onnxruntime`
