import json

data = {"name": "xiaohong", "age": 17, "feature": ["美丽", "善良"]}

data = json.dumps(data,ensure_ascii=False)

print(type(data))


if isinstance(data,dict):
    print("Dict:{}".format(data.json()))
else:
    print("str:{}".format(data))

