# AltCLIP 的 ONNX 导出

## ONNX 是什么？

ONNX(Open Neural Network Exchange)，开放神经网络交换，用于在各种深度学习训练和推理框架转换的一个中间表示格式。

在实际业务中，可以使用 Pytorch 或者 TensorFlow 训练模型，导出成 ONNX 格式，然后在转换成目标设备上支撑的模型格式，比如 TensorRT Engine、NCNN、MNN 等格式。

也可以用 ONNX Runtime 直接运行 ONNX。

使用 ONNX，可以减少模型的依赖，降低部署成本。

## 目录结构

因为 flagai 的依赖复杂，所以构建容器便于导出

### 脚本

* `./build.sh` 在本地构建容器
* `./bash.sh` 在本地进入容器的 bash，方便调试
* `./export.sh` 运行容器，导出 onnx

设置环境变量 MODEL ，可以修改测试、导出的模型 (参见[./export.sh](./export.sh)) 。

默认的模型是 AltCLIP-XLMR-L-m18。

其他可选的模型有：

* AltCLIP-XLMR-L
* AltCLIP-XLMR-L-m9

### 文件

* model/ 存放下载的模型
* onnx/ 存放导出的 onnx

### 测试

#### onnx 模型

* [./test/onnx/onnx_img.py](./test/onnx/onnx_img.py)  生成图片向量
* [./test/onnx/onnx_txt.py](./test/onnx/onnx_txt.py)  生成文本向量
* [./test/onnx/onnx_test.py](./test/onnx/onnx_test.py) 匹配图片向量和文本向量，进行零样本分类

如果想把生成的文本向量和图片向量存入数据库，进行相似性搜索，请先对特征进行归一化。

```python
image_features /= image_features.norm(dim=-1, keepdim=True)
text_features /= text_features.norm(dim=-1, keepdim=True)
```

可借助向量数据库，提升零样本分类的准确性，参见[ECCV 2022 | 无需下游训练，Tip-Adapter 大幅提升 CLIP 图像分类准确率](https://cloud.tencent.com/developer/article/2126102)。

#### onnx 模型的依赖

test/onnx 下面的依赖很简单，只有 transformers 和 onnxruntime，不依赖于 flagai。

onnxruntime 有很多版本可以选择，见[onnxruntime](https://onnxruntime.ai/)。

对于 python 而言，常见的运行时推荐如下：

* 显卡 `pip install onnxruntime-gpu`
* ARM 架构的 MAC `pip install onnxruntime-silicon` (目前还不支持 python3.11)
* INTEL 的 CPU `pip install onnxruntime-openvino`
* 其他 CPU `pip install onnxruntime`

运行 [./test/onnx/setup.sh](./test/onnx/setup.sh) 会自动判断环境，选择安装合适的 onnxruntime 版本和 transformers。

#### pytorch 模型

用了对比 onnx 的向量输出，查看是否一致。

因为用到了 flagai，请如下图所示运行 [./bash.sh ](./bash.sh) 进入容器运行调试。

![](https://pub-b8db533c86124200a9d799bf3ba88099.r2.dev/2023/06/ei64CNo.webp)

* [./test/clip/clip_img.py](./test/clip/clip_img.py)  生成图片向量
* [./test/clip/clip_txt.py](./test/clip/clip_txt.py)  生成文本向量
* [./test/clip/clip_test.py](./test/clip/clip_test.py) 匹配图片向量和文本向量，进行零样本分类

如果不想构建本地镜像，可以运行 `ORG=xxai ./bash.sh` 使用 [hub.docker.com 上的远程镜像](https://hub.docker.com/repository/docker/xxai/altclip-onnx)。
