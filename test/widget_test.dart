// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:metropol_mawanda_peter/main.dart';
import 'package:metropol_mawanda_peter/widgets/credit_history_card.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('CreditHistoryCard displays score history correctly', (WidgetTester tester) async {
    // Create a sample credit history
    final history = [
      {'date': '2024-01-01', 'score': 740},
      {'date': '2024-02-01', 'score': 750},
    ];

    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CreditHistoryCard(
            history: history,
          ),
        ),
      ),
    );

    // Verify the widget displays the correct number of entries
    expect(find.byType(ListTile), findsNWidgets(2));

    // Verify the first entry displays correctly
    expect(find.text('Jan 01, 2024'), findsOneWidget);
    expect(find.text('740'), findsOneWidget);

    // Verify the second entry displays correctly
    expect(find.text('Feb 01, 2024'), findsOneWidget);
    expect(find.text('750'), findsOneWidget);
  });
}
