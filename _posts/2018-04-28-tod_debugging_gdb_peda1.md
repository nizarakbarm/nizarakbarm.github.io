---
layout: posts
title: Trick of The Day Debugging dengan GDB peda(Reference & Pointer)
author: Nizar Akbar Meilani
---
Hai, setelah membahas tentang memory mapping pada postingan saya sebelumnya, saya akan membahas tentang salah satu trik debugging dengan gdbpeda, yaitu tentang penggunaan reference(&) dan pointer(*).

![trick of the day 1](https://raw.githubusercontent.com/nizarakbarm/nizarakbarm.github.io/master/images/trick-of-the-day1.jpg "Reference & Pointer")

Seperti yang kita ketahui pada penggunaan reference(&) dan pointer(*) pada bahasa pemrograman C. Reference(&) digunakan untuk mereferensikan pada alamat darisuatu variabel sedangkan pointer(*) digunakan untuk meminta nilai dari variabel yang ditunjukkan oleh reference(&).

Dengan menggunakan reference kita dapat mencetak alamat dari suatu variabel di gdp-peda (misal variabel a), yaitu menggunakan `p/x &(a)` atau `p/a &(a)`. Kita juga dapat melihat alamat atau nilai dari alamat dengan jarak beberapa byte address dari alamat variabel a yaitu dengan menggunakan `p/a &a-n`(alamat) dan `p/a *(&a-n)`(nilai).
* keterangan: n adalah nilai byte untuk menggeser alamat

Kita dapat juga menentukan breakpoint pada penulisan definisi dari variabel dengan `break *(&a-n)`.
* keterangan: untuk breakpoint pada variabel a maka tidak usah menggunakan n atau isi n dengan 0