

import os


kir_set = set("""PKA1H1_STAND_010007900
PKA1H1_STAND_010018600
PKA1H1_STAND_020007800
PKA1H1_STAND_020007900
PKA1H1_STAND_020016000
PKA1H1_STAND_020019900
PKA1H1_STAND_030017200
PKA1H1_STAND_030027000
PKA1H1_STAND_050006500
PKA1H1_STAND_050007900
PKA1H1_STAND_050016600
PKA1H1_STAND_060010000
PKA1H1_STAND_060018300
PKA1H1_STAND_060023900
PKA1H1_STAND_060028900
PKA1H1_STAND_070010700
PKA1H1_STAND_070030800
PKA1H1_STAND_070032700
PKA1H1_STAND_080009400
PKA1H1_STAND_080011600
PKA1H1_STAND_080020800
PKA1H1_STAND_080022600
PKA1H1_STAND_080029200
PKA1H1_STAND_080037200
PKA1H1_STAND_090012400
PKA1H1_STAND_100005500
PKA1H1_STAND_100007600
PKA1H1_STAND_100017200
PKA1H1_STAND_110030100
PKA1H1_STAND_110052800
PKA1H1_STAND_110055500
PKA1H1_STAND_120016400
PKA1H1_STAND_120017800
PKA1H1_STAND_120018900
PKA1H1_STAND_120059500
PKA1H1_STAND_120061700
PKA1H1_STAND_130015400
PKA1H1_STAND_130019800
PKA1H1_STAND_130019900
PKA1H1_STAND_130025300
PKA1H1_STAND_130032100
PKA1H1_STAND_130049000
PKA1H1_STAND_130061900
PKA1H1_STAND_140019700
PKA1H1_STAND_140023400
PKA1H1_STAND_140037200
PKA1H1_STAND_140049300
PKA1H1_STAND_140059600
PKA1H1_STAND_140064800
PKA1H1_STAND_140074700
PKA1H1_STAND_140074900
PKA1H1_STAND_140078200
PKA1H1_STAND_050008200
PKA1H1_STAND_090018900
PKA1H1_STAND_100026200
PKA1H1_STAND_110017400
PKA1H1_STAND_120048500
PKA1H1_STAND_130028600
PKCLINC047_000005800
PKCLINC047_000009400
PKCLINC047_020015100
PKCLINC047_050007700
PKCLINC047_060023500
PKCLINC047_060027900
PKCLINC047_070030900
PKCLINC047_080021600
PKCLINC047_080023400
PKCLINC047_080036200
PKCLINC047_090050000
PKCLINC047_100005200
PKCLINC047_100017400
PKCLINC047_110053200
PKCLINC047_110055900
PKCLINC047_120059900
PKCLINC047_130014500
PKCLINC047_130018900
PKCLINC047_130024400
PKCLINC047_130061400
PKCLINC047_140058700
PKCLINC047_140063700
PKCLINC047_030017400
PKCLINC047_080012000
PKCLINC047_100007800
PKCLINC047_120019200
PKCLINC047_130048600
PKCLINC047_140036800
PKCLINC048_000009500
PKCLINC048_000009700
PKCLINC048_020016100
PKCLINC048_060024700
PKCLINC048_060029300
PKCLINC048_080021500
PKCLINC048_080023300
PKCLINC048_080038200
PKCLINC048_080048400
PKCLINC048_090012400
PKCLINC048_100005300
PKCLINC048_100007900
PKCLINC048_110055500
PKCLINC048_130019300
PKCLINC048_130028000
PKCLINC048_130029000
PKCLINC048_130061300
PKCLINC048_140019800
PKCLINC048_140023500
PKCLINC048_140059800
PKCLINC048_140075100
PKCLINC048_010019800
PKCLINC048_030026000
PKCLINC048_050007600
PKCLINC048_050007900
PKCLINC048_080011700
PKCLINC048_130019200
PKCLINC048_130048500
PKCLINC048_140016600
PKCLINC048_140049300""".split())

print(len(kir_set))


f_open = open("Orthogroups.txt", "r")
f_out = open("KIR.orthofinder2", "w")
out_set = set([])
for line in f_open:
    data = line.split()
    for i in data:
        if i in kir_set:
            out_set.add(line)
        i = i.split(".1")[0]
        if i in kir_set:
            out_set.add(line)
        i = i.replace(":", "_")
        if i in kir_set:
            out_set.add(line)
        
for i in out_set:
    f_out.write(i)

f_open.close()
f_out.close()