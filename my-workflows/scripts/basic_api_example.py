import json
from urllib import request, parse
import random

base_dir = 'my-workflows/'
workflow_json_file_path = 'scripts/workflow_api.json'


def read_file_content(file_path):
    with open(file_path, 'r') as file:
        content = file.read()
    return content


def load_workflow_json(path):
    full_path = base_dir + path
    return read_file_content(full_path)


def queue_prompt(prompt):
    p = {"prompt": prompt}
    data = json.dumps(p).encode('utf-8')
    req = request.Request("http://127.0.0.1:8188/prompt", data=data)
    request.urlopen(req)


# 加载workflow文件
prompt_text = load_workflow_json(workflow_json_file_path)
print(prompt_text)

prompt = json.loads(prompt_text)

# 修改节点内容
prompt["6"]["inputs"]["text"] = "mario, wearing ironman suite"

# 调用服务端
queue_prompt(prompt)
