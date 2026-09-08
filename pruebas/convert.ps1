$word = New-Object -ComObject Word.Application
$word.Visible = $false
$doc = $word.Documents.Open('c:\Users\Ramoncito\.antigravity-ide\Tecnologias de la informacion para la gestion\Entregables\Actividad 4\2_Word_Quarto\Actividad 4 - Investigacion Modernizacion Nacion Neuquen.docx')
$doc.SaveAs('c:\Users\Ramoncito\.antigravity-ide\Tecnologias de la informacion para la gestion\pruebas\act4_preview.pdf', 17)
$doc.Close()
$word.Quit()
print "Exported PDF successfully"
