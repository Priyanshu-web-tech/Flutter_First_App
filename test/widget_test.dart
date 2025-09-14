import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_first_app/app/app.dart';

void main() {
  group("Calculator View Test", () {
    testWidgets("Calculator Basic Test", (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      expect(find.byKey(Key("Result")), findsOneWidget);
      expect(find.byKey(Key("displayOne")), findsOneWidget);
      expect(find.byKey(Key("displayTwo")), findsOneWidget);

      expect(find.byIcon(CupertinoIcons.add), findsOneWidget);

      expect(find.byIcon(CupertinoIcons.minus), findsOneWidget);

      expect(find.byIcon(CupertinoIcons.multiply), findsOneWidget);

      expect(find.byIcon(CupertinoIcons.divide), findsOneWidget);
    });

    testWidgets("Operations Test", (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      
      await tester.enterText(find.byKey(Key("displayOne")), "20");

      await tester.enterText(find.byKey(Key("displayTwo")), "10");

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
