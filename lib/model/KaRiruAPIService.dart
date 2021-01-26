import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:library_books_search/constants.dart';

Future KaRiruCheckAPI(String isbn, libList) async {
  var urlText = "http://api.calil.jp/check?" +
      "appkey=8f00119685fd698014019ab23173ba98&" +
      "isbn=$isbn&" +
      "&callback=no&" +
      "systemid=";

  // SystemIDをくっつける
  var url = _setLibSystemId(urlText, libList);

  // ここからデフォ機能
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var kariruObj = convert.jsonDecode(response.body);

    // continueが1の時は、まだ読み込み途中
    while (kariruObj["continue"] == 1) {
      // 再読み込みには２秒置かなきゃいけないらしい（カーリルAPI）
      await Future.delayed(Duration(seconds: 1));
      response = await http.get(url);
      kariruObj = convert.jsonDecode(response.body);
    }

    //デコードした中から図書館情報だけを抜き出す。
    return kariruObj["books"][isbn];
  } else {
    throw Exception('Failed to connect to webservice');
  }
}

_setLibSystemId(url, libList) {
  String nextUrl = "";
  // 県立、市民、和歌山大学はデフォでON

  for (var val in libList) {
    var sysid = WAKAYAMA_MAP[val][0];
    nextUrl = nextUrl + sysid + ",";
  }
  // 末尾の","を削除して検索
  return url + nextUrl.substring(0, nextUrl.length - 1);
}
