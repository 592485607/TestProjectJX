# coding:utf-8
import sys
import os
currentprojectpatch = os.getcwd()
sys.path.append(currentprojectpatch)

import unittest
import json
from . import HTMLTestRunner
from .runmethod import RunMethod
from .connect_db import OperationOracle

class TestMethod(unittest.TestCase):

	@classmethod
	def setUpClass(cls):
		test_oracle = OperationOracle('jxjr_cms', '123456', '10.0.8.11', '1521',
									  'DEVJXJRCMS')  # 用自己的实际数据库用户名、密码、主机ip地址 替换即可
		mobileno = "'13600000007'"
		APPLYNO = "'20190402007'"
		delete_data_sql = [
			"delete from t_ZhaolianLoaninfo where mobileno = " + mobileno,
			"delete from t_Zhaolianloanapproveresult where APPLYNO = " + APPLYNO,
			"delete from T_ZhaoLianSendLoanResult where APPLYNO = " + APPLYNO,
			"delete from T_ZhaoLianHistoryRecord WHERE  APPLYNO = " + APPLYNO,
		]
		test_oracle.delete(delete_data_sql)
		# print('这是所有case的前置条件,用于初始化数据')

	@classmethod
	def tearDownClass(cls):
		test_oracle = OperationOracle('jxjr_cms', '123456', '10.0.8.11', '1521',
									  'DEVJXJRCMS')  # 用自己的实际数据库用户名、密码、主机ip地址 替换即可
		mobileno = "'13600000007'"
		APPLYNO = "'20190402007'"
		delete_data_sql = [
			"delete from t_ZhaolianLoaninfo where mobileno = " + mobileno,
			"delete from t_Zhaolianloanapproveresult where APPLYNO = " + APPLYNO,
			"delete from T_ZhaoLianSendLoanResult where APPLYNO = " + APPLYNO,
			"delete from T_ZhaoLianHistoryRecord WHERE  APPLYNO = " + APPLYNO,
		]
		test_oracle.delete(delete_data_sql)

	# print('这是所有case的后置条件：用于清理')

	#  这是每个case的前置条件
	def setUp(self):
		self.run=RunMethod()
		self.url =  'http://10.0.7.5:6363/api/Kxdb/Action'
		# self.url =  'http://10.0.7.24:4444/api/Action'

	def tearDown(self):
		pass
		# print('这是每条case的后置条件01')

	def test_01(self):
		"""5.1	授信申请推送接口"""
		data = {
			"appId": "10000",
			"merchantId": "10000",
			"subMerchantId": "",
			"openId": "",
			"flowNo": "201904020007",
			"encoding": "UTF-8",
			"reqDateTime": "2019-04-02 23:59:59",
			"reqServiceId": "api.mucfc.uloan.creditApply",
			"bizContent": {
				"applyNo": "20190402007",
				"custNo": "20190402001007",
				"custName": "张5",
				"idNo": "320206198804037934",
				"mobileNo": "13600000007",
				"certValidDate": "",
				"address": "",
				"nation": "",
				"workCompany": "",
				"workCity": "",
				"workAddr": "",
				"residentCity": "",
				"residentAddr": "",
				"bioCompareRs": "",
				"suggestLimit": "100000.00",
				"applyTime": "2019-04-02"
			}
		}
		res = self.run.run_main('POST',self.url ,data)

		print (res)
		expect = "100 "
		self.assertEqual(expect,res['resultCode'],"测试失败")

	# @unittest.skip('test_02')
	def test_02(self):
		"""5.3	授信结果查询接口"""
		data = {
			"appId": "10000",
			"merchantId": "10000",
			"subMerchantId": "",
			"openId": "",
			"flowNo": "201904020007",
			"encoding": "UTF-8",
			"reqDateTime": "2019-04-02 23:59:59",
			"reqServiceId": "api.mucfc.uloan.queryApplyResult",
			"bizContent": {
				"applyNo": "20190402007",
			}
		}
		res = self.run.run_main('POST', self.url, data)

		print(res)
		resultCode = "SUCCESS"
		applyRs = "01"
		expect = {
			'resultCode':'SUCCESS',
			'applyRs': '01',
			'Status': '1'
		}
		# self.assert
		self.assertEqual(applyRs, res['applyRs'], "测试失败")

	# @unittest.skip('test_03')
	def test_03(self):
		"""5.4	放款结果推送接口"""
		data = {
			"appId": "10000",
			"merchantId": "10000",
			"subMerchantId": "",
			"openId": "",
			"flowNo": "201904020007",
			"encoding": "UTF-8",
			"reqDateTime": "2019-04-02 23:59:59",
			"reqServiceId": "api.mucfc.uloan.sendLoanResult",
			"bizContent": {
				"applyNo": "20190402007",
				"transNo":"201904020007",
				"custNo": "20190402001007",
				"loanAmt": "100000.00",
				"totalInstallCnt": "12",
				"loanUse": "教育",
				"loanRs": "02",
				"loanDate": "20190403",
				"loanTime": "160620",
				"contractNo": "20190402000107",
				"globleSeqNo": "20190000000007",
				"transSeqNo": "20190000000007"
			}
		}
		res = self.run.run_main('POST', self.url, data)

		print(res)
		expect = "100"
		self.assertEqual(expect, res['resultCode'], "测试失败")

if __name__ == '__main__':

	suite = unittest.TestSuite()
	suite.addTest(TestMethod('test_01'))
	suite.addTest(TestMethod('test_02'))
	suite.addTest(TestMethod('test_03'))
	filepath = '../report/htmlreport.html'
	fr = open(filepath,'wb')
	report = HTMLTestRunner.HTMLTestRunner(stream=fr,title='测试报告',description='测试报告详情')
	report.run(suite)
	unittest.main()
