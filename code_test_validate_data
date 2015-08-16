Function Last(choice As Long, Rng As Range)
' 1 = last row
' 2 = last column
' 3 = last cell
    Dim lrw As Long
    Dim lcol As Long

    Select Case choice

    Case 1:
        On Error Resume Next
        Last = Rng.Find(What:="*", _
                        After:=Rng.Cells(1), _
                        Lookat:=xlPart, _
                        LookIn:=xlFormulas, _
                        SearchOrder:=xlByRows, _
                        SearchDirection:=xlPrevious, _
                        MatchCase:=False).Row
        On Error GoTo 0

    Case 2:
        On Error Resume Next
        Last = Rng.Find(What:="*", _
                        After:=Rng.Cells(1), _
                        Lookat:=xlPart, _
                        LookIn:=xlFormulas, _
                        SearchOrder:=xlByColumns, _
                        SearchDirection:=xlPrevious, _
                        MatchCase:=False).Column
        On Error GoTo 0

    Case 3:
        On Error Resume Next
        lrw = Rng.Find(What:="*", _
                       After:=Rng.Cells(1), _
                       Lookat:=xlPart, _
                       LookIn:=xlFormulas, _
                       SearchOrder:=xlByRows, _
                       SearchDirection:=xlPrevious, _
                       MatchCase:=False).Row
        On Error GoTo 0

        On Error Resume Next
        lcol = Rng.Find(What:="*", _
                        After:=Rng.Cells(1), _
                        Lookat:=xlPart, _
                        LookIn:=xlFormulas, _
                        SearchOrder:=xlByColumns, _
                        SearchDirection:=xlPrevious, _
                        MatchCase:=False).Column
        On Error GoTo 0

        On Error Resume Next
        Last = Rng.Parent.Cells(lrw, lcol).Address(False, False)
        If Err.Number > 0 Then
            Last = Rng.Cells(1).Address(False, False)
            Err.Clear
        End If
        On Error GoTo 0

    End Select
End Function
Function Min(ParamArray ArrayList() As Variant)
'Function will return the minimum value from a list of values
   
Dim n As Integer
Dim iValue As Variant
 
'Set the variable iValue - initialize to the first item or value in list.
iValue = ArrayList(0)

'Checks each item or value in the list to find the smallest.
'The UBound function is used with the LBound function to determine the size of an array. Use the LBound function to find the lower limit of an array dimension. Since array subscripts start at 0, the length of a dimension is greater by one than the highest available subscript for that dimension. The largest available subscript for the indicated dimension of an array can be obtained by using the Ubound function.
For n = 0 To UBound(ArrayList)

'Determines the smallest value.
If ArrayList(n) < iValue Then
iValue = ArrayList(n)
End If

Next n

Min = iValue
   
End Function
Function Max(ParamArray ArrayList() As Variant)
'Function will return the maximum value from a list of values
   
Dim n As Integer
Dim iValue As Variant
 
'Set the variable iValue - initialize to the first item or value in list.
iValue = ArrayList(0)

'Checks each item or value in the list to find the largest.
For n = 0 To UBound(ArrayList)
'Determines the largest value.
If ArrayList(n) > iValue Then
iValue = ArrayList(n)
End If

Next n

Max = iValue
   
End Function
Function Text(Rng As Range)
    If Not IsNumeric(Rng) Then
        Text = 1
        Exit Function
    End If

    Text = 0

    If Rng.Value + "0" <> Rng.Value Then
       Text = 1
    End If
End Function
 
