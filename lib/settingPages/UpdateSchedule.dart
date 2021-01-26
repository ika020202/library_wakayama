import 'package:flutter/material.dart';

class UpdateSchedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          elevation: .5,
          brightness: Brightness.light,
          title: Text("更新予定リスト"), // status bar brightness
        ),
      ),
      body: new ListView(
        children: <Widget>[
          const ListTile(
            title: Text("[更新予定内容]"),
            trailing: Text("[優先度]"),
          ),
          const Divider(),
          const ListTile(
            title: Text("デザインの改良"),
            trailing: Text("高"),
          ),
          const ListTile(
            title: Text("APIの更新対応"),
            trailing: Text("高"),
          ),
          const ListTile(
            title: Text("他の図書館への対応"),
            trailing: Text("中"),
          ),
          const ListTile(
            title: Text("他の都道府県への対応"),
            trailing: Text("小"),
          ),
        ],
      ),
    );
  }
}
