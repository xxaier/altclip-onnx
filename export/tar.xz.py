#!/usr/bin/env python

import tarfile
import lzma
from misc.config import ONNX_DIR


def txz(folder_path, output_path):
  # 创建.tar文件
  tar_path = output_path + '.tar'
  with tarfile.open(tar_path, 'w') as tar:
    tar.add(folder_path, arcname='')

  # 创建.tar.xz文件
  with open(tar_path, 'rb') as tar_file:
    with lzma.open(output_path, 'w') as xz_file:
      xz_file.write(tar_file.read())

  # 删除中间生成的.tar文件
  tarfile.TarFile(tar_path, mode='r').close()


txz(ONNX_DIR, ONNX_DIR + '.tar.xz')
