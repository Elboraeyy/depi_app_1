import 'package:flutter_test/flutter_test.dart';
import 'package:depi_app_1/main.dart';

void main() {
  testWidgets('app starts', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump(const Duration(seconds: 3));
    expect(find.byType(MyApp), findsOneWidget);
  });
}
