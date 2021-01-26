import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_books_search/model/RakutenBookResponse.dart';
import 'package:library_books_search/model/RakutenBooksResponse.dart';
import 'package:library_books_search/view/MainViewModel.dart';
import 'package:library_books_search/view/MainViewModelData.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchQuery = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 状態保持やAPIの取得などの初期設定
    final response = context.select<MainViewModelData, RakutenBooksResponse>(
        (data) => data.response);
    final state = context.select<MainViewModelData, MainViewModelState>(
        (data) => data.viewModelState);
    final List<RakutenBookResponse> bookList =
        response != null ? response.Items : [];

    // 状況に応じてbodyの変更、これは検索成功時のデフォルトBody
    Widget body = SafeArea(
        child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              textInputAction: TextInputAction.search,
              controller: _searchQuery,
              onSubmitted: (text) {
                if (text != "") {
                  context.read<MainViewModel>().fetch(_searchQuery.text);
                }
              },
              style: TextStyle(
                fontSize: 20.0,
              ),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  semanticLabel: 'Search',
                ),
                suffixIcon: _searchQuery.text.isEmpty
                    ? null
                    : InkWell(
                        onTap: () => _searchQuery.clear(),
                        child: Icon(Icons.clear),
                      ),
                labelText: "探す本のタイトルを入力してください",
                labelStyle: TextStyle(fontSize: 12),
                //enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: const BorderSide(
                    color: Color(0xffe0e0e9),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: bookList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed("/BookDetails", arguments: bookList[index]);
                  },
                  child: Container(
                    height: 90,
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: bookList[index].Item.largeImageUrl != null
                                ? Image.network(
                                    bookList[index].Item.largeImageUrl,
                                    //fit: BoxFit.cover,
                                    width: 76,
                                    height: 76,
                                  )
                                : Container()),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  bookList[index].Item.title,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 0.8),
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  bookList[index].Item.itemCaption != null
                                      ? bookList[index].Item.itemCaption
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

    //読み込み中の表示と、エラー表示の画面をIF文で判別し、bodyに代入
    if (state == MainViewModelState.loading) {
      body = Center(
        child: CircularProgressIndicator(),
      );
    } else if (state == MainViewModelState.error) {
      body = SafeArea(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              textInputAction: TextInputAction.search,
              controller: _searchQuery,
              onSubmitted: (text) {
                context.read<MainViewModel>().fetch(_searchQuery.text);
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: _searchQuery.text.isEmpty
                    ? null
                    : InkWell(
                        onTap: () => _searchQuery.clear(),
                        child: Icon(Icons.clear),
                      ),
                labelText: "探す本のタイトルを入力してください",
                labelStyle: TextStyle(
                  fontSize: 13,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                '入力がされていないか、無効な文字列です。検索ワードを変えてお試しください。',
                style: TextStyle(fontSize: 19),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ));
    }

    // 原型となるScaffold
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            elevation: .5,
            brightness: Brightness.light,
            title: Text("蔵書の検索"), // status bar brightness
          ),
        ),
        body: body);
  }
}