Sub Macro12()
    Dim ALT As Workbook
    Application.AskToUpdateLinks = False
    Set ALT = Workbooks.Open("C:\Users\Surya\Google Drive\Current Courses\Kaggle_Caterpillar\competition_data\comp.xlsm")
    Dim S As Worksheet
    Set S = ALT.Sheets("Sheet1")
    Dim V As Worksheet
    Set V = ALT.Sheets("comp")
    For i = 18 To 30214
        For j = 1 To 15 Step 2
            S.Range(S.Cells(i, j), S.Cells(i, j + 1)).Select
            Selection.Copy
            S.Range(S.Cells(Last(1, S.Range("Q1:Q100")) + 1, 17), S.Cells(Last(1, S.Range("R1:R100")) + 1, 18)).Select
            Selection.PasteSpecial
            For k = 2 To 2048
                If V.Cells(k, 1) = S.Cells(Last(1, S.Range("Q1:Q100")), 17) Then
                V.Activate
                V.Range(V.Cells(k, 2), V.Cells(k, 55)).Select
                Selection.Copy
                S.Activate
                S.Range(S.Cells(Last(1, S.Range("S1:S100")) + 1, 19), S.Cells(Last(1, S.Range("T1:T100")) + 1, 72)).Select
                Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone
                End If
            Next k
        Next j
        For l = 19 To 72
            a = S.Cells(2, l).Value
            b = S.Cells(3, l).Value
            c = S.Cells(4, l).Value
            d = S.Cells(5, l).Value
            e = S.Cells(6, l).Value
            f = S.Cells(7, l).Value
            g = S.Cells(8, l).Value
            h = S.Cells(9, l).Value
            If Max(Text(S.Cells(2, l)), Text(S.Cells(3, l)), Text(S.Cells(4, l)), Text(S.Cells(5, l)), Text(S.Cells(6, l)), Text(S.Cells(7, l)), Text(S.Cells(8, l)), Text(S.Cells(9, l))) = 0 Then
                S.Cells(10, l).Value = Max(a, b, c, d, e, f, g, h)
            End If
            If Min(Text(S.Cells(2, l)), Text(S.Cells(3, l)), Text(S.Cells(4, l)), Text(S.Cells(5, l)), Text(S.Cells(6, l)), Text(S.Cells(7, l)), Text(S.Cells(8, l)), Text(S.Cells(9, l))) = 1 Then
                If a <> "Yes" And a <> "No" And b <> "Yes" And b <> "No" And c <> "Yes" And c <> "No" And d <> "Yes" And d <> "No" And e <> "Yes" And e <> "No" And f <> "Yes" And f <> "No" And g <> "Yes" And g <> "No" And h <> "Yes" And h <> "No" Then
                    S.Cells(10, l).Value = "No Data"
                Else
                If a = "Yes" Or b = "Yes" Or c = "Yes" Or d = "Yes" Or e = "Yes" Or f = "Yes" Or g = "Yes" Or h = "Yes" Then
                    S.Cells(10, l).Value = "Yes"
                Else
                    S.Cells(10, l).Value = "No"
                End If
                End If
            
            Else
            'If Max(Text(S.Cells(2, l)), Text(S.Cells(3, l)), Text(S.Cells(4, l)), Text(S.Cells(5, l)), Text(S.Cells(6, l)), Text(S.Cells(7, l)), Text(S.Cells(8, l)), Text(S.Cells(9, l))) = 1 Then
                If IsNumeric(a) = True Then aa = a
                'Else
                If IsNumeric(a) = False Then aa = 0
                If IsNumeric(b) = True Then bb = b
                'Else
                If IsNumeric(b) = False Then bb = 0
                If IsNumeric(c) = True Then cc = c
                'Else
                If IsNumeric(c) = False Then cc = 0
                If IsNumeric(d) = True Then dd = d
                'Else
                If IsNumeric(d) = False Then dd = 0
                If IsNumeric(e) = True Then ee = e
                'Else
                If IsNumeric(e) = False Then ee = 0
                If IsNumeric(f) = True Then ff = f
                'Else
                If IsNumeric(f) = False Then ff = 0
                If IsNumeric(g) = True Then gg = g
                'Else
                If IsNumeric(g) = False Then gg = 0
                If IsNumeric(h) = True Then hh = h
                'Else
                If IsNumeric(h) = False Then hh = 0
                S.Cells(10, l).Value = Max(aa, bb, cc, dd, ee, ff, gg, hh)
            End If
        Next l
        S.Range(S.Cells(10, 19), S.Cells(10, 72)).Select
        Selection.Copy
        S.Range(S.Cells(Last(1, S.Range("BU1:BU100000")) + 1, 73), S.Cells(Last(1, S.Range("DV1:DV100000")) + 1, 126)).Select
        Selection.PasteSpecial
        S.Range("Q2:BT10").Clear
        
    Next i
    
    
End Sub


