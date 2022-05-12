'''
0: lowercase
1: uppercase
2: ignore
3: ignore
4: ignore
5: ignore
6: make
7: break
'''
codes = []
with open('tmp') as infile:
   for line in infile:
      codes.append(tuple(line.split(' ')))

for c in codes:
   print(f"scmap[0x{c[2]}].lower = '{c[0]}';")
   print(f"scmap[0x{c[2]}].upper = '{c[1]}';")
