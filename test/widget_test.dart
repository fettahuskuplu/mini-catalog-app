import 'package:flutter_test/flutter_test.dart';
import 'package:mini_catalog_app/main.dart';

void main() {
  testWidgets('Keşfet başlığı ana ekranda görüntülenir', (WidgetTester tester) async {
    await tester.pumpWidget(const MiniCatalogApp());
    expect(find.text('Keşfet'), findsOneWidget);
    expect(find.text('Aradığınız cihazı keşfedin'), findsOneWidget);
  });
}
