import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(new BacktrackingHome());
}

class BacktrackingHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
          body: new Container(
              alignment: Alignment.center,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new ElevatedButton(
                    child: Text('Sudoku homepage'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        textStyle: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    onPressed: _launchURL,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  new ElevatedButton(
                    child: Text('Source Code'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.lightGreenAccent,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        textStyle: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    onPressed: __launchURL,
                  ),
                ],
              )),
        ));
  }
}

_launchURL() async {
  const url = 'https://shashan27.github.io/sudoku/#/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

__launchURL() async {
  const url = 'https://github.com/shashan27/sudokuFlutter';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
