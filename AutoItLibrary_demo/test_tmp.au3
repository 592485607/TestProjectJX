#include <MsgBoxConstants.au3>
#include <Debug.au3>

; 切换窗口
Func Select_Windows(Const $w1)
   Sleep(1000)
   Global $hWnd = WinWait($w1, "",30)
   Return $hWnd
EndFunc

;验证结果
Func AssertResult(Const $v2)
   ;Local $hWnd = WinWait($v1, "",30)
   Sleep(1000)
   Local $tmp = ControlShow ($hWnd,"",$v2)
   _Assert($tmp==1)
   ;MsgBox($MB_SYSTEMMODAL, "", $tmp)
EndFunc


;登录
Func Login(Const $username, Const $password)

   ;启动业务系统
   run("C://TestClient//JustThinking.exe")
   Sleep(2000)
   ;Local $wintile2 = WinGetTitle ( "吉信金融业务系统自动更新" )
   Local $wintile = WinGetTitle ( "登录业务管理系统" )

   IF $wintile > "" Then
	  Select_Windows("登录业务管理系统")
   Else
	  Sleep(15000)
	  Select_Windows("登录业务管理系统")
   EndIf

   ; 输入账号密码，登录
   ControlSend($hWnd, "", "[NAME:txtLoginAcc]", $username)
   ControlSend($hWnd, "", "[NAME:txtPassword]", $password)
   ControlClick($hWnd,"","[NAME:btnLogin]", "left",1)

   Sleep(1000)

   ;Local $tmp = ControlEnable ( $hWnd, "","[NAME:btnLogin]")
   ;MsgBox($MB_SYSTEMMODAL, "", $tmp)

   ; 判断是否非Admin登录
   Local $hWnd2 = WinWait("请选择登入的机构", "", 10)
   Local $tmp = ControlEnable ( $hWnd2, "","[NAME:superGridControl1]")
   If $tmp == 1 Then
	  ControlClick($hWnd2,"","[NAME:superGridControl1]", "left",2,93,52)
   Else
	  ;MsgBox($MB_SYSTEMMODAL, "", "管理员登录")
   EndIf

   ;验证是否登录成功
   Select_Windows("加拾金服")
   AssertResult("[NAME:panelExPass]")

EndFunc

; 贷款服务管理列表页
Func Page_Loan_Service_Manage()
   AssertResult("[NAME:advTree1]")
   MouseClick("left",60,201,3)
   Sleep(1000)
   MouseClick("left",96,330,1)

   ;ControlClick($hWnd,"","[NAME:advTree1]", "left",1,60,42)

EndFunc

;根据身份证号查找用户
Func Query_Custom(Const $idcard)
   ;Local $hWnd = WinWait("加拾金服", "",10)
   Local $tmp1 = ControlShow($hWnd,"","[NAME:dtpStart]")
   Local $tmp2 = ControlShow($hWnd,"","[NAME:btnReflesh]")
   If $tmp1 == 1 Then
	  ControlFocus($hWnd,"","[NAME:dtpStart]")
	  Send("{BS}")
   Else
	  ControlFocus($hWnd,"","[NAME:dtpStartApplyDate]")
	  Send("{BS}")
   EndIf

   ControlSend($hWnd, "", "[NAME:txtIdcard]", $idcard)

   If $tmp2 == 1 Then
	  ControlClick($hWnd,"","[NAME:btnReflesh]", "left",1)
   Else
	  ControlClick($hWnd,"","[NAME:btnRefresh]", "left",1)
   EndIf
EndFunc

;打开检查录入
Func Check_In()
   ;Local $hWnd = WinWait($v1, "",30)
   ;拖动底部滚动条
   MouseClickDrag("left",486,848,835,848)
   ;点击检查录入
   Local $tmp1 = ControlShow ($hWnd, "","[NAME:sgLoanManage]")
   Local $tmp2 = ControlShow ($hWnd, "","[NAME:sgLoanInput]")
   If $tmp1 ==1 Or $tmp2==1 Then
	  MouseClick("left",942, 288)
   EndIf
EndFunc

;提交检查录入
Func Check_Pull()

EndFunc

;工作流
Func Workflow()
   Login("Admin","123")
   Page_Loan_Service_Manage()
   Query_Custom("441427198402232113")
   Check_In()
   Check_Pull()
EndFunc

Workflow()

#comments-start
;选择加拾金服句柄
Local $hWnd_jsjf = WinActivate("审批", "")

Sleep(2000)

; 点击客服中心
MouseClick ( "left" , 680, 619, 2)
Sleep(3000)
ControlClick($hWnd_jsjf,"","[NAME:txtComFeeRate]","",2,114,9)
Sleep(1000)

for $i=0 TO 6 Step 1
   send("{BS}")

Next
Sleep(1000)

ControlClick($hWnd_jsjf,"","[NAME:txtComFeeRate]","",1,1,4)
Sleep(1000)

Send("01.48")
ControlSend ( $hWnd_jsjf, "", "[NAME:txtAdvice]", "pass" )
ControlClick($hWnd_jsjf,"","[NAME:rbSignScene]","",1,7,7)
ControlSend ( $hWnd_jsjf, "", "[NAME:txtSignRemark]", "pass" )
#comments-end
