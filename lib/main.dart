import 'package:material_ui/material_ui.dart';

import 'widgets/tombol_ikuti.dart';

void main() => runApp(const KartuNamaApp());

/// Tema berada di root agar seluruh halaman menanggapi perubahan themeMode.
class KartuNamaApp extends StatefulWidget {
  const KartuNamaApp({super.key});

  @override
  State<KartuNamaApp> createState() => _KartuNamaAppState();
}

class _KartuNamaAppState extends State<KartuNamaApp> {
  ThemeMode _tema = ThemeMode.system;

  void _gantiTema() {
    setState(() {
      _tema = _tema == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    const seed = Color(0xFF275DAB);
    return MaterialApp(
      title: 'Kartu Nama Digital Micael',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: seed)),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: seed,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: _tema,
      home: HalamanProfil(onUbahTema: _gantiTema),
    );
  }
}

/// Data profil dan susunan kartu tidak berubah; tombol Ikuti menangani
/// state-nya sendiri pada widget terpisah.
class HalamanProfil extends StatelessWidget {
  const HalamanProfil({required this.onUbahTema, super.key});

  final VoidCallback onUbahTema;

  void _tampilkanDisalin(BuildContext context, String label) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$label: Disalin (simulasi)')));
  }

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kartu Nama Digital'),
        actions: [
          IconButton(
            tooltip: 'Ganti tema',
            onPressed: onUbahTema,
            icon: const Icon(Icons.brightness_6_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ── Foto Profil ──────────────────────────────────────────
                  Center(
                    child: CircleAvatar(
                      radius: 58,
                      backgroundColor: warna.primaryContainer,
                      backgroundImage: const AssetImage(
                        'assets/images/profile_micael.png',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // ── Nama ─────────────────────────────────────────────────
                  Text(
                    'Micael Zecsen Saragih',
                    textAlign: TextAlign.center,
                    style: teks.headlineSmall,
                  ),
                  const SizedBox(height: 6),

                  // ── Identitas akademik ────────────────────────────────────
                  Text(
                    '4243250056 · PSIK24D · Ilmu Komputer',
                    textAlign: TextAlign.center,
                    style: teks.bodyMedium?.copyWith(
                      color: warna.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Universitas Negeri Medan',
                    textAlign: TextAlign.center,
                    style: teks.bodyMedium?.copyWith(
                      color: warna.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // ── Bio ───────────────────────────────────────────────────
                  Text(
                    'Challenging the lazy days. Building the empire.',
                    textAlign: TextAlign.center,
                    style: teks.bodySmall?.copyWith(
                      color: warna.onSurfaceVariant,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // ── Keahlian ──────────────────────────────────────────────
                  const Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      runSpacing: 8,
                      children: [Chip(label: Text('Pemrograman Web'))],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // ── Kontak ────────────────────────────────────────────────
                  Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.email_outlined),
                          title: const Text('Email'),
                          subtitle: const Text('mikael10saragih@gmail.com'),
                          trailing: const Icon(Icons.copy_outlined),
                          onTap: () => _tampilkanDisalin(context, 'Email'),
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: const Icon(Icons.phone_outlined),
                          title: const Text('WhatsApp'),
                          subtitle: const Text('0822-8587-5979'),
                          trailing: const Icon(Icons.copy_outlined),
                          onTap: () => _tampilkanDisalin(context, 'WhatsApp'),
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: const Icon(Icons.location_on_outlined),
                          title: const Text('Lokasi'),
                          subtitle: const Text('Jalan Selamat Ketaren No. 123'),
                          trailing: const Icon(Icons.copy_outlined),
                          onTap: () => _tampilkanDisalin(context, 'Lokasi'),
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: const Icon(Icons.code_outlined),
                          title: const Text('GitHub'),
                          subtitle: const Text('github.com/micaelsaragih'),
                          trailing: const Icon(Icons.copy_outlined),
                          onTap: () => _tampilkanDisalin(context, 'GitHub'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ── Tombol Ikuti (widget terpisah — Tantangan 4) ──────────
                  const TombolIkuti(),
                  const SizedBox(height: 16),

                  Text(
                    'Praktikum Pemrograman Mobile · Pertemuan 5',
                    textAlign: TextAlign.center,
                    style: teks.labelSmall?.copyWith(
                      color: warna.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
