import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pognali/app/app.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('application starts at the catalog', (WidgetTester tester) async {
    await tester.pumpWidget(const PognaliApp());
    await tester.pumpAndSettle();

    expect(find.text('Погнали'), findsOneWidget);
    expect(find.text('Найдём площадку для игры'), findsOneWidget);
  });
}
