# 安装指南

### 创建conda

```
conda create -n ComfyUI python=3.12
conda activate ComfyUI
```

### 安装`cuda`和`依赖`

- windows

```
python -m pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu121 
python -m pip install -r requirements.txt
```

### 启动

```
python main.py
```