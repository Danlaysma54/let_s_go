import 'package:flutter_test/flutter_test.dart';
import 'package:pognali/app/app.dart';

void main() {
  testWidgets('shows the catalog entry screen', (WidgetTester tester) async {
    await tester.pumpWidget(const PognaliApp());

    expect(find.text('Погнали'), findsOneWidget);
    expect(find.text('Найдём площадку для игры'), findsOneWidget);
  });
}
