import 'package:flutter/material.dart';
import 'package:library_books_search/CommonComponents.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool wakayamakenBool = false;
  bool wakayamashiBool = false;
  bool wakayamaUniBool = false;
  bool hashimotoBool = false;
  bool iwadeBool = false;
  bool kainanNobiBool = false;

  // 初期設定でSharedPreferences取る
  @override
  void initState() {
    super.initState();
    _initSetBool();
  }

  // BOOL値をSharedPreferencesに保存
  _initSetBool() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      // 県立、市民、和歌山大学はデフォでON
      wakayamakenBool = prefs.getBool("和歌山県立図書館") ?? true;
      wakayamashiBool = prefs.getBool("和歌山市民図書館") ?? true;
      wakayamaUniBool = prefs.getBool("和歌山大学") ?? true;
      hashimotoBool = prefs.getBool("橋本市図書館") ?? false;
      iwadeBool = prefs.getBool("岩出図書館") ?? false;
      kainanNobiBool = prefs.getBool("海南nobinos") ?? false;
    });
  }

  // BOOL値をSharedPreferencesに保存
  _saveBool(String key, bool value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          elevation: .5,
          brightness: Brightness.light,
          title: Text("設定"), // status bar brightness
        ),
      ),
      body: SettingsList(
        backgroundColor: Colors.white,
        sections: [
          CustomSection(
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
            ),
          ),
          SettingsSection(
            title: '検索する図書館',
            //titleTextStyle: TextStyle(),
            tiles: [
              SettingsTile.switchTile(
                title: '和歌山県立図書館',
                switchValue: wakayamakenBool,
                onToggle: (bool value) {
                  setState(() {
                    wakayamakenBool = value;
                    _saveBool("和歌山県立図書館", value);
                  });
                },
              ),
              SettingsTile.switchTile(
                title: '和歌山市民図書館',
                switchValue: wakayamashiBool,
                onToggle: (bool value) {
                  setState(() {
                    wakayamashiBool = value;
                    _saveBool("和歌山市民図書館", value);
                  });
                },
              ),
              SettingsTile.switchTile(
                title: '和歌山大学',
                switchValue: wakayamaUniBool,
                onToggle: (bool value) {
                  setState(() {
                    wakayamaUniBool = value;
                    _saveBool("和歌山大学", value);
                  });
                },
              ),
              SettingsTile.switchTile(
                title: '橋本市図書館',
                switchValue: hashimotoBool,
                onToggle: (bool value) {
                  setState(() {
                    hashimotoBool = value;
                    _saveBool("橋本市図書館", value);
                  });
                },
              ),
              SettingsTile.switchTile(
                title: '岩出図書館',
                switchValue: iwadeBool,
                onToggle: (bool value) {
                  setState(() {
                    iwadeBool = value;
                    _saveBool("岩出図書館", value);
                  });
                },
              ),
              SettingsTile.switchTile(
                title: '海南nobinos',
                switchValue: kainanNobiBool,
                onToggle: (bool value) {
                  setState(() {
                    kainanNobiBool = value;
                    _saveBool("海南nobinos", value);
                  });
                },
              ),
            ],
          ),
          CustomSection(
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
            ),
          ),
          SettingsSection(
            title: 'その他',
            tiles: [
              SettingsTile(
                title: 'このアプリについて',
                leading: Icon(Icons.info),
                onPressed: (context) {
                  Navigator.of(context).pushNamed("/ThisAppInfo");
                },
              ),
              SettingsTile(
                title: '更新予定リスト',
                leading: Icon(Icons.list),
                onPressed: (context) {
                  Navigator.of(context).pushNamed("/ToDoSchedule");
                },
              ),
              SettingsTile(
                title: '問い合わせ',
                leading: Icon(Icons.email),
                onPressed: (context) {
                  openMailApp();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
