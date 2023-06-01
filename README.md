## ONNX 是什么？

### ONNX 的优点

## 目录结构

因为 flagai 的依赖复杂，所以构建容器便于导出

### 脚本

* `./build.sh` 在本地构建容器
* `./bash.sh` 在本地进入容器的 bash，方便调试
* `./export.sh` 运行容器，导出 onnx

### 文件

* model/ 存放下载的模型
* onnx/ 存放导出的 onnx

### 测试

* [./test/onnx] 调用 onnx 模型

  * [./test/onnx/onnx_img.py](./test/onnx/onnx_img.py)  生成图片向量
  * [./test/onnx/onnx_txt.py](./test/onnx/onnx_txt.py)  生成文本向量
  * [./test/onnx/onnx_test.py](./test/onnx/onnx_test.py) 匹配图片向量和文本向量，进行零样本分类

## onnxruntime

onnxruntime 有很多版本可以选择，见[onnxruntime](https://onnxruntime.ai/)。

对于 python 而言，常见的运行时推荐如下：

* 显卡 `pip install onnxruntime-gpu`
* ARM 架构的 MAC `pip install onnxruntime-silicon` (目前还不支持 python3.11)
* INTEL 的 CPU `pip install onnxruntime-openvino`
* 其他 CPU `pip install onnxruntime`

运行 [./test/onnx/setup.sh](./test/onnx/setup.sh) 会自动判断环境，选择安装合适的版本。

* [./test/clip]
