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
                  Center(
                    child: CircleAvatar(
                      radius: 58,
                      backgroundColor: warna.primaryContainer,
                      backgroundImage: const AssetImage(
                        'assets/images/profile_placeholder.png',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Micael Zecsen Saragih',
                    textAlign: TextAlign.center,
                    style: teks.headlineSmall,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '4243250056 · PSIK24D · Ilmu Komputer UNIMED',
                    textAlign: TextAlign.center,
                    style: teks.bodyMedium?.copyWith(
                      color: warna.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        Chip(label: Text('Flutter')),
                        Chip(label: Text('Dart')),
                        Chip(label: Text('Mobile Development')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.email_outlined),
                          title: const Text('Email'),
                          subtitle: const Text('Belum ditambahkan'),
                          trailing: const Icon(Icons.copy_outlined),
                          onTap: () => _tampilkanDisalin(context, 'Email'),
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: const Icon(Icons.phone_outlined),
                          title: const Text('Telepon'),
                          subtitle: const Text('Belum ditambahkan'),
                          trailing: const Icon(Icons.copy_outlined),
                          onTap: () => _tampilkanDisalin(context, 'Telepon'),
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: const Icon(Icons.location_on_outlined),
                          title: const Text('Lokasi'),
                          subtitle: const Text('Medan, Sumatera Utara'),
                          trailing: const Icon(Icons.copy_outlined),
                          onTap: () => _tampilkanDisalin(context, 'Lokasi'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
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
