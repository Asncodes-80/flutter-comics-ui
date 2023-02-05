import 'package:flutter/material.dart';
import 'package:flutter_comics_ui/flutter_comics_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Can create a ComicsApp", (WidgetTester tester) async {
    await tester.pumpWidget(const ComicsApp(
      home: ComicsApp(
        home: Text("Flutter ComicsApp"),
      ),
    ));
  });

  expect(find.text("Flutter ComicsApp"), findsOneWidget);
}
