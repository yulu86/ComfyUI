# 安装指南

### 创建conda

```
conda create -n ComfyUI python=3.12
conda activate ComfyUI
```

### 安装`pytorch`和`依赖`

- windows

```
python -m pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu121
python -m pip install -r requirements.txt
```

> 更新troch的方式
> ```
> python -m pip install --upgrade torch torchvision torchaudio torchmetrics torchsde torchvision --index-url https://download.pytorch.org/whl/cu121
> ```

- mac

```
python3 -m pip install --pre torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/nightly/cpu
python3 -m pip install -r requirements.txt
```

> 如果启动报错 `AttributeError: module 'mpmath' has no attribute 'rational'`，执行以下命令：
> ```
> python3 -m pip install mpmath==1.3.0
> ```

- mac(非silicon)
```
pip3 install torch torchvision torchaudio
pip3 install -r requirements.txt
```

### 安装[`ComfyUI-Manager`](https://github.com/ltdrdata/ComfyUI-Manager)和`自定义节点`

- windows

```
cd ./scripts
./install_custom_nodes.bat
cd ..
```

- mac

```
cd ./scripts
bash ./install_custom_nodes.sh
cd ..
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