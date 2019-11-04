import cx_Oracle
import os
import json

os.environ['NLS_LANG'] = 'SIMPLIFIED CHINESE_CHINA.UTF8'

"""python version 3.6"""

class TestOracle(object):
    def  __init__(self,user,pwd,ip,port,sid):
        self.connect=cx_Oracle.connect(user+"/"+pwd+"@"+ip+":"+port+"/"+sid)
        print(self.connect)
        self.cursor=self.connect.cursor()

    """处理数据二维数组，转换为json数据返回"""
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
            print('delete')
            self.cursor.execute(sql)
            self.connect.commit()
            print("delete ok")
        except Exception as e:
            print(e)
        finally:
            self.disconnect()


if __name__ =="__main__":
    test_oracle=TestOracle('jxjr_cms','123456','10.0.8.11','1521','DEVJXJRCMS')
    # param=[('ww1','job003',1333,2),('ss1','job004',1444,2)]
    #test_oracle.insert("insert into bonus(ENAME,JOB,SAL,COMM)values(:1,:2,:3,:4)",param)#也可以下面这样解决orc-1036非法变量问题
    # test_oracle.insert("insert into bonus(ENAME,JOB,SAL,COMM)values(:ENAME,:JOB,:SAL,:COMM)", param)
    # test_oracle1 = TestOracle('SCOTT', 'pipeline', '127.0.0.1', '1521', 'orcl')
    # test_oracle1.delete("delete from bonus where ENAME='ss1' or ENAME='ww1'")
    # test_oracle3 = TestOracle('SCOTT', 'pipeline', '127.0.0.1', '1521', 'orcl')
    # js = test_oracle3.select('select * from bonus')
    delete_data="delete  from t_ZhaolianLoaninfo where  mobileno = '13600000007'"
                # delete  from t_Zhaolianloanapproveresult where   APPLYNO = '20190402007'; \
                # delete  from T_ZhaoLianSendLoanResult where   APPLYNO = '20190402007';\
                # delete  from T_ZhaoLianHistoryRecord WHERE   APPLYNO = '20190402007';"
    js = test_oracle.delete(delete_data)

    print(js)

