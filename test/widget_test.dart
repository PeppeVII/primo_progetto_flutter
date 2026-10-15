import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:primo_progetto_flutter/main.dart';

void main() {
  // Dimensioni logiche di iPhone 15 e iPhone SE.
  for (final size in const [Size(393, 852), Size(375, 667)]) {
    testWidgets('Mostra nome, matricola ed email su schermo $size',
        (WidgetTester tester) async {
      tester.view.physicalSize = size * 3;
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(const MyApp());

      expect(find.text(nomeCognome), findsOneWidget);
      expect(find.text(matricola), findsOneWidget);
      expect(find.text(emailUniversitaria), findsOneWidget);
    });
  }
}
