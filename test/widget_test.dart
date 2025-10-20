import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/main.dart'; // ← 如果 pubspec.yaml 的 name 不是 hello_world，改成你的包名

void main() {
  testWidgets('app builds', (WidgetTester tester) async {
    await tester.pumpWidget(const BookClubApp());
    expect(find.text('Book Club Home'), findsOneWidget);
  });
}

