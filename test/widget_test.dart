// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/cupertino.dart';
import 'package:flutter_calculator/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group("Calculator view test", () {
    testWidgets('Calculator basic test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      expect(find.byKey(const Key("Result")), findsOneWidget);
      expect(find.byKey(const Key("displayOne")), findsOneWidget);
      expect(find.byKey(const Key("displayTwo")), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.add), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.minus), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.multiply), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.divide), findsOneWidget);

    });

    testWidgets("Operation test", (WidgetTester tester) async {

      await tester.pumpWidget(const MyApp());

      await tester.enterText(find.byKey(const Key("displayOne")), "20");
      await tester.enterText(find.byKey(const Key("displayTwo")), "10");

      await tester.tap(find.byIcon(CupertinoIcons.add));

      await tester.pump();

      expect(find.text("30"), findsOneWidget);

      await tester.tap(find.byIcon(CupertinoIcons.minus));

      await tester.pump();

      expect(find.text("10"), findsNWidgets(2));

      await tester.tap(find.byIcon(CupertinoIcons.multiply));

      await tester.pump();

      expect(find.text("200"), findsOneWidget);

      await tester.tap(find.byIcon(CupertinoIcons.divide));

      await tester.pump();

      expect(find.text("2.0"), findsOneWidget);
    });
  });

}
