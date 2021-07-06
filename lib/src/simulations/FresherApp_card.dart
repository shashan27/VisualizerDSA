import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(new FresherHome());
}

class FresherHome extends StatelessWidget {
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
                    child: Text("Freshers' Preview Video"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrange,
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
  const url =
      'https://drive.google.com/file/d/1SxwSNAso0XhW1bchgfz0-OCdJ-4e9Dap/view?usp=sharing';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

__launchURL() async {
  const url = 'https://github.com/dscnitp/freshers-portal-app';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
