import math
xlst =           [-0.725, -0.723, -0.721, -0.719, -0.717, -0.715]
ylst = [5633.18542, 5633.26692, 5633.34819, 5633.42925, 5633.51007, 5633.59068]
dy =           [-0.0815, -0.08127, -0.08106, -0.08082, -0.08061]
d2y =                [-0.00023, -0.00021, -0.00024, -0.00021]
d3y =                       [-0.00002, 0.00003, -0.00003]
d4y =                            [-0.00005 , 0.00006]
d5y =                                 [0.00011]

n = 3
i = 0
e = math.e
list1 = []
while i != n:
    x = float(input("Введите число x"))
    list1.append(x)
    i += 1
i = 0 
while i != n:   
    ylist = [0 ,0 ,0]
    itoglist1 = [0,0,0] #|y(x) - P1(x)|
    itoglist2 = [0,0,0] #|y(x) - P11(x)|
    ylist[0] = 14 * e ** (5 + math.cos(list1[0]/10))
    ylist[1] = 14 * e ** (5 + math.cos(list1[1]/10))
    ylist[2] = 14 * e ** (5 + math.cos(list1[2]/10))
    print("Первая интерполяционная формула Ньютона")
    q = list1[i] - xlst[0] / 0.002
    P1 = ylst[0] + q * dy[0] + ((q * (q - 1)) / 2) * d2y[0] + ((q * (q - 1) * (q - 2)) / 6) * d3y[0] + ((q * (q - 1) * (q - 2) * (q - 3)) / 24) * d4y[0] + ((q * (q - 1) * (q - 2) * (q - 3) * (q - 4)) / 120) 
    print("P'5(x) =", P1)
    itoglist1[i] = math.fabs(ylist[i] - P1)

    print("Вторая интерполяционная формула Ньютона")
    t = list1[i] - xlst[5] / 0.002
    P11 = ylst[5] + t * dy[4] + ((t * (t + 1)) / 2) * d2y[3] + ((t * (t + 1) * (t + 2)) / 6) * d3y[2] + ((t * (t + 1) * (t + 2) * (t + 3)) / 24) * d4y[1] + ((t * (t + 1) * (t + 2) * (t + 3) * (t + 4)) / 120) 
    print("P''5(x) =", P11)
    itoglist2[i] = math.fabs(ylist[i] - P11)
    i += 1

print("Интерполяционная формула Лагранжа")
i = 0
lagarang = []
lagarang.append(ylst[0]/((-0.725+0.723)*(-0.725+0.721)*(-0.725+0.719)*(-0.725+0.717)*(-0.725+0.715)))
lagarang.append(ylst[1]/((-0.723+0.725)*(-0.723+0.721)*(-0.723+0.719)*(-0.723+0.717)*(-0.723+0.715)))
lagarang.append(ylst[2]/((-0.721+0.725)*(-0.721+0.723)*(-0.721+0.719)*(-0.721+0.717)*(-0.721+0.715)))
lagarang.append(ylst[3]/((-0.719+0.725)*(-0.719+0.723)*(-0.719+0.721)*(-0.719+0.717)*(-0.719+0.715)))
lagarang.append(ylst[4]/((-0.717+0.725)*(-0.717+0.723)*(-0.717+0.721)*(-0.717+0.719)*(-0.717+0.715)))
lagarang.append(ylst[5]/((-0.715+0.725)*(-0.715+0.723)*(-0.715+0.721)*(-0.715+0.719)*(-0.715+0.717)))
i = 0
y_lagrang = []
while i != n: 
    y_lagrang.append(lagarang[0]*(list1[i]+0.723)*(list1[i]+0.721)*(list1[i]+0.719)*(list1[i]+0.717)*(list1[i]+0.715)+lagarang[1]*(list1[i]+0.725)*(list1[i]+0.721)*(list1[i]+0.719)*(list1[i]+0.717)*(list1[i]+0.715)+lagarang[2]*(list1[i]+0.725)*(list1[i]+0.723)*(list1[i]+0.719)*(list1[i]+0.717)*(list1[i]+0.715)+lagarang[3]*(list1[i]+0.725)*(list1[i]+0.723)*(list1[i]+0.721)*(list1[i]+0.717)*(list1[i]+0.715)+lagarang[4]*(list1[i]+0.725)*(list1[i]+0.723)*(list1[i]+0.721)*(list1[i]+0.719)*(list1[i]+0.715)+lagarang[5]*(list1[i]+0.725)*(list1[i]+0.723)*(list1[i]+0.721)*(list1[i]+0.719)*(list1[i]+0.717))
    i += 1
    print(y_lagrang)

i = 0

def lagrange(lx, ly):
    y = 0
    for k in range(len(lx)):
        t = 1
        for j in range(len(lx)):
            if j != k:
                t *= (x - lx[j]) / (lx[k] - lx[j])
        y += t * ly[k]
    return y
while i != n:  
    print("L5(x) =", lagrange(xlst, ylst))
    i += 1 
