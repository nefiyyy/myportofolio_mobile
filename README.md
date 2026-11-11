## Tugas 7

1. Widget Tree adalah struktur hierarki yang menggambarkan susunan widget dalam aplikasi Flutter. Parent merupakan widget induk yang membungkus widget lain, sedangkan child merupakan widget yang berada di dalamnya. Hubungan ini membuat tampilan aplikasi tersusun secara teratur.

2. Widget yang digunakan dalam proyek ini perlu disesuaikan dengan kode program yang dibuat. Setiap widget memiliki fungsi berbeda, misalnya MaterialApp untuk konfigurasi aplikasi, Scaffold untuk struktur halaman, AppBar untuk bagian atas aplikasi, dan Text untuk menampilkan tulisan.

3. MaterialApp berfungsi mengatur konfigurasi utama aplikasi, seperti tema, navigasi, dan halaman utama. Widget ini digunakan sebagai root widget karena menjadi dasar bagi widget lainnya agar dapat menggunakan komponen Material Design.

4. StatelessWidget adalah widget yang tidak memiliki state internal yang berubah, sedangkan StatefulWidget memiliki state yang dapat berubah. StatelessWidget cocok untuk tampilan statis, sementara StatefulWidget digunakan untuk tampilan yang membutuhkan interaksi atau perubahan data.

5. BuildContext adalah objek yang menunjukkan posisi suatu widget dalam Widget Tree. BuildContext penting karena digunakan untuk mengakses informasi seperti tema, ukuran layar, dan navigasi. Penggunaannya terdapat pada parameter metode build, yaitu build.

6. Hot Reload adalah fitur untuk menerapkan perubahan kode tanpa mengulang aplikasi dari awal dan tetap mempertahankan state. Hot Restart menjalankan ulang aplikasi dari awal sehingga state direset. Hot Restart diperlukan ketika perubahan membutuhkan inisialisasi ulang, sedangkan Full Restart diperlukan jika terdapat perubahan pada kode native Android atau iOS.