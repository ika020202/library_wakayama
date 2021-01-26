import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_books_search/model/RakutenBooksResponse.dart';
part 'MainViewModelData.freezed.dart';

enum MainViewModelState { normal, loading, error }

@freezed
abstract class MainViewModelData with _$MainViewModelData {
  const factory MainViewModelData(
      {RakutenBooksResponse response,
      MainViewModelState viewModelState}) = _MainViewModelData;
}
