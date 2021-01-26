import 'package:flutter/material.dart';

class WebAPILicense extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .5,
        brightness: Brightness.light,
        title: Text("Web API ライセンス"), // status bar brightness
      ),
      body: new ListView(
        children: <Widget>[
          const ListTile(
            title: Text("カーリル図書館API" + "\n" + "https://calil.jp/doc/api.html"),
          ),
          const Divider(),
          const ListTile(
            title: Text("楽天ブックス書籍検索API" +
                "\n" +
                "https://webservice.rakuten.co.jp/api/booksbooksearch/"),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
