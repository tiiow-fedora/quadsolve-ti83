import emu, os, sys, mk8xp
sys.stdout.reconfigure(encoding='utf-8')
P1=["1"+"2E5E8E17G","2"+"5E-2E0E1G","3"+"1E2EEEE15G","3"+"0E13EE1EE-30G","3"+"3E14E-5G","4"+"1E0E-64G","4"+"3E0E5G","5"+"1E-6E16G","6"+"3E-4E7G","6"+"1E1E-1G","6"+"1E-2E-5G","7"+"3E-1E-14G","7"+"1E1E1G","7"+"2E4E-6G"]
P2=["11"+"2E-8E8G","12"+"1E4E13G","11"+"-3E-5E9G","11"+"1E-4E1E3G","21"+"1E4E5/2G","21"+"1E1E-9G","31"+"5E-2E-7E3G","34"+"6E0E3E-1G","34"+"2E-1E5E3G","36"+"-72G","37"+"-64G","4"+"3E-4E7G","4"+"-2E1E-12G","5"+"-4E1G","5"+"1E2G","6"+"-16E64E80G","6"+"-5E3E2G","32"+"27G"]
tot=bad=0
for n,hexe,S in (('alg1','host1',P1),('alg2','host2',P2)):
    os.environ['NAME']=n; os.environ['HOSTEXE']=hexe
    emu._stub=None
    code,_=mk8xp.image(n+'.ihx'); open(n+'.bin','wb').write(code)
    for k in S:
        tot+=1
        try: z=emu.run_z80(k)
        except Exception as e: z=['EXC '+str(e)]
        h=emu.run_host(k)
        if z!=h: bad+=1; print("MISMATCH",n,k,z,h)
        elif len(sys.argv)>1: print(n,k,[l for l in z if l][:4])
print(tot,"scenarios",bad,"mismatches")
