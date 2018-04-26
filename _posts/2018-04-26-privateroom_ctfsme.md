---
layout: post
title: Write-up CTFS.ME Private Room
author: Nizar Akbar Meilani
---
Pada soal Private Room ini, kita disuruh me-inverse logika dari program yang diperlihatkan pada screenshoot di bawah ini:
![privateroom screenshoot](https://raw.githubusercontent.com/nizarakbarm/nizarakbarm.github.io/master/images/privateroom.png "Screenshoot Private Room")

Dapat dilihat bahwa pada soal tersebut disuruh me-inverse logika pada program tersebut yang agar dapat memperoleh nilai char inputan yang sama dengan list flag yang telah didefinisikan. Cara me-inverse logika tersebut mudah untuk logika or,xor, dan and, yaitu dengan cara meng-andkan, meng-xorkan, dan meng-orkan tetapi untuk operator shift cara membalikkannya sedikit sulit sehingga membutuhkan bantuan suatu library pada python untuk pengerjannya.

Library yang saya gunakan di sini adalah Z3 pada python. Z3 merupakan library python untuk solver dari suatu operasi dengan beberapa konstrain.
```python
from z3 import *
flag=[233,129,9,5,130,194,195,39,75,229]
f=[BitVec(i,8) for i in xrange(len(flag))]
str_1=["" for i in xrange(len(flag))]
s=Solver()
for i in range(len(flag)):
    s.add((((f[i]<<5)|(f[i]>>3))^111)&255==flag[i])
    s.add(f[i]<=ord('z'))
if s.check()==sat:
    m=s.model()
    for i in range(len(flag)):
        str_1[i]=chr(m[f[i]].as_long())
    print 'CTFS{'+''.join(str_1)+'}'
```

Kode python di atas berguna untuk mencari solusi suatu karakter inputan yang nilainya sesuai dengan list flag yang ada di program python pada soal.

Sebelum kita mengerjakan soal Private Room dengan kode python tersebut, kita harus terlebih dahulu mendefinisikan flag dalam angka ascii yang didefinisikan di program Private Room. Dan kita juga harus mendefinisikan f yang sama besarnya dengan list flag(variabel f). Saya menggunakan BitVec sebesar 8 bit karena untuk operasi shift dan xor membutuhkan nilai angka dalam bit vector sedangkan untuk batasan 8 bit karena nilai maksimal dari angka ascii di soal adalah 255. Setelah itu kita mendefinisikan objek Solver bernama s yang akan ditambahkan dengan konstrain yang ada pada soal dan tentunya nilainya harus lebih kecil dari angka ascii-nya 'z' agar python dapat mengkonversikannya menjadi string. Pada proses akhir di program setelah mengetahui apabila solvernya bisa dipenuhi konstrainnya maka kita tinggal mencetak masing-masing nilai dari model ke dalam karakter.

Untuk detail tutorial tentang Z3 ada pada link website ini ![Z3-Guide](https://rise4fun.com/z3/tutorial)

`Flag: CTFS{4w3SomeB!T}`

