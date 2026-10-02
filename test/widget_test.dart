// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:resqon/main.dart';

void main() {
  testWidgets('home screen shows RESQON quick actions', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ResQonApp());

    expect(find.text('RESQON'), findsOneWidget);
    expect(find.text('Quick Actions'), findsOneWidget);
    expect(find.text('Push to Talk'), findsOneWidget);
    expect(find.text('Voice Message'), findsOneWidget);
    expect(find.text('Emergency Alert'), findsOneWidget);
  });
}
