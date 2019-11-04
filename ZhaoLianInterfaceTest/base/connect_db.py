import cx_Oracle
import json
import os
os.environ['NLS_LANG'] = 'SIMPLIFIED CHINESE_CHINA.UTF8'

class OperationOracle(object):
    def  __init__(self,user,pwd,ip,port,sid):
        self.connect=cx_Oracle.connect(user+"/"+pwd+"@"+ip+":"+port+"/"+sid)
        print(self.connect)
        self.cursor=self.connect.cursor()

    def select(self,sql):
        list=[]
        self.cursor.execute(sql)
        result=self.cursor.fetchall()
        col_name=self.cursor.description
        for row in result:
            dict={}
            for col in range(len(col_name)):
                key=col_name[col][0]
                value=row[col]
                dict[key]=value
            list.append(dict)
        js=json.dumps(list,ensure_ascii=False,indent=2,separators=(',',':'))
        return js
    def disconnect(self):
        self.cursor.close()
        self.connect.close()
    def insert(self,sql,list_param):
        try:
            self.cursor.executemany(sql,list_param)
            self.connect.commit()
            print("插入ok")
        except Exception as e:
            print(e)
        finally:
            self.disconnect()
    def update(self,sql):
        try:
            self.cursor.execute(sql)
            self.connect.commit()

        except Exception as e:
            print(e)
        finally:
            self.disconnect()

    def delete(self,sql):

        try:
            for i in sql:
                print('sql:{}'.format(i))
                self.cursor.execute(i)
                self.connect.commit()
                print("delete ok")
        except Exception as e:
            print(e)
        finally:
            self.disconnect()


if __name__ == "__main__":
    test_oracle = OperationOracle('jxjr_cms', '123456', '10.0.8.11', '1521', 'DEVJXJRCMS') #用自己的实际数据库用户名、密码、主机ip地址 替换即可
    mobileno = "'13600000007'"
    APPLYNO = "'20190402007'"
    delete_data_sql = [
        "delete from t_ZhaolianLoaninfo where mobileno = "+ mobileno,
        "delete from t_Zhaolianloanapproveresult where APPLYNO = "+ APPLYNO,
        "delete from T_ZhaoLianSendLoanResult where APPLYNO = "+ APPLYNO,
        "delete from T_ZhaoLianHistoryRecord WHERE  APPLYNO = "+APPLYNO,
    ]
    test_oracle.delete(delete_data_sql)

# conn = cx_Oracle.connect('jxjr_cms/123456@10.0.8.11:1521/DEVJXJRCMS')   #用自己的实际数据库用户名、密码、主机ip地址 替换即可
# curs=conn.cursor()
# sql="select * from t_ZhaolianLoaninfo where mobileno = '13600000007'" #sql语句
# """
# delete from t_ZhaolianLoaninfo where mobileno = '13600000007';
# delete from t_Zhaolianloanapproveresult where APPLYNO='20190402007';
# delete from T_ZhaoLianSendLoanResult where  APPLYNO='20190402007';
# delete from T_ZhaoLianHistoryRecord WHERE  APPLYNO='20190402007';
# """
# rr=curs.execute (sql)
# row=curs.fetchone()
# print(row)
# curs.close()
# conn.close()
