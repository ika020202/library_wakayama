import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:library_books_search/Settings.dart';
import 'package:library_books_search/settingPages/ThisAppInfo.dart';
import 'package:library_books_search/settingPages/UpdateSchedule.dart';
import 'package:library_books_search/settingPages/WebAPILicensePage.dart';
import 'package:library_books_search/view/MainViewModel.dart';
import 'package:library_books_search/view/MainViewModelData.dart';
import 'SearchLibrary.dart';
import "MainBooksSearch.dart";
import "History.dart";

void main() {
  runApp(MyApp());
}

/* mainはBottomNavigate(BasePage)の画面だけしか使ってないです。
  BasePage = BottomNavigate画面（デフォ）
  SearchPage = ListViewの画面（デフォにBody付け加えた。）
*/

final RouteObserver<PageRoute> _routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        // '/': (_) => new BasePage(),
        '/BookDetails': (_) => new BookDetails(),
        "/History": (_) => new HistoryPage(_routeObserver),
        "/ThisAppInfo": (_) => new ThisAppInfoPage(),
        "/ToDoSchedule": (_) => new UpdateSchedule(),
        "/WebAPILicense": (_) => new WebAPILicense(),
      },
      navigatorObservers: [
        _routeObserver,
      ],
      title: 'WakayamaLibrarySearch',
      theme: ThemeData(
        primaryColor: Color(0xFF0C9869),
        textTheme:
            Theme.of(context).textTheme.apply(bodyColor: Color(0xFF3C4046)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StateNotifierProvider<MainViewModel, MainViewModelData>(
        create: (_) => MainViewModel(),
        child: BasePage(),
      ),
    );
  }
}

class BasePage extends StatefulWidget {
  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  // page index
  int _index = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new PageView(
          controller: _pageController,
          onPageChanged: (int index) {
            setState(() {
              this._index = index;
            });
          },
          children: [
            // ListView（デフォ）
            SearchPage(),
            // メモ画面
            HistoryPage(_routeObserver),
            // Setting画面
            SettingsPage(),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          // define animation
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 10), curve: Curves.ease);
        },
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            // call each bottom item
            icon: new Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.book),
            label: "Books",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting",
          )
        ],
      ),
    );
  }
}
