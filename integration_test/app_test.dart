import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:soigne_moi_secretaire/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Login Test', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Vérifier que nous sommes sur la page de connexion
    expect(find.text('Connexion'), findsOneWidget);

    // Saisir l'email et le mot de passe
    await tester.enterText(find.byKey(Key('emailField')), 'secretary@soignemoi.com');
    await tester.enterText(find.byKey(Key('passwordField')), '19962305Vp');
    await tester.tap(find.byKey(Key('loginButton')));
    await tester.pumpAndSettle();

    // Vérifier que nous sommes redirigés vers le tableau de bord
    expect(find.text('Tableau de bord'), findsOneWidget);
  });
}
