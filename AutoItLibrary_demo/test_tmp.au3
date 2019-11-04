#include <MsgBoxConstants.au3>
#include <Debug.au3>

; �л�����
Func Select_Windows(Const $w1)
   Sleep(1000)
   Global $hWnd = WinWait($w1, "",30)
   Return $hWnd
EndFunc

;��֤���
Func AssertResult(Const $v2)
   ;Local $hWnd = WinWait($v1, "",30)
   Sleep(1000)
   Local $tmp = ControlShow ($hWnd,"",$v2)
   _Assert($tmp==1)
   ;MsgBox($MB_SYSTEMMODAL, "", $tmp)
EndFunc


;��¼
Func Login(Const $username, Const $password)

   ;����ҵ��ϵͳ
   run("C://TestClient//JustThinking.exe")
   Sleep(2000)
   ;Local $wintile2 = WinGetTitle ( "���Ž���ҵ��ϵͳ�Զ�����" )
   Local $wintile = WinGetTitle ( "��¼ҵ�����ϵͳ" )

   IF $wintile > "" Then
	  Select_Windows("��¼ҵ�����ϵͳ")
   Else
	  Sleep(15000)
	  Select_Windows("��¼ҵ�����ϵͳ")
   EndIf

   ; �����˺����룬��¼
   ControlSend($hWnd, "", "[NAME:txtLoginAcc]", $username)
   ControlSend($hWnd, "", "[NAME:txtPassword]", $password)
   ControlClick($hWnd,"","[NAME:btnLogin]", "left",1)

   Sleep(1000)

   ;Local $tmp = ControlEnable ( $hWnd, "","[NAME:btnLogin]")
   ;MsgBox($MB_SYSTEMMODAL, "", $tmp)

   ; �ж��Ƿ��Admin��¼
   Local $hWnd2 = WinWait("��ѡ�����Ļ���", "", 10)
   Local $tmp = ControlEnable ( $hWnd2, "","[NAME:superGridControl1]")
   If $tmp == 1 Then
	  ControlClick($hWnd2,"","[NAME:superGridControl1]", "left",2,93,52)
   Else
	  ;MsgBox($MB_SYSTEMMODAL, "", "����Ա��¼")
   EndIf

   ;��֤�Ƿ��¼�ɹ�
   Select_Windows("��ʰ���")
   AssertResult("[NAME:panelExPass]")

EndFunc

; �����������б�ҳ
Func Page_Loan_Service_Manage()
   AssertResult("[NAME:advTree1]")
   MouseClick("left",60,201,3)
   Sleep(1000)
   MouseClick("left",96,330,1)

   ;ControlClick($hWnd,"","[NAME:advTree1]", "left",1,60,42)

EndFunc

;�������֤�Ų����û�
Func Query_Custom(Const $idcard)
   ;Local $hWnd = WinWait("��ʰ���", "",10)
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

;�򿪼��¼��
Func Check_In()
   ;Local $hWnd = WinWait($v1, "",30)
   ;�϶��ײ�������
   MouseClickDrag("left",486,848,835,848)
   ;������¼��
   Local $tmp1 = ControlShow ($hWnd, "","[NAME:sgLoanManage]")
   Local $tmp2 = ControlShow ($hWnd, "","[NAME:sgLoanInput]")
   If $tmp1 ==1 Or $tmp2==1 Then
	  MouseClick("left",942, 288)
   EndIf
EndFunc

;�ύ���¼��
Func Check_Pull()

EndFunc

;������
Func Workflow()
   Login("Admin","123")
   Page_Loan_Service_Manage()
   Query_Custom("441427198402232113")
   Check_In()
   Check_Pull()
EndFunc

Workflow()

#comments-start
;ѡ���ʰ������
Local $hWnd_jsjf = WinActivate("����", "")

Sleep(2000)

; ����ͷ�����
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
