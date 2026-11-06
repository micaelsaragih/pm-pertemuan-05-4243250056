# Praktikum Pertemuan 5 — Kartu Nama Digital

## Identitas

| Keterangan | Nilai |
|---|---|
| Nama | Micael Zecsen Saragih |
| NIM | 4243250056 |
| Kelas | PSIK24D |
| Universitas | Universitas Negeri Medan |
| Mata kuliah | Pemrograman Mobile |

## Sumber dan tujuan

Modul Pertemuan 5 bagian B–C (Kartu Nama Digital) dan slide Pertemuan 5: arsitektur Flutter, Material 3, StatelessWidget/StatefulWidget, dan widget test. Aplikasi menggunakan `material_ui` sesuai modul Flutter 3.47+.

## Fitur

1. Profil Micael, keahlian (`Chip`), kartu kontak (`Card` + 3 `ListTile`), dan avatar gambar placeholder.
2. Tombol Ikuti/Diikuti (`FilledButton`/`OutlinedButton`) mengubah jumlah pengikut 128 ↔ 129 dengan `setState` dan SnackBar.
3. `IconButton` AppBar mengubah tema terang/gelap dengan `themeMode`, `theme` dan `darkTheme`.
4. Kontak dapat ditekan untuk menampilkan SnackBar **Disalin (simulasi)**. Sesuai tantangan modul, tidak mengakses clipboard sungguhan.
5. `TombolIkuti` dipisahkan ke `lib/widgets/tombol_ikuti.dart`.
6. Tampilan dapat digulir pada layar kecil; lebar konten dibatasi agar rapi pada desktop/web.

## Empat tantangan modul

| No. | Instruksi | Implementasi |
|---|---|---|
| 1 | Avatar menggunakan gambar aset | `assets/images/profile_placeholder.png` pada `CircleAvatar.backgroundImage` |
| 2 | Ganti tema dari AppBar | `KartuNamaApp` Stateful + `themeMode` + `IconButton` |
| 3 | ListTile kontak dapat ditekan | `onTap` menampilkan SnackBar tanpa menyalin asli |
| 4 | Pisahkan TombolIkuti | `lib/widgets/tombol_ikuti.dart` |

## Persiapan proyek Flutter

Paket ini berisi **source project Flutter lengkap untuk praktikum** (`lib`, `assets`, `test`, konfigurasi, README), tetapi folder native platform (`android`, `ios`, `web`, dll.) perlu digenerasikan satu kali dengan Flutter SDK pada laptop. Jalankan perintah dari folder root project:

```powershell
flutter create --org id.ac.unimed --project-name pm_pertemuan_05_4243250056 .
flutter pub get
flutter devices
flutter run
```

Jika telah clone repo dan menjalankan `flutter create .`, periksa `git status` dan commit file platform yang dibuat jika diperlukan untuk pengumpulan. Jangan menimpa kode yang sudah ada secara manual.

### Mengganti placeholder foto

Ganti file `assets/images/profile_placeholder.png` dengan foto sendiri berformat PNG dan **nama file sama**. Ukuran persegi disarankan, misalnya 320×320 piksel. Aset sudah terdaftar di `pubspec.yaml`, sehingga tidak perlu mengubah kode. Jalankan hot restart jika gambar belum berubah.

Email dan nomor telepon sengaja menggunakan **Belum ditambahkan** agar tidak mencantumkan data pribadi rekaan. Ubah bagian `ListTile` di `lib/main.dart` bila pemilik menghendaki.

## Pengujian

```powershell
dart format .
flutter analyze
flutter test
```

Widget test memeriksa label dan angka pengikut, pembatalan mengikuti, SnackBar kontak, serta respons tombol tema. Pengujian harus benar-benar dijalankan di perangkat pengembangan sebelum pengumpulan; keberadaan skrip bukan bukti bahwa tes sudah lulus.

## Lembar Kerja Praktikum

| Pemeriksaan | Cara verifikasi |
|---|---|
| Perangkat terdeteksi | `flutter devices` menunjukkan HP/emulator/web |
| Aplikasi menggunakan material_ui | Lihat `pubspec.yaml` dan `lib/main.dart` |
| Data diri sendiri | Nama, NIM, program studi terlihat di layar |
| Hot reload | Jalankan aplikasi, ubah teks/seed color, tekan `r` |
| Hot restart | Tekan `R` pada terminal `flutter run`; bandingkan state |
| Widget Inspector | Telusuri `Scaffold → SingleChildScrollView → Column → Card → ListTile` |
| Tema gelap | Tekan ikon tema di AppBar (atau ubah tema sistem) |
| Tes | `flutter analyze` dan `flutter test` |
| Tantangan | Keempat fitur pada tabel di atas |

## Widget Tree Sederhana

```text
KartuNamaApp (Stateful: ThemeMode)
└── MaterialApp
    └── HalamanProfil (Stateless)
        └── Scaffold
            ├── AppBar → IconButton tema
            └── SafeArea → Center → SingleChildScrollView
                └── Column
                    ├── CircleAvatar (AssetImage)
                    ├── Text nama/identitas
                    ├── Wrap → Chip × 3
                    ├── Card → ListTile × 3
                    └── TombolIkuti (Stateful: bool, jumlah)
```

## Bukti screenshot

Simpan screenshot **asli hasil praktik** dalam folder `docs`:

1. `docs/01-profil-terang.png` — kartu profil mode terang.
2. `docs/02-tema-gelap.png` — mode gelap setelah menekan IconButton.
3. `docs/03-ikuti-dan-snackbar.png` — jumlah pengikut 129, tombol Diikuti, atau SnackBar kontak.
4. `docs/04-widget-inspector.png` — jalur widget dari Scaffold ke ListTile.
5. `docs/05-analyze-test.png` — `flutter analyze` dan `flutter test` berhasil.

Tautan gambar akan ditambahkan ke README **setelah file screenshot benar-benar tersedia**, agar tidak muncul gambar rusak di GitHub.

## Refleksi

1. `HalamanProfil` bersifat Stateless karena data profil tidak berubah selama interaksi; `TombolIkuti` Stateful karena angka dan label berubah melalui `setState`.
2. Hot reload umumnya mempertahankan objek State yang masih terhubung ke element tree; hot restart membuat aplikasi mulai dari awal dan mengembalikan jumlah awal 128.
3. `SingleChildScrollView` dan `Wrap` berguna untuk tata letak yang tetap baik pada layar kecil, sedangkan Widget Inspector membantu menemukan widget bermasalah.

## Penggunaan AI

ChatGPT digunakan untuk membantu penyusunan kode, aset placeholder, dokumentasi, dan rancangan pengujian. Mahasiswa tetap bertanggung jawab menjalankan aplikasi, memahami implementasi, mengambil screenshot praktik yang benar, dan memastikan kesesuaiannya dengan modul.
