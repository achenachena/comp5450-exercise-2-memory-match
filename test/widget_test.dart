import 'package:flutter_test/flutter_test.dart';
import 'package:memory_match/main.dart';

void main() {
  testWidgets('Memory Match home screen loads', (WidgetTester tester) async {
    await tester.pumpWidget(const MemoryMatchApp());
    await tester.pumpAndSettle();

    expect(find.text('Memory Match'), findsOneWidget);
    expect(find.text('Find all matching pairs! 🐾'), findsOneWidget);
    expect(find.text('Restart'), findsOneWidget);
    expect(find.text('?'), findsWidgets);
  });

  testWidgets('Restart resets move counter', (WidgetTester tester) async {
    await tester.pumpWidget(const MemoryMatchApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Restart'));
    await tester.pumpAndSettle();

    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('Back on home screen shows feedback', (WidgetTester tester) async {
    await tester.pumpWidget(const MemoryMatchApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    expect(find.text('You are on the main game screen.'), findsOneWidget);
  });
}
