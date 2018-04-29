---
layout: post
title: Menyimpan Data yang Didefinisikan Byte pada Register 32 byte
author: Nizar Akbar Meilani
---

Hari ini saya akan membahas tentang permasalahan menyimpan data yang dedefiniskan sebagai byte pada register 32 byte contohnya pada bahasa assembly.

`a db 0x55`

Apabila data tersebut disimpan pada register 32 byte seperti salah satunya eax maka akan mengalami permasalahan alignment apabila masih ada definisi data setelah data dengan nama a tersebut. Misal:

```assembly
a db 0x55
b db 0x55
```
![mov db to eax](https://raw.githubusercontent.com/nizarakbarm/nizarakbarm.github.io/master/images/assembly_1.png "mov db to eax")

Maka data yang disimpan pada eax biasanya akan menjadi 0x5555 karena mengambil data 0x55 untuk memenuhi ukuran dari register eax tersebut. Untuk mengatasi hal ini, kita perlu menambahkan 3 byte data padding di belakang 0x55 sehingga pendefinisiannya menjadi
```assembly
a db 0x55,0x00,0x00,0x00
b db 0x55,0x00,0x00,0x00
```
![mov db to eax (benar)](https://raw.githubusercontent.com/nizarakbarm/nizarakbarm.github.io/master/images/assembly_2.png "mov db to eax")

Kode assembly yang digunakan adalah sebagai berikut:
* Pendefinisian byte yang dipindahkan ke register 32 bit yang salah: [salah](https://raw.githubusercontent.com/nizarakbarm/nizarakbarm.github.io/master/files/arit.asm)
* Pendifinisian byte yang dipindahkan ke register 32 bit yang benar: [benar](https://raw.githubusercontent.com/nizarakbarm/nizarakbarm.github.io/master/files/arit2.asm)




