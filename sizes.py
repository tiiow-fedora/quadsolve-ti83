import re,sys
n=sys.argv[1]
syms=[]
for l in open(n+'.sym'):
    m=re.search(r'(\S+)\s+([0-9A-F]{6})\s+R\s+',l)
    if m and (m.group(1).startswith('_') or m.group(1).startswith('___str')): syms.append((int(m.group(2),16),m.group(1)))
syms=sorted(set(syms)); data=code=0
for i,(a,nm) in enumerate(syms[:-1]):
    sz=syms[i+1][0]-a
    if nm.startswith(('___str','_font','_T','_lbl_','_def_','_d_','_items','_idx','_fb','_have','_R')) : data+=sz
    else: code+=sz
print(n,"code",code,"data",data,"=> code+HOME",code+500, "(limit ~8750)")
