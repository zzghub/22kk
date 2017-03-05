;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#include <Array.au3>
#include <FileConstants.au3>
#include <IE.au3>
#include <Date.au3>


;$oIEda = _IECreate("file://E:/kj/22kk/da.txt.htm")
$str="daHtmL"
$oIEda = _IEAttach ( $str, "title" )


;ConsoleWrite( getDa(0) )
;Exit
;;;;;;;;;
$sString=FileRead("ieUrl.txt")
$sMode="url"
$oIE = _IEAttach ( $sString , $sMode )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
$sFilePath=_Now()
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

$oDivAll_item=$oIE.document.getElementById("all_items")
$aDivQs=$oDivAll_item.children

For $i=0 To $aDivQs.length-1
;For $i=0 To 2
   $divHtm  =$aDivQs($i).children(0).innerText & @CRLF & '  '
   $divHtm &=$aDivQs($i).children(2).children(0).innerText & @CRLF
   ToolTip($divHtm)

   For $j=4 To $aDivQs($i).children(2).children.length-1-1
	  $divHtm &= '  [' & ($j-3) & ']' & $aDivQs($i).children(2).children($j).innerText & @CRLF
	  If isChked($i,$j) Then
		 $aDivQs($i).children(2).children($j).children(0).checked=True
	  Else
		 $aDivQs($i).children(2).children($j).children(0).checked=False
	  EndIf
   Next
   $divHtm &= @CRLF

   ;$divHtm=$aDivQs($i).outerHTML
   ;$divHtm=$aDivQs($i).innerHTML
Next

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Exit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Func getABC($num)
   $ascA=Asc("A")
   $ascn=$ascA-4+$num
   ;;;;;
   Return Chr($ascn)
EndFunc

Func isChked($th1,$n)
   ;$da=getDa($th1)
   $da=getDaByBh($th1)
   $ABC=getABC($n)
   If StringInStr($da,$ABC)=0 Then
	  Return False
   Else
	  Return True
   EndIf
EndFunc

Func getDa($th)
   $th += 1
   $tab1=$oIEda.document.getElementsByTagName("table")(0)
   $lastIdx=$tab1.rows.length-1
   For $i=1 To $lastIdx
	  If $tab1.rows($i).cells(0).innerText=$th Then
		 Return StringUpper( $tab1.rows($i).cells(1).getElementsByTagName("input")(0).value )
		 ExitLoop
	  EndIf
   Next
EndFunc

Func getDaByBh($th)
   $th += 1
   $tab1=$oIEda.document.getElementsByTagName("table")(0)
   $lastIdx=$tab1.rows.length-1
   If $th<=$lastIdx Then
	  Return StringUpper( $tab1.rows($th).cells(1).getElementsByTagName("input")(0).value )
   EndIf
   Return ""
EndFunc
