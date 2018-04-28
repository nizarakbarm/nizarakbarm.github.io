---
layout: post
title: Assembly Language Memory Mapping Linux
author: Nizar Akbar Meilani
---
Pada kali ini, saya akan membahas tentang pemetaan memori logika dari bahasa assembly pada linux. Tetapi sebelumnya perlu diketaui bahwa pemetaan memori di sini juga berlaku bagi semua program pada linux(terutama yang dicompile menjadi executable).
[Memory Mapping](https://raw.githubusercontent.com/nizarakbarm/nizarakbarm.github.io/master/images/AssemblyLanguage.jpg "Mindmap memory mapping")

Seperti yang diketahui, bahasa assembly merupakan bahasa untuk menyimbolkan bahasa mesin sehingga lebih mudah dipahami dan tidak perlu mengetahui instruksi yang tersusun atas binary (0 dan 1). Bahasa assembly digunakan oleh programmer untk membuat program executable(khususnya pada masa sebelum bahasa pemrograman C belum umum dan di masa-masa adanya bahasa pemrograman C). Program dieksekusi pada komputer menggunakan beberapa instruksi, variabel dan nilai dari variabel. Program dijalankan tentunya menggunakan memori baik itu memori fisik atau memori logika. Jika menggunakan memori tentunya harus ada pemetaan masing-masing memori agar tidak ada masalah pada masing-masing program yang dijalankan. Kali ini saya akan menyampaikan tentang pemetaan memori logika pada linux(dengan pembahasan berhubungan dengan bahasa assembly).

Memori merupakan kumpulan array dari bytes. Masing-masing byte dari memori memiliki alamat. Pemetaan memori pada register dari CPU dilakukan oleh Hardware mapping sehingga proses dapat memiliki alamat logika yang sama tetapi dengan alamat fisik yang berbeda(pada CPU x86-64). Pemetaan tersebut juga memberikan memory protection yaitu:
* Pembatasan writing dan reading hanya untuk pages miliknya sendiri
* Masing-masing proses dilindungi dari user process
* User tidak dapat membaca data dari user lain
* software tidak dapat mengakses data lebih dari akhir dari array bytes memori. Apabila dilakukan akan menyebabkan CPU mereferensikan ke entri tabel yang bukan milik prosesnya sehingga terjadi Segmentation Fault.

Memori juga memiliki model yang digunakan untuk memetakan proses. Model dari memori(48 bit alamat logika) dibagi menjadi 4 section, yaitu:
* Stack section: dipetakan pada alamat tertinggi(0x7fffffffffff) atau 131 TB. Section ini hanya dibatasi hingga 16 Megabytes. Section ini akan otomatis tumbuh ketika dibutuhkan oleh sistem operasi ketika merespon page fault. Selain itu apabila programmer menghindari menaruh array dalam jumlah banyak, maka stack dapat mennjaga track dari beberapa function call, parameter, local variable, dan return address(Kasus dari Buffer Overflow).
* Heap section: bukan benar-benar merupakan heap seperti pada struktur data tetapi merupakan bagian dari memori yang berubah secara dinamik untuk mengalokasikan proses melalui penggunaaan malloc dan new pada bahasa pemrograman C++.
* data section: merupakan section yang berisi segmen .data dan .bss. Dimulai dari segmen .data yang berisi inisialisasi data, dilanjutkan dengan segmen .bss yang berisi data yang dialokasikan secara statis pada proses(dan tidak disimpan pada file executable). Konten awal dari segmen .bss dimulai dari bit-bit 0.
* text section merupakan section yang berisi prosedur _start(digunakan untuk memanggil prosedur main) berada pada alamat tertinggi dari section ini. Alamat terkecilnya dimulai dari 0 dan tidak perlu untuk bertambah karena tidak dibutuhkan untuk tumbuh. (Section ini digunakan untuk menyimpan instruksi-instruksi program)



