import re

r = re.compile('[^.;?!]+')
r2 = re.compile('\w+')

string = "Hola como estas \n\n Era hoy???.\nYo muy bien , llama cuando puedas"
print(string)

frases = r.findall(string)
for elemento in frases:
    for we in elemento.split("\n\n"):
          if r2.findall(we) !=[]:
              print(r2.findall(we))
