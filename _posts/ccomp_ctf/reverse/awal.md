---
layout: post
title: Write-up Reverse Engineering Awal CCOMP CTF UGM 2018(Eliminasi)
author: Nizar Akbar Meilani
---

Pada soal ini ada dua operasi diminta masukan dari flag dan apabila benar akan dicetak keluaran flag tersebut. Untuk mengerjakan soal ini dapat dilakukan hanya dengan menggunakan ltrace untuk melacak pemanggilan library pada programnya.

Petunjuk lebih detail tentang ltrace dapat dilihat pada:

* man ltrace
* [Ltrace online manual](http://man7.org/linux/man-pages/man1/ltrace.1.html)

Dengan menjalankan programnya menggunakan perintah `ltrace ./awal`, kita dapat menganalisis proses pemanggilan librarynya.

![awal screenshoot]({{ site.baseurl }}/images/awal.png "Screenshoot Awal")

Dapat dilihat pada gambar di atas, ada operasi pemanggilan fgets untuk meminta masukan dan masukan itu dicocokkan dengan teks "Opening_bukan_Ending"(flagnya) dengan menggunakan fungsi strcmp.

`Flag: CCOMP{Opening_bukan_Ending}`

