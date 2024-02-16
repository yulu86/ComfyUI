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

- mac

```
python3 -m pip install --pre torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/nightly/cpu
python3 -m pip install -r requirements.txt
```

### 安装[`ComfyUI-Manager`](https://github.com/ltdrdata/ComfyUI-Manager)

```
cd ./custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager.git
```

### 启动

- windows 

```
python main.py
```

- mac

```
python3 main.py --force-fp16
```