import os

typst_file = r'Entregables\Actividad asincronica 2\Actividad asincronica 2.typ'
txt_file = r'Entregables\Actividad asincronica 2\data\idea 1.txt'

with open(txt_file, 'r', encoding='utf-8') as f:
    transcript = f.read()

# Replace **** with bold speaker indicators
transcript = transcript.replace('****', '**[Locutor]**')

block_content = f'''

#v(10pt)
#text(size: 9.5pt)[
  _Utilizá la siguiente transcripción como fuente para tu nuevo cuaderno:_
]

#block(
  width: 100%,
  fill: rgb("#fcfcfc"),
  stroke: 1pt + border-subtle,
  inset: 12pt,
  radius: 2pt,
  [
    #set text(size: 8.5pt, fill: rgb("#333333"), leading: 0.6em)
    #set par(justify: true)
    
{transcript}
  ]
)
'''

with open(typst_file, 'a', encoding='utf-8') as f:
    f.write(block_content)

print('Transcript appended.')
