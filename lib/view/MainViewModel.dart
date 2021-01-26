import 'package:library_books_search/model/KaRiruAPIService.dart';
import 'package:library_books_search/model/RakutenBooksResponse.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:library_books_search/model/RakutenBooksAPIService.dart';
import 'package:library_books_search/view/MainViewModelData.dart';

class MainViewModel extends StateNotifier<MainViewModelData> {
  MainViewModel() : super(MainViewModelData());

  void fetch(String keyword) {
    state = state.copyWith(viewModelState: MainViewModelState.loading);
    getBooks(keyword).then((res) {
      state = state.copyWith(
          response: res, viewModelState: MainViewModelState.normal);
    }).catchError((_) {
      state = state.copyWith(
          response: null, viewModelState: MainViewModelState.error);
    });
  }
}
