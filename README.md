## 目录结构

因为 flagai 的依赖复杂，所以构建容器便于导出

* `./build.sh` 在本地构建容器
* `./bash.sh` 在本地进入容器的 bash，方便调试
* `./export.sh` 运行容器，导出 onnx

* model/ 存放下载的模型
* out/ 存放导出的 onnx

## onnxruntime

onnxruntime 有很多版本可以选择，见[onnxruntime](https://onnxruntime.ai/)。

对于 python 而言，常见的运行时推荐如下：

* 显卡 `pip install onnxruntime-gpu`
* ARM 架构的 MAC `pip install onnxruntime-silicon` (目前还不支持 python3.11)
* INTEL 的 CPU `pip install onnxruntime-openvino`
* 其他 CPU `pip install onnxruntime`
