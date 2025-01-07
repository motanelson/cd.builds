VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} UserForm1 
   Caption         =   "UserForm1"
   ClientHeight    =   8196.001
   ClientLeft      =   108
   ClientTop       =   456
   ClientWidth     =   14484
   OleObjectBlob   =   "command.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "UserForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CommandButton1_Click()
    Dim r As String
    Dim rr As String
    
    Dim a
    On Error Resume Next
    Open "out.data" For Output As #1
    Print #1, ""
    Close 1
    rr = Me.TextBox2.Text + " > out.data"
    Me.TextBox1.Text = rr + Chr(10) + Chr(13) + Me.TextBox1.Text
    a = Shell(rr)
    Open "out.data" For Input As #1
    rr = ""
    While EOF(1)
        Line Input #1, r
        rr = rr + r
    Wend
    Close #1
    Me.TextBox1.Text = rr + Chr(10) + Chr(13) + Me.TextBox1.Text
    
    
End Sub
