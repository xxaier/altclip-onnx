#!/usr/bin/env python

from misc.config import ONNX_DIR

import bz2
import tarfile


def txz(folder_path, output_path):
  # 创建.tar文件流
  tar_stream = bz2.BZ2File(output_path, 'w')

  # 将文件夹压缩为.tar文件流
  with tarfile.TarFile(fileobj=tar_stream, mode='w') as tar:
    tar.add(folder_path, arcname='')

  # 关闭.tar文件流
  tar_stream.close()


txz(ONNX_DIR, ONNX_DIR + '.tar.bz2')
