#Proyecto de Programacion en Lenguajes Estadisticos
#Alineamiento de secuencias biologicas en R y Python
#Ronald Mateo Ceballos Lozano
#Codigo de R

x = "CAT"
y = "CT"

all_alignments(x, y):
  
  #Devuelve un iterable de todas las alineaciones de dos secuencias.
  #x, y -- Secuencias.

  F(x, y):
  #Una función de ayuda que construye recursivamente las alineaciones.
  #x, y -- Índices de secuencia para los originales x e y
if length(x) == 0 and len(y) == 0:

scenarios = []
if length(x) > 0 and len(y) > 0:
  scenarios.append((x[0], x[1:], y[0], y[1:]))
if length(x) > 0:
  scenarios.append((x[0], x[1:], None, y))
if length(y) > 0:
  scenarios.append((None, x, y[0], y[1:]))

# NOTA: "xh" y "xt" significan "cabeza x" y "cola x",
# siendo la "cabeza" la parte delantera de la secuencia, y
# la "cola" es el resto de la secuencia. Del mismo modo, para
# "yh" e "yt".
for xh, xt, yh, yt in scenarios:
  for alignment in F(xt, yt):
  alignment.appendleft((xh, yh))
yield alignment

alignments = F(range(len(x)), range(len(y)))
return map(list, alignments)

def print_alignment(x, y, alignment):
  print("".join(
    "-" if i is None else x[i] for i, _ in alignment
  ))
print("".join(
  "-" if j is None else y[j] for _, j in alignment
))


for alignment in all_alignments(x, y):
  print_alignment(x, y, alignment)

