import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:saegis_test/main.dart';

void main() {
  testWidgets('Testing login', (WidgetTester tester) async {
    final uName = find.byKey(const ValueKey('name'));
    final password = find.byKey(const ValueKey('password'));
    final button = find.byKey(const ValueKey('button'));

    expect(uName, isNotNull);
    expect(password, isNotNull);
    expect(button, isNotNull);

    await tester.pumpWidget(const MaterialApp(
      home: MyHomePage(
        title: 'Title',
      ),
    ));

    await tester.enterText(uName, 'Dave');
    await tester.enterText(password, '123');
    await tester.tap(button);
    await tester.pump();

    expect(find.text('Success'), findsOneWidget);
  });

}
