# 安装指南

### 创建conda

```
conda create -n ComfyUI python=3.12
conda activate ComfyUI
```

### 安装cuda

- windows

```
python -m pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu121 
```

### 启动

```
python main.py
```