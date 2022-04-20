import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({Key? key, required this.ico, required this.txt})
      : super(key: key);

  final IconData ico;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Icon(
                ico,
                color: Colors.white30,
              ),
            ),
          ),
          // SizedBox(
          // ),
          Expanded(
            flex: 1,
            child: Center(
              child: FittedBox(
                fit: BoxFit.fill,
                child: Text(
                  txt,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
