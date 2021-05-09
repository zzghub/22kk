#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------
#include <WinAPISys.au3>
#include <WinAPIvkeysConstants.au3>
; Script Start - Add your code below here


$T1=100
For $i=1 To 100

   numOn(1)
   Sleep($T1)
   numOn(0)
   Sleep($T1)
   capOn(1)
   Sleep($T1)
   capOn(0)
   Sleep($T1)
   scrOn(1)
   Sleep($T1)
   scrOn(0)
   Sleep($T1)
Next

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;#include <WinAPISys.au3>
;#include <WinAPIvkeysConstants.au3>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Func scrOn($yn)
   LedOn($VK_SCROLL, $yn)
EndFunc
Func capOn($yn)
   LedOn($VK_CAPITAL, $yn)
EndFunc
Func numOn($yn)
   LedOn($VK_NUMLOCK, $yn)
EndFunc
Func LedOn($VK_x, $yn)
   Local $stat=_WinAPI_GetKeyState($VK_x)
   If $stat=$yn Then
	  Return
   EndIf
   Local $iFlags=$KEYEVENTF_EXTENDEDKEY
   _WinAPI_Keybd_Event ( $VK_x, $iFlags)
   $iFlags=$KEYEVENTF_EXTENDEDKEY + $KEYEVENTF_KEYUP
   _WinAPI_Keybd_Event ( $VK_x, $iFlags)
EndFunc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
