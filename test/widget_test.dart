import 'package:flutter_test/flutter_test.dart';

import 'package:mi_app_flutter/main.dart';

void main() {
  testWidgets('La app inicia y muestra la pantalla de inicio',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MiApp());

    expect(find.text('¡Bienvenido!'), findsOneWidget);
    expect(find.text('Contador'), findsOneWidget);
    expect(find.text('Lista de tareas'), findsOneWidget);
    expect(find.text('Mi perfil'), findsOneWidget);
  });
}
