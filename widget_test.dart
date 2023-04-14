// ignore_for_file: prefer_const_constructors

import 'package:demotwo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  /// Unit Test ///
  test('Unit test', () {
    var timerText = Timer.getTimer();
    expect(timerText, "Afternoon");
  });

  /// Widget Test ///
  testWidgets("Widget Test", (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

// Scaffold

    final finderScaffold = find.byKey(Key('scaffold'));
    final scaffold = tester.firstWidget(finderScaffold) as Scaffold;
    final backgroundColor = scaffold.backgroundColor;

    expect(backgroundColor, Colors.white);

// Text

    final finderText = find.byKey(Key('text'));
    final text = tester.firstWidget(finderText) as Text;
    final textSize = text.style!.fontSize;
    final data = text.data;
    expect(textSize, 35);

    expect(data, 'Hey Mohit');

// TextField

    final finderTextField = find.byKey(Key('textField'));
    final textField = tester.firstWidget(finderTextField) as TextField;
    final labelText = textField.decoration!.labelText;
    expect(labelText, "Enter text");

// Column

    final finderColumn = find.byKey(Key('column'));
    final column = tester.firstWidget(finderColumn) as Column;
    final mainAxisAlignment = column.mainAxisAlignment;
    expect(mainAxisAlignment, MainAxisAlignment.spaceAround);

// ElevatedButton

    final finderButton = find.byKey(Key('button'));
    final states = <MaterialState>{};
    final widget = tester.firstWidget(finderButton) as ElevatedButton;
    final bgColor = widget.style?.shadowColor?.resolve(states);

    expect(bgColor, Colors.transparent);
  });
}
