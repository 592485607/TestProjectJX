#coding:utf-8
import json
import requests
from urllib import parse

#---------数据加密解密----------
class DataCovertHandler(object):
    def __init__(self,url):
        self.url = url
        self.encrypt_headers = {
            "Content-Type": "application/x-www-form-urlencoded"
        }
        self.encrypt_api = url+"/api/test"  # http://10.0.7.24:4444/api/test

        self.decryption_header = {
            "Content-Type": "application/json"
        }
        self.decryption_api =url+ "/api/test/1"

    def get_encrypt_data(self,*args,**kwargs):

        self.data = parse.urlencode(kwargs['kwargs'] )
        self.res = requests.post(url=self.encrypt_api,data=self.data,headers=self.encrypt_headers)
        # print(self.encrypt_api)
        return self.res.text

    def get_decryption_data(self,*args,**kwargs):
        self.data = kwargs['kwargs'].text.encode(encoding="utf-8")
        # self.url = self.url+self.decryption_api
        # print(self.decryption_api)
        # print(self.data)
        self.res = requests.post(url=self.decryption_api,data=self.data,headers=self.decryption_header)
        return self.res.text


if __name__ ==  '__main__':
    data = {
        "appId": "10000",
        "merchantId": "10000",
        "subMerchantId": "10000",
        "openId": "",
        "flowNo": "20190321172841",
        "encoding": "UTF-8",
        "reqDateTime": "2019-03-21 23:59:59",
        "reqServiceId": "api.mucfc.uloan.creditApply",
        "bizContent": {
            "applyNo": "001",
            "custNo": "0003",
            "custName": "王秋了",
            "idNo": "110101199003074450",
            "mobileNo": "13624517834",
            "certValidDate": "",
            "address": "",
            "nation": "",
            "workCompany": "",
            "workCity": "",
            "workAddr": "",
            "residentCity": "",
            "residentAddr": "",
            "bioCompareRs": "",
            "suggestLimit": "200000.00",
            "applyTime": "2019-03-28"
        }
    }


    headers = {
        "Content-Type": "application/x-www-form-urlencoded"
    }
    get_date = DataCovertHandler("http://10.0.7.24:4444")
    # print(data)
    result = get_date.get_encrypt_data(kwargs=data)
    # print(result)

    #请求接口
    url_test = 'http://10.0.7.24:4444/api/Action'

    res = requests.post(url=url_test, data=result, headers=headers)
    print(res.text.encode(encoding="utf-8"))
    get_decryp_date = get_date.get_decryption_data(kwargs=res)
    print(get_decryp_date)

