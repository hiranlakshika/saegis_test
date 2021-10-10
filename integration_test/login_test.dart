import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:saegis_test/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Testing login', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 3));

    final uName = find.byKey(const ValueKey('name'));
    final password = find.byKey(const ValueKey('password'));
    final button = find.byKey(const ValueKey('button'));

    expect(uName, findsOneWidget);
    expect(password, findsOneWidget);
    expect(button, findsOneWidget);

    await tester.enterText(uName, 'Dave');
    await tester.enterText(password, '123');
    await tester.tap(button);
    // expect(find.text('Success'), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 3));
  });
}