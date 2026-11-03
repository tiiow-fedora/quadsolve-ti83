import emu, sys, subprocess
sys.stdout.reconfigure(encoding='utf-8')
MENU = {1:'1',2:'2',3:'3',4:'4',5:'5',6:'6',7:'7',8:'8',9:'9',10:'uuuuE',11:'uuuE',12:'uuE',13:'uE'}
def k(item, rest, sub=''):
    return MENU[item] + sub + rest
S = [
 k(1,"2E5E8E17G"), k(2,"5E-2E0E1G"), k(2,"0E0E1E3G"), k(3,"1E2EEEE15G"), k(3,"0E13EE1EE-30G"), k(3,"3E14E-5G"),
 k(3,"1EEEEE-1G"), k(3,"2E4E-6G"), k(4,"1E0E-64G"), k(4,"4E0E16G"), k(4,"3E0E5G"), k(4,"2E3E-9G"), k(5,"1E-6E16G"), k(5,"2E-8E8G"),
 k(6,"3E14E-5G"), k(6,"3E-4E7G"), k(6,"1E1E-1G"), k(6,"2E4E2G"), k(6,"1E0E-72G"), k(6,"1/2E3E4G"), k(6,"1E-2E-5G"),
 k(7,"2E-8E8G",'1'), k(7,"1E4E13G",'2'), k(7,"1E1E-9G",'2'), k(7,"-3E-5E9G",'1'), k(7,"1E-4E1E3E-2G",'1'), k(7,"1E-4E1E3G",'1'),
 k(8,"1E3E-28G"), k(8,"3E-1E-14G"), k(8,"1E1E1G"), k(8,"2E4E-6G"),
 k(9,"1E4E5/2G",'3'), k(9,"1E1E-9G",'2'), k(9,"1E-3E2G",'1'), k(9,"1E0E1G",'1'), k(9,"2E-8E8G",'1'),
 k(10,"5E-2E-7E3G",'1'), k(10,"5E-2E-7E3G",'2'), k(10,"-2E5E-2E-5G",'3'), k(10,"6E0E3E-1G",'4'), k(10,"2E-1E5E3G",'4'),
 k(10,"7E-2G",'5'), k(10,"27G",'6'), k(10,"-64G",'7'), k(10,"-72G",'7'), k(10,"20G",'7'), k(10,"1E1E0E0G",'4'),
 k(11,"3E-4E7G"), k(11,"-2E1E-12G"), k(11,"1E2E1G"), k(11,"1E5E2G"),
 k(12,"-4E1G"), k(12,"1E2G"), k(12,"2E0G"),
 k(13,"-16E64E80G"), k(13,"-5E3E2G"), k(13,"1E2E3G"),
 k(6,"EEEG"), k(1,"1E2E1E5G"), k(3,"1E2E3E1E2E3G"), k(6,"123456E1E1G"), k(5,"0E1E1G"),
]
bad = 0
for s in S:
    try: z = emu.run_z80(s)
    except Exception as e: z = ['EXC '+str(e)]
    h = emu.run_host(s)
    if z != h:
        bad += 1
        print("MISMATCH", s); print(" z80 :", z); print(" host:", h)
print(len(S), "scenarios,", bad, "mismatches")
