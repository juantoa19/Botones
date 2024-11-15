import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:botones/main.dart'; // Importa main.dart ya que ese es tu archivo principal

void main() {
  testWidgets('Test MainScreen widget', (WidgetTester tester) async {
    // Construir la pantalla y activar el marco
    await tester.pumpWidget(MaterialApp(home: MainScreen()));

    // Verificar si el selector de tiempo muestra el texto correcto
    expect(find.text('Day'), findsOneWidget);
    expect(find.text('Week'), findsOneWidget);
    expect(find.text('Month'), findsOneWidget);
    expect(find.text('Year'), findsOneWidget);

    // Verificar si el slider tiene el valor inicial correcto
    expect(find.text('Valor: 50.00'), findsOneWidget);

    // Verificar si los iconos en la fila de botones funcionan
    await tester.tap(find.byIcon(Icons.home));
    await tester.pump(); // Necesario para que el estado se actualice

    // Verificar si el valor ha cambiado o se realizó la acción esperada
    // Agrega más verificaciones según lo que quieras probar
  });
}
