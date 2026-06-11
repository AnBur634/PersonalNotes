
# Excel make 4 digit numbers to time


## Prompt
```md
## Goal
I want a VB-Script formula, that is executed whenever I finish modifying a cell in excel in column 'F'.
The formula should only take action, when I entered a 4 digit integer between 0000 and 2359, but excluding all values where the last 2 digits are > 59, as this cannot happen in a time of day.
When i press the delete button, the cell should be deleted, so the function must correctly identify empty values and not act on them
## Context
Act as a vb-script developer
```

## Result
- Added functionality for Col E
- Added check for weekday in col B
```VB
Private Sub Worksheet_Change(ByVal Target As Range)
    On Error GoTo CleanExit

    ' Only react to edits in column F
    Dim rng As Range
    Set rng = Intersect(Target, Union(Me.Columns("E"), Me.Columns("F")))
    If rng Is Nothing Then Exit Sub

    Application.EnableEvents = False

    Dim cell As Range
    For Each cell In rng.Cells
        Dim txt As String
        txt = Trim(CStr(cell.Value))

        ' If deleted/cleared, do nothing
        If Len(txt) = 0 Then GoTo NextCell
        
        
        ' Check weekday in column B of the same row
        dayTxt = Trim$(CStr(Me.Cells(cell.Row, "B").Value2))
        If Not IsValidWeekday(dayTxt) Then GoTo NextCell


        ' Only act for exactly 4 digits (e.g., 0000..2359)
        If txt Like "####" Then
            Dim hh As Long, mm As Long
            hh = CLng(Left$(txt, 2))
            mm = CLng(Right$(txt, 2))

            ' Validate 00:00..23:59
            If hh >= 0 And hh <= 23 And mm >= 0 And mm <= 59 Then
                ' Convert to real Excel time and format
                ' cell.Value = TimeSerial(hh, mm, 0)
                ' cell.NumberFormat = "hh:mm"
                ' If you want to leave value as text instead, comment the two lines above
                ' and uncomment the next line:
                cell.Value = Format$(hh, "00") & ":" & Format$(mm, "00")
            Else
                ' Invalid minutes/hour ? do nothing
            End If
        Else
            ' Not exactly 4 digits ? do nothing
        End If

NextCell:
    Next cell

CleanExit:
    Application.EnableEvents = True
End Sub


Private Function IsValidWeekday(ByVal s As String) As Boolean
    Dim t As String
    t = UCase$(Trim$(s))
    Select Case t
        Case "MO", "DI", "MI", "DO", "FR", "SA", "SO"
            IsValidWeekday = True
        Case Else
            IsValidWeekday = False
    End Select
End Function
```

- First result
```VB
Private Sub Worksheet_Change(ByVal Target As Range)
    On Error GoTo CleanExit

    ' Only react to edits in column F
    Dim rng As Range
    Set rng = Intersect(Target, Me.Columns("F"))
    If rng Is Nothing Then Exit Sub

    Application.EnableEvents = False

    Dim cell As Range
    For Each cell In rng.Cells
        Dim txt As String
        txt = Trim(CStr(cell.Value))

        ' If deleted/cleared, do nothing
        If Len(txt) = 0 Then GoTo NextCell

        ' Only act for exactly 4 digits (e.g., 0000..2359)
        If txt Like "####" Then
            Dim hh As Long, mm As Long
            hh = CLng(Left$(txt, 2))
            mm = CLng(Right$(txt, 2))

            ' Validate 00:00..23:59
            If hh >= 0 And hh <= 23 And mm >= 0 And mm <= 59 Then
                ' Convert to real Excel time and format
                cell.Value = TimeSerial(hh, mm, 0)
                cell.NumberFormat = "hh:mm"
                ' If you want to leave value as text instead, comment the two lines above
                ' and uncomment the next line:
                ' cell.Value = Format$(hh, "00") & ":" & Format$(mm, "00")
            Else
                ' Invalid minutes/hour → do nothing
            End If
        Else
            ' Not exactly 4 digits → do nothing
        End If

NextCell:
    Next cell

CleanExit:
    Application.EnableEvents = True
End Sub
```



