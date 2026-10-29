import 'package:catatanku/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CatatanKu opens the login flow', (tester) async {
    await tester.pumpWidget(const CatatanKuApp());
    expect(find.text('CatatanKu'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 1600));
    await tester.pumpAndSettle();
    expect(find.text('Selamat datang\nkembali.'), findsOneWidget);
    expect(find.text('Masuk'), findsOneWidget);
  });

  testWidgets('login validation keeps the user on the login screen', (
    tester,
  ) async {
    await tester.pumpWidget(const CatatanKuApp());
    await tester.pump(const Duration(milliseconds: 1600));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Masuk'));
    await tester.pump();

    expect(find.text('Masukkan email yang valid.'), findsOneWidget);
    expect(find.text('Password minimal 6 karakter.'), findsOneWidget);
  });
}
