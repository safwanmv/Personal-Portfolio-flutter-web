import 'package:flutter_test/flutter_test.dart';
import 'package:safwan_portfolio/app/app.dart';

void main() {
  testWidgets('PortfolioApp Smoke Test', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());
    expect(find.text('Safwan'), findsWidgets);
  });
}
