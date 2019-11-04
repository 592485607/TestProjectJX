#coding:utf-8
import requests
import json
import os
import sys
currentprojectpatch = os.getcwd()
sys.path.append(currentprojectpatch)

from .DataConvert import DataCovertHandler

class RunMethod:
	def __init__(self):
		self.headers = {
			"Content-Type": "application/x-www-form-urlencoded"
		}
		self.GetDataCovert = DataCovertHandler("http://10.0.7.24:4444")
	def post_main(self,url,data,header=None):
		res = None
		data = self.GetDataCovert.get_encrypt_data(kwargs=data)
		# print(data)
		if header !=None:
			res = requests.post(url=url,data=data,headers=self.headers)
		else:
			# print("header:{}".format(self.headers))
			res = requests.post(url=url,data=data,headers=self.headers)
		# print(res.text)
		res = self.GetDataCovert.get_decryption_data(kwargs=res)
		# print(res)
		if isinstance(res, dict):
			return res
		else:
			return json.loads(res)
		# return res.json()

	def get_main(self,url,data=None,header=None):
		res = None
		if header !=None:
			res = requests.get(url=url,data=data,headers=self.headers,verify=False)
		else:
			res = requests.get(url=url,data=data,headers=self.headers,verify=False)

		if isinstance(res, dict):
			return res.json()
		else:
			return res
		# return res.json()

	def run_main(self,method,url,data=None,header=None):
		res = None
		if method == 'POST':
			res = self.post_main(url,data,header)
		else:
			res = self.get_main(url,data,header)
		return res
		# return json.dumps(res,ensure_ascii=False)
		#return json.dumps(res,ensure_ascii=False,sort_keys=True,indent=2)
