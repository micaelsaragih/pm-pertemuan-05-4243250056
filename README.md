# Praktikum Pertemuan 5 — Kartu Nama Digital

## Identitas Mahasiswa

| Keterangan | Nilai |
|---|---|
| Nama | Micael Zecsen Saragih |
| NIM | 4243250056 |
| Kelas | PSIK24D |
| Program Studi | Ilmu Komputer |
| Universitas | Universitas Negeri Medan |
| Email | mikael10saragih@gmail.com |
| GitHub | https://github.com/micaelsaragih |

## Deskripsi Aplikasi

Aplikasi **Kartu Nama Digital** berbasis Flutter (Material Design 3) yang menampilkan profil mahasiswa secara interaktif. Dibuat sebagai tugas Praktikum Pemrograman Mobile Pertemuan 5. Aplikasi mendukung mode terang/gelap, kontak interaktif dengan SnackBar, dan tombol Ikuti dengan state management lokal.

## Fitur Utama

1. **Foto profil** asli mahasiswa ditampilkan sebagai `CircleAvatar` menggunakan `AssetImage`.
2. **Identitas lengkap**: nama, NIM, kelas, program studi, universitas, dan bio.
3. **Chip keahlian**: Pemrograman Web.
4. **Kartu kontak** (`Card` + `ListTile`): Email, WhatsApp, Lokasi, dan GitHub — masing-masing dapat ditekan.
5. **Tombol Ikuti/Diikuti** dengan jumlah pengikut 128 ↔ 129 dan SnackBar konfirmasi.
6. **Pergantian tema** terang/gelap melalui `IconButton` di AppBar.
7. **Desain responsif**: konten dibatasi lebar maksimum, dapat digulir pada layar kecil.
8. Warna konsisten menggunakan `Theme.of(context).colorScheme` (Material 3).

## Empat Tantangan Praktikum

| No. | Tantangan | Implementasi |
|---|---|---|
| 1 | **Foto Profil** — gambar aset via `AssetImage` | `assets/images/profile_micael.png` pada `CircleAvatar.backgroundImage` |
| 2 | **Pergantian Tema** — `IconButton` AppBar mengubah `themeMode` | `KartuNamaApp` Stateful + `ColorScheme.fromSeed` + `ThemeMode` |
| 3 | **Kontak Interaktif** — `onTap` tiap `ListTile` | SnackBar bertuliskan `<label>: Disalin (simulasi)` tanpa akses clipboard nyata |
| 4 | **Widget Terpisah** — `TombolIkuti` di file sendiri | `lib/widgets/tombol_ikuti.dart` — `StatefulWidget` dengan `bool _diikuti` dan `int _pengikut` |

## StatelessWidget vs StatefulWidget

| Widget | Jenis | Alasan |
|---|---|---|
| `KartuNamaApp` | `StatefulWidget` | Menyimpan `ThemeMode _tema` yang berubah saat pengguna menekan tombol tema. |
| `HalamanProfil` | `StatelessWidget` | Data profil tidak berubah selama sesi; semua informasi diteruskan dari parent atau bersifat konstan. |
| `TombolIkuti` | `StatefulWidget` | Menyimpan `bool _diikuti` dan `int _pengikut` yang berubah tiap kali pengguna menekan tombol. |

**Hot reload** mempertahankan objek `State` yang masih terhubung ke element tree, sehingga jumlah pengikut tidak bereset. **Hot restart** menginisialisasi ulang seluruh aplikasi dan mengembalikan nilai awal 128.

## Cara Menjalankan Aplikasi

```powershell
# Clone repository
git clone https://github.com/micaelsaragih/pm-pertemuan-05-4243250056.git
cd pm-pertemuan-05-4243250056

# Install dependensi
flutter pub get

# Jalankan di browser (Chrome)
flutter run -d chrome

# Atau jalankan di emulator/perangkat Android
flutter devices
flutter run
```

## Struktur Project

```text
pm-pertemuan-05-4243250056/
├── assets/
│   └── images/
│       ├── profile_micael.png        # Foto profil Micael (Tantangan 1)
│       └── profile_placeholder.png  # Gambar fallback
├── lib/
│   ├── main.dart                     # KartuNamaApp, HalamanProfil
│   └── widgets/
│       └── tombol_ikuti.dart         # TombolIkuti — widget terpisah (Tantangan 4)
├── test/
│   └── widget_test.dart              # 3 widget test
├── docs/                             # Folder screenshot praktikum
├── pubspec.yaml
└── README.md
```

## Widget Tree

```text
KartuNamaApp (Stateful: ThemeMode)
└── MaterialApp
    └── HalamanProfil (Stateless)
        └── Scaffold
            ├── AppBar → IconButton tema (Tantangan 2)
            └── SafeArea → Center → SingleChildScrollView
                └── Column
                    ├── CircleAvatar (AssetImage) (Tantangan 1)
                    ├── Text nama
                    ├── Text NIM · Kelas · Prodi
                    ├── Text Universitas
                    ├── Text bio
                    ├── Wrap → Chip (Pemrograman Web)
                    ├── Card → ListTile × 4 (onTap SnackBar) (Tantangan 3)
                    └── TombolIkuti (Stateful) (Tantangan 4)
```

## Perintah Pengujian

```powershell
dart format .
flutter analyze
flutter test
```

Target: `No issues found!` dan `All tests passed!` (3 widget test).

## Screenshot Praktikum

Screenshot disimpan di folder `docs/` setelah praktikum dijalankan:

1. `docs/01-profil-terang.png` — kartu profil mode terang.
2. `docs/02-tema-gelap.png` — mode gelap setelah menekan `IconButton`.
3. `docs/03-ikuti-dan-snackbar.png` — jumlah pengikut 129, tombol Diikuti, atau SnackBar kontak.
4. `docs/04-widget-inspector.png` — jalur widget dari `Scaffold` ke `ListTile`.
5. `docs/05-analyze-test.png` — output `flutter analyze` dan `flutter test` berhasil.

> Tautan gambar akan ditambahkan setelah file screenshot tersedia.

## Pernyataan Penggunaan AI

Kiro AI digunakan untuk membantu penyusunan kode, struktur aplikasi, dan dokumentasi README. Mahasiswa tetap bertanggung jawab menjalankan aplikasi, memahami setiap implementasi, mengambil screenshot praktik yang benar, dan memastikan kesesuaiannya dengan modul praktikum.
