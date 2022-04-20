import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'input.dart';

class But extends StatelessWidget {
  const But({Key? key, required this.btnTitle, required this.function})
      : super(key: key);

  final String btnTitle;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
      BoxDecoration(color: pink, borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(8),
      width: double.infinity,
      child: FlatButton(
        onPressed: () {
          function();
        },
        child: Row(
          children: <Widget>[
            const Expanded(
              child: Icon(FontAwesomeIcons.calculator),
            ),
            Expanded(
                flex: 15,
                child: Text(
                  btnTitle,
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ),
    );
  }
}
