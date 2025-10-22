import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/main.dart';

void main() {
  testWidgets('app builds', (WidgetTester tester) async {
    await tester.pumpWidget(const BookClubApp());
    expect(find.text('Book Club Home'), findsOneWidget);
  });
}

