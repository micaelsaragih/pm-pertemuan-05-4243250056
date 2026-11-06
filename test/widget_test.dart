import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:pm_pertemuan_05_4243250056/main.dart';

void main() {
  testWidgets('Tombol Ikuti mengubah jumlah dan label lalu dapat dibatalkan', (
    tester,
  ) async {
    await tester.pumpWidget(const KartuNamaApp());
    expect(find.text('Micael Zecsen Saragih'), findsOneWidget);
    expect(find.text('128 pengikut'), findsOneWidget);

    await tester.ensureVisible(find.text('Ikuti'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Ikuti'));
    await tester.pump();
    expect(find.text('129 pengikut'), findsOneWidget);
    expect(find.text('Diikuti'), findsOneWidget);

    await tester.tap(find.text('Diikuti'));
    await tester.pump();
    expect(find.text('128 pengikut'), findsOneWidget);
    expect(find.text('Ikuti'), findsOneWidget);
  });

  testWidgets('Kontak merespons tap dengan SnackBar simulasi', (tester) async {
    await tester.pumpWidget(const KartuNamaApp());
    await tester.ensureVisible(find.text('Email'));
    await tester.tap(find.text('Email'));
    await tester.pump();
    expect(find.text('Email: Disalin (simulasi)'), findsOneWidget);
  });

  testWidgets('Tombol tema dapat ditekan', (tester) async {
    await tester.pumpWidget(const KartuNamaApp());
    await tester.tap(find.byTooltip('Ganti tema'));
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.brightness_6_outlined), findsOneWidget);
  });
}
