import 'package:customer_app/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App boots', (WidgetTester tester) async {
    await tester.pumpWidget(const KitchenOSApp());
    await tester.pump();
  });
}
