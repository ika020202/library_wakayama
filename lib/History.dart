import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_books_search/model/RakutenBookResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryPage extends StatefulWidget {
  final RouteObserver<PageRoute> routeObserver;
  const HistoryPage(this.routeObserver);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> with RouteAware {
  SharedPreferences sharedPrefs;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    widget.routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    // 一度、別の画面に遷移したあとで、再度この画面に戻ってきた時にコールされます。
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget body;

    return FutureBuilder(
      future: _getPrefs(),
      builder: (BuildContext context, snapshot) {
        // 読み込み中
        if (snapshot.connectionState == ConnectionState.done) {
          // SharedPreferencesに保存されている全てのリストを取得
          final List<RakutenBookResponse> historyList = _getSaveBook();

          if (historyList.length != 0) {
            // 状況に応じてbodyの変更、これは検索成功時
            body = SafeArea(
                child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: historyList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("/BookDetails",
                                arguments: historyList[index]);
                          },
                          child: Container(
                            height: 90,
                            padding: const EdgeInsets.all(0),
                            child: Row(
                              children: <Widget>[
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child:
                                        historyList[index].Item.largeImageUrl !=
                                                null
                                            ? Image.network(
                                                historyList[index]
                                                    .Item
                                                    .largeImageUrl,
                                                //fit: BoxFit.cover,
                                                width: 76,
                                                height: 76,
                                              )
                                            : Container()),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          historyList[index].Item.title,
                                          maxLines: 2,
                                          style: TextStyle(
                                            color: Color.fromRGBO(0, 0, 0, 0.8),
                                            fontSize: 15,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        Text(
                                          historyList[index].Item.itemCaption !=
                                                  null
                                              ? historyList[index]
                                                  .Item
                                                  .itemCaption
                                              : '',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Color(0xFF8E8E93),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    sharedPrefs
                                        .remove(historyList[index].Item.isbn);
                                    didPopNext();
                                  },
                                  child: const Icon(
                                    CupertinoIcons.clear,
                                    semanticLabel: 'Clear',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ));
          } else {
            // こっちは失敗時でデフォ（メモ登録[sharePreferences]に何も入ってない時）
            body = SafeArea(
                child: Column(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Text(
                      '何もメモされていません。',
                      style: TextStyle(fontSize: 19),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ));
          }
        } else {
          // 読み込み中の処理
          body = Center(child: CircularProgressIndicator());
        }

        return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(40),
              child: AppBar(
                elevation: .5,
                brightness: Brightness.light,
                title: Text("メモした本の一覧"), // status bar brightness
              ),
            ),
            body: body);
      },
    );
  }

  // SharePre貰う
  Future<void> _getPrefs() async {
    sharedPrefs = await SharedPreferences.getInstance();
  }

  // メモしてる本を取得して描写（このページのメイン）
  List<RakutenBookResponse> _getSaveBook() {
    List<RakutenBookResponse> returnList = [];
    final keys = sharedPrefs.getKeys();

    if (keys != null) {
      for (String key in keys) {
        if (double.tryParse(key) != null) {
          var value = sharedPrefs.get(key);
          returnList.add(RakutenBookResponse.fromJson(jsonDecode(value)));
        }
      }
    }
    return returnList;
  }
}
