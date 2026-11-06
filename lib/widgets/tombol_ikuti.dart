import 'package:material_ui/material_ui.dart';

/// State lokal ini tidak menyebabkan seluruh halaman profil menjadi Stateful.
class TombolIkuti extends StatefulWidget {
  const TombolIkuti({super.key});

  @override
  State<TombolIkuti> createState() => _TombolIkutiState();
}

class _TombolIkutiState extends State<TombolIkuti> {
  bool _diikuti = false;
  int _pengikut = 128;

  void _ubah() {
    setState(() {
      _diikuti = !_diikuti;
      _pengikut += _diikuti ? 1 : -1;
    });
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(_diikuti ? 'Anda mengikuti Micael' : 'Batal mengikuti'),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$_pengikut pengikut'),
        const SizedBox(height: 10),
        if (_diikuti)
          OutlinedButton.icon(
            onPressed: _ubah,
            icon: const Icon(Icons.check),
            label: const Text('Diikuti'),
          )
        else
          FilledButton.icon(
            onPressed: _ubah,
            icon: const Icon(Icons.person_add),
            label: const Text('Ikuti'),
          ),
      ],
    );
  }
}
