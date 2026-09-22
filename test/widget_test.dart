import 'package:flutter_test/flutter_test.dart';
import 'package:lab4_flutter_ui/app/app.dart';

void main() {
  testWidgets('Lab4App smoke test - verifies HomeScreen renders', (WidgetTester tester) async {
    // Build app và trigger một frame
    await tester.pumpWidget(const Lab4App());

    // Kiểm tra tiêu đề chính hiển thị
    expect(find.text('Lab 4 – UI Fundamentals'), findsOneWidget);
    expect(find.text('Flutter UI Fundamentals'), findsOneWidget);

    // Kiểm tra có các thẻ bài tập
    expect(find.text('EXERCISE 1'), findsOneWidget);
    expect(find.text('EXERCISE 2'), findsOneWidget);
  });
}
