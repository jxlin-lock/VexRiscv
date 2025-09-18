def fmt_bin(bstr):
    bstr = bstr[2:]
    bstr = '00000000' + bstr
    bstr = bstr[-8:]
    return bstr

with open('./build/cxl_flash.bin', 'rb') as f:
    bs = f.read()
    count = 0
    for c in bs:
        bstr = bin(int(c))
        
        print(fmt_bin(bstr))
        count += 1

    while count < 2048:
        print('00000000')
        count += 1

