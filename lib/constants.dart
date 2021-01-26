import 'dart:io' show Platform;
import 'package:flutter/material.dart';

// *Note*: when APP_VERSION is changed, remember to also update pubspec.yaml.
/* 開発メモ：
--図書館を増やすときに変更するファイル--

   KaRiruAPIService.dart
   Setting.dart
   SearchLibrary.dart

--図書館を増やすときに変更するファイル--

--アプリを更新したら必ず変えるファイル--

  pubspec.yaml
  constants.dart

--アプリを更新したら必ず変えるファイル--
*/

const APP_VERSION = 'v1.0';
const APP_NAME = 'ほんある？わかやま';
final kAppIcon =
    Image.asset('res/images/launcher_icon.png', height: 64.0, width: 64.0);
const APP_DESCRIPTION =
    'このアプリケーションはFlutterを用いて個人開発されています。' + '\n\nDeveloped by MKairi';
const GOOGLEPLAY_URL = '';
const APPSTORE_URL = '';
const GITHUB_URL = '';
const AUTHOR_SITE = '';
const FACEBOOK_SITE = "https://www.facebook.com/kairi.miura.56/";

const List WAKAYAMA_LIB = [
  "和歌山県立図書館",
  "和歌山市民図書館",
  "和歌山大学",
  "橋本市図書館",
  "岩出図書館",
  "海南nobinos",
];

const Map<String, List<String>> WAKAYAMA_MAP = {
  // 順番は [0]systemid, [1]libkey,[2]SharedPreferencesのKey名
  "和歌山県立図書館": ["Wakayama_Pref", "本館", "和歌山県立図書館"],
  // [2]に関しては南は無し
  "和歌山県立図書館南": ["Wakayama_Pref", "紀南", ""],
  "和歌山市民図書館": ["Wakayama_Wakayama", "市民図書館", "和歌山市民図書館"],
  "和歌山大学": ["Univ_Wakayama", "図書館", "和歌山大学"],
  "橋本市図書館": ["Wakayama_Hashimoto", "橋本市図書館", "橋本市図書館"],
  "岩出図書館": ["Wakayama_Iwade", "岩出図書館", "岩出図書館"],
  "海南nobinos": ["Wakayama_Kainan", "海南nobinos", "海南nobinos"],
};

// Whether the app is running on mobile phones (Android/iOS)
final kIsOnMobile = Platform.isAndroid || Platform.isIOS;
