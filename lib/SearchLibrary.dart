import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:library_books_search/constants.dart';
import 'package:library_books_search/model/KaRiruAPIService.dart';
import 'package:library_books_search/model/RakutenBookResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Navigatorから渡された値の取得（型はこれじゃないと取れない
    final RakutenBookResponse args = ModalRoute.of(context).settings.arguments;

    // Libraryにあるか動的に判断するためのウィジェット
    FutureBuilder<dynamic> yomikomi(String yobidasi, libList) {
      return FutureBuilder(
        future: KaRiruCheckAPI(args.Item.isbn, libList),

        // MEMO:ピーターラビット（4834018555）＝和歌山大学だけなし（空欄）
        // future: KaRiruCheckAPI("4834000826"),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return CircularProgressIndicator();
            // 接続が確立する and(かつ) データを持ってると描写処理をする。
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData &&
              snapshot.data != null) {
            // KaRiruCheckAPIのデータはsnapshot.dataで取れる。
            var dataLib = snapshot.data;

            // 県立図書館だけ、南館判定をする。
            if (yobidasi == "和歌山県立図書館") {
              var kenritu = dataLib["Wakayama_Pref"]["libkey"]["本館"];
              var kinan = dataLib["Wakayama_Pref"]["libkey"]["紀南"];

              if (kenritu == null || kenritu == "" || kenritu == "蔵書なし") {
                if (kinan == "貸出可") {
                  return Text("紀南から取り寄せ可");
                }
                return Text("蔵書なし");
              } else {
                return Text(kenritu);
              }
            } else {
              // 和歌山の図書館を居れる箱、蔵書確認で使う。
              List<String> initList = [];
              for (var val in WAKAYAMA_LIB) {
                if (yobidasi == val) {
                  initList = WAKAYAMA_MAP[yobidasi];
                  var text = dataLib[initList[0]]["libkey"][initList[1]];
                  if (text == null || text == "" || text == "蔵書なし") {
                    return Text("蔵書なし");
                  } else {
                    // 成功時
                    return Text(text);
                  }
                }
              }
            }
            return Text("Error");
          } else {
            return Text("データが存在しません");
          }
        },
      );
    }

    //app bar
    final appBar = AppBar(
      elevation: .5,
      title: Text("本の詳細"),
      actions: <Widget>[],
    );

    ///detail of book image and it's pages
    final topLeft = Padding(
      padding: EdgeInsets.all(16.0),
      child: Hero(
        tag: args.Item.title,
        child: Material(
          elevation: 15.0,
          child: Image.network(args.Item.largeImageUrl),
          //fit: BoxFit.cover,
        ),
      ),
    );

    ///detail top right
    final topRight = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        text("${args.Item.title}",
            size: 20, isBold: true, padding: EdgeInsets.only(top: 16.0)),
        text(
          '著者： ${args.Item.author}',
          color: Colors.black54,
          size: 15,
          padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
        ),
        text(
          '発売日： ${args.Item.salesDate}',
          color: Colors.black54,
          size: 15,
          padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
        ),
        text(
          '出版社： ${args.Item.publisherName}',
          color: Colors.black54,
          size: 15,
          padding: EdgeInsets.only(top: 4.0, bottom: 6.0),
        ),
        // SizedBox(height: 16.0),
      ],
    );

    // 上で定義したウィジェットを画面上部に配置
    final topContent = Container(
      padding: EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(flex: 2, child: topLeft),
          Flexible(flex: 3, child: topRight),
        ],
      ),
    );

    // 作品紹介+在庫検索のウィジェット（下の方ウィジェット）
    final bottomContent = Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 6.0),
          child: Text(
            args.Item.itemCaption,
            style: TextStyle(fontSize: 13.0, height: 1.5),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints.expand(height: 30.0),
          child: Container(
            color: Colors.blue,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "貸し出し状況",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),

        // 検索する図書館のリスト
        FutureBuilder(
          future: _setLibList(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SizedBox(
                height: 200.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(snapshot.data[index]),
                      trailing: yomikomi(snapshot.data[index], snapshot.data),
                    );
                  },
                ),
              );
            } else {
              return SizedBox(
                height: 200.0,
                child: ListView(
                  children: <Widget>[
                    const ListTile(
                      title: Text(""),
                      trailing: Text(""),
                    ),
                  ],
                ),
              );
            }
          },
        ),

        // メモボタン
        FutureBuilder(
          future: _checkMemoNull(args.Item.isbn),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == "ない") {
                return Container(
                    child: FractionallySizedBox(
                        widthFactor: 0.6,
                        child: FlatButton(
                            color: Color(0xFF00A0BE),
                            textColor: Color(0xFFFFFFFF),
                            onPressed: () {
                              // SaveBook.dart内の保存methodを呼び出す
                              _setSaveBook(args);
                              // 下画面に保存通知を出す
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text('保存しました'),
                                  duration: const Duration(seconds: 3),
                                  action: SnackBarAction(
                                    label: 'OK',
                                    onPressed: () {},
                                  ),
                                ),
                              );
                            },
                            child: Text('メモする',
                                style: TextStyle(letterSpacing: 4.0)),
                            shape: RoundedRectangleBorder(
                                side: BorderSide.none))));
              } else if (snapshot.data == "ある") {
                return Container(
                    child: FractionallySizedBox(
                        widthFactor: 0.6,
                        child: FlatButton(
                            color: Color(0xffF53649),
                            textColor: Color(0xFFFFFFFF),
                            onPressed: () {
                              // SaveBook.dart内の保存methodを呼び出す
                              _deleteBook(args);
                              // 消したら戻す。
                              Navigator.of(context).pop();
                            },
                            child: Text('メモから削除する',
                                style: TextStyle(letterSpacing: 4.0)),
                            shape: RoundedRectangleBorder(
                                side: BorderSide.none))));
              } else {
                return Container(
                    child: FractionallySizedBox(
                        widthFactor: 0.6,
                        child: FlatButton(
                            color: Color(0xFF00A0BE),
                            textColor: Color(0xFFFFFFFF),
                            onPressed: null,
                            child: Text('メモする',
                                style: TextStyle(letterSpacing: 4.0)),
                            shape: RoundedRectangleBorder(
                                side: BorderSide.none))));
              }
            } else {
              return Container(
                  child: FractionallySizedBox(
                      widthFactor: 0.6,
                      child: FlatButton(
                          color: Color(0xFF00A0BE),
                          textColor: Color(0xFFFFFFFF),
                          onPressed: null,
                          child: Text('メモする',
                              style: TextStyle(letterSpacing: 4.0)),
                          shape:
                              RoundedRectangleBorder(side: BorderSide.none))));
            }
          },
        )
      ],
    );

    // 読み込み中判定とwidget
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[topContent, bottomContent],
        ),
      ),
    );
  }

  ///create text widget
  text(String data,
          {Color color = Colors.black87,
          num size = 14,
          EdgeInsetsGeometry padding = EdgeInsets.zero,
          bool isBold = false}) =>
      Padding(
        padding: padding,
        child: Text(
          data,
          style: TextStyle(
              color: color,
              fontSize: size.toDouble(),
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
        ),
      );

  Future<void> _checkMemoNull(isbn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var val = "ない";
    // Trueは既にメモしてるってこと
    if (prefs.getString(isbn) != null) {
      val = "ある";
    }
    return val;
  }

  Future<void> _setLibList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List listArray = [];

    if (prefs.getBool("和歌山県立図書館") != false) {
      listArray.add("和歌山県立図書館");
    }
    if (prefs.getBool("和歌山市民図書館") != false) {
      listArray.add("和歌山市民図書館");
    }
    if (prefs.getBool("和歌山大学") != false) {
      listArray.add("和歌山大学");
    }
    if (prefs.getBool("橋本市図書館") ?? false) {
      listArray.add("橋本市図書館");
    }
    if (prefs.getBool("岩出図書館") ?? false) {
      listArray.add("岩出図書館");
    }
    if (prefs.getBool("海南nobinos") ?? false) {
      listArray.add("海南nobinos");
    }
    return listArray;
  }

  Future<void> _setSaveBook(RakutenBookResponse args) async {
    // ①Map型変換→②Json形式にエンコード→③リスト化
    var test = jsonEncode(args);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Key:ISBNキー
    // Value：Json加工したオブジェクト
    if (prefs.getString(args.Item.isbn) == null) {
      prefs.setString(args.Item.isbn, test);
    } else {
      // 保存してたら何もしない

    }
  }

  Future<void> _deleteBook(RakutenBookResponse args) async {
    // ①Map型変換→②Json形式にエンコード→③リスト化
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // 削除
    prefs.remove(args.Item.isbn);
  }
}
