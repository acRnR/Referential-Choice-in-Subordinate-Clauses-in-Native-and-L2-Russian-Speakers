
arr = []
stimuli = [['когда','pr','sm'],['если', 'np', 'ms'],['хотя', 'pr', 'sm'],['из-за того что', 'np', 'ms'],['когда', 'pr', 'ms'],['хотя', 'pr', 'ms'],['когда', 'np','ms'],['если', 'pr', 'sm'],['из-за того что', 'pr', 'sm'],['хотя', 'np', 'ms'],['если', 'pr', 'ms'],['из-за того что', 'pr', 'ms']]

f = open('nativegaps.txt', 'r', encoding='UTF-8')
newf = open('nativegready.txt', 'w', encoding='UTF-8')
newf.write('Age,Gender,Education,Conjunction,RefDevice,ClOrder,Choice')
lol = 1
for line in f:
    if 'Хотя' not in line:
        for x in range(3, 15):
            newf.write('\n' + line.split(',')[0] + ',' + line.split(',')[1] + ',' + line.split(',')[2] \
                       + ',' + stimuli[x-3][0] + ',' + stimuli[x-3][1] + ',' + stimuli[x-3][2] \
                       + ',' + line.split(',')[x])
            print(lol)
            lol += 1
    #arr.append(line.split(sep=','))
f.close()
newf.close()


