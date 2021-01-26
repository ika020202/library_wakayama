import 'package:flutter/material.dart';
import 'package:library_books_search/CommonComponents.dart';
import 'package:library_books_search/constants.dart';

class ThisAppInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          elevation: .5,
          brightness: Brightness.light,
          title: Text("このアプリについて"), // status bar brightness
        ),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            leading: new FlutterLogo(),
            title: const Text(APP_NAME),
            subtitle: const Text(APP_VERSION),
          ),
          const ListTile(
            title: Text(APP_DESCRIPTION),
          ),
          const Divider(),
          new ListTile(
            leading: new Icon(Icons.email),
            title: new Text('Feedback by E-mail'),
            onTap: () {
              openMailApp();
            },
          ),
          new ListTile(
            leading: new Icon(Icons.face),
            title: new Text('View My FaceBook'),
            onTap: () {
              launchURL(FACEBOOK_SITE);
            },
          ),
          new ListTile(
            leading: new Icon(Icons.info),
            title: new Text("Using Web APIs"),
            onTap: () {
              Navigator.of(context).pushNamed("/WebAPILicense");
            },
          ),
          new Divider(),
        ],
      ),
    );
  }
}
