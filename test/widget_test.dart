import 'package:flutter_test/flutter_test.dart';
import 'package:mini_catalog_app/main.dart';

void main() {
  testWidgets('Discover header renders on home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MiniCatalogApp());
    expect(find.text('Discover'), findsOneWidget);
    expect(find.text('Find your perfect device'), findsOneWidget);
  });
}
