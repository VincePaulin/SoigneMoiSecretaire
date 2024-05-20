import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:soigne_moi_secretaire/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Login Test', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Verify we are on the login page
    expect(find.text('Connexion'), findsOneWidget);

    // Enter email and password
    await tester.enterText(find.byKey(Key('emailField')), 'secretary@soignemoi.com');
    await tester.enterText(find.byKey(Key('passwordField')), '19962305Vp');
    await tester.tap(find.byKey(Key('loginButton')));
    await tester.pumpAndSettle();

    // Verify we are redirected to the dashboard
    expect(find.byKey(Key('pageTitle_Tableau de bord')), findsOneWidget);
  });

  testWidgets('Navigation and Logout Test', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Verify we are on the login page
    expect(find.text('Connexion'), findsOneWidget);

    // Enter email and password
    await tester.enterText(find.byKey(Key('emailField')), 'secretary@soignemoi.com');
    await tester.enterText(find.byKey(Key('passwordField')), '19962305Vp');
    await tester.tap(find.byKey(Key('loginButton')));
    await tester.pumpAndSettle();

    // Verify we are redirected to the dashboard
    expect(find.byKey(Key('pageTitle_Tableau de bord')), findsOneWidget);

    // Navigate to Doctors
    await tester.tap(find.byKey(Key('nav_doctors')));
    await tester.pumpAndSettle();
    expect(find.byKey(Key('pageTitle_Docteurs')), findsOneWidget);

    // Logout
    await tester.tap(find.byKey(Key('logoutButton')));
    await tester.pumpAndSettle();

    // Verify we are redirected to the login page
    expect(find.text('Connexion'), findsOneWidget);
  });

  testWidgets('Entry and Output Item Click Test', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Verify we are on the login page
    expect(find.text('Connexion'), findsOneWidget);

    // Enter email and password
    await tester.enterText(find.byKey(Key('emailField')), 'secretary@soignemoi.com');
    await tester.enterText(find.byKey(Key('passwordField')), '19962305Vp');
    await tester.tap(find.byKey(Key('loginButton')));
    await tester.pumpAndSettle();

    // Verify we are redirected to the dashboard
    expect(find.byKey(Key('pageTitle_Tableau de bord')), findsOneWidget);

    // Check if there is any entry
    if (tester.widgetList(find.byKey(Key('entryItem'))).isNotEmpty) {
      // Tap on the first entry item
      await tester.tap(find.byKey(Key('entryItem')).first);
      await tester.pumpAndSettle();
      // Verify we are on the medical folder page
      expect(find.byKey(Key('pageTitle_Medical Folder')), findsOneWidget);

      // Swipe to the second tab
      await tester.drag(find.byType(TabBarView), const Offset(-200, 0));
      await tester.pumpAndSettle();

      // Verify we are on the second tab
      expect(find.text('Prescription'), findsOneWidget);

      // Navigate back
      await tester.tap(find.byTooltip('Back'));
      await tester.pumpAndSettle();
    }

    // Check if there is any output
    if (tester.widgetList(find.byKey(Key('outputItem'))).isNotEmpty) {
      // Tap on the first output item
      await tester.tap(find.byKey(Key('outputItem')).first);
      await tester.pumpAndSettle();
      // Verify we are on the medical folder page
      expect(find.byKey(Key('pageTitle_Medical Folder')), findsOneWidget);

      // Swipe to the second tab
      await tester.drag(find.byType(TabBarView), const Offset(-200, 0));
      await tester.pumpAndSettle();

      // Verify we are on the second tab
      expect(find.text('Prescription'), findsOneWidget);
    }
  });

  testWidgets('Today Doctor Item Click Test', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Verify we are on the login page
    expect(find.text('Connexion'), findsOneWidget);

    // Enter email and password
    await tester.enterText(find.byKey(Key('emailField')), 'secretary@soignemoi.com');
    await tester.enterText(find.byKey(Key('passwordField')), '19962305Vp');
    await tester.tap(find.byKey(Key('loginButton')));
    await tester.pumpAndSettle();

    // Verify we are redirected to the dashboard
    expect(find.byKey(Key('pageTitle_Tableau de bord')), findsOneWidget);

    // Check if there is any doctor today
    if (tester.widgetList(find.byKey(Key('todayDoctorItem'))).isNotEmpty) {
      // Tap on the first doctor today item
      await tester.tap(find.byKey(Key('todayDoctorItem')).first);
      await tester.pumpAndSettle();

      // Verify we are on the doctor's detail page
      expect(find.byKey(Key('pageTitle_Doctor Details')), findsOneWidget);
    }
  });

  testWidgets('Navigate to Doctors and Click Doctor Item Test', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Verify we are on the login page
    expect(find.text('Connexion'), findsOneWidget);

    // Enter email and password
    await tester.enterText(find.byKey(Key('emailField')), 'secretary@soignemoi.com');
    await tester.enterText(find.byKey(Key('passwordField')), '19962305Vp');
    await tester.tap(find.byKey(Key('loginButton')));
    await tester.pumpAndSettle();

    // Verify we are redirected to the dashboard
    expect(find.byKey(Key('pageTitle_Tableau de bord')), findsOneWidget);

    // Navigate to Doctors
    await tester.tap(find.byKey(Key('nav_doctors')));
    await tester.pumpAndSettle();
    expect(find.byKey(Key('pageTitle_Docteurs')), findsOneWidget);

    // Check if there is any doctor in the list
    if (tester.widgetList(find.byKey(Key('doctorItem'))).isNotEmpty) {
      // Tap on the first doctor item
      await tester.tap(find.byKey(Key('doctorItem')).first);
      await tester.pumpAndSettle();

      // Verify we are on the doctor's detail page
      expect(find.byKey(Key('pageTitle_Doctor Details')), findsOneWidget);
    }
  });
}
