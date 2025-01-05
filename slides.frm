VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} UserForm1 
   Caption         =   "UserForm1"
   ClientHeight    =   7260
   ClientLeft      =   108
   ClientTop       =   456
   ClientWidth     =   11676
   OleObjectBlob   =   "slides.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "UserForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Sub ImportTextFileToSlides()
    Dim dlg As FileDialog
    Dim txtFile As String
    Dim fileContent As String
    Dim fileLine As String
    Dim slides() As String
    Dim slideText As String
    Dim i As Integer
    Dim pptSlide As Slide
    
    ' Criar um diálogo para selecionar o arquivo TXT
    Set dlg = Application.FileDialog(msoFileDialogFilePicker)
    With dlg
        .Title = "Selecione um arquivo TXT"
        .Filters.Add "Text Files", "*.txt", 1
        .AllowMultiSelect = False
        
        If .Show <> -1 Then Exit Sub ' Cancelado pelo usuário
        txtFile = .SelectedItems(1)
    End With
    
    ' Abrir o arquivo para leitura
    Open txtFile For Input As #1
    
    ' Inicializar variáveis
    slideText = ""
    ReDim slides(0)
    
    ' Ler o arquivo linha por linha
    Do While Not EOF(1)
        Line Input #1, fileLine
        ' Verificar o caractere "|"
        If InStr(fileLine, "|") > 0 Then
            slideText = slideText & Replace(fileLine, "|", "") & vbCrLf
            ' Adicionar o texto ao array de slides
            slides(UBound(slides)) = slideText
            ReDim Preserve slides(UBound(slides) + 1)
            slideText = ""
        Else
            slideText = slideText & fileLine & vbCrLf
        End If
    Loop
    ' Adicionar o último slide, se necessário
    If slideText <> "" Then
        slides(UBound(slides)) = slideText
    End If
    
    ' Fechar o arquivo
    Close #1
    
    ' Criar slides no PowerPoint
    For i = LBound(slides) To UBound(slides) - 1
        Set pptSlide = ActivePresentation.slides.Add(ActivePresentation.slides.Count + 1, ppLayoutText)
        pptSlide.Shapes.Placeholders(1).TextFrame.TextRange.Text = Trim(slides(i))
    Next i
    
    MsgBox "Texto importado e slides criados com sucesso!", vbInformation
End Sub


Private Sub UserForm_Click()
ImportTextFileToSlides
End Sub
