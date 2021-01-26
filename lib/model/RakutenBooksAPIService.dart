import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:library_books_search/model/RakutenBooksResponse.dart';

Future<RakutenBooksResponse> getBooks(String keyword) async {
  var url =
      "https://app.rakuten.co.jp/services/api/BooksBook/Search/20170404?" +
          "applicationId=1015741888842153237&" +
          "availability=0&" +
          "outOfStockFlag=0&" +
          "title=$keyword";
  print(url);

  final response = await http.get(url);
  if (response.statusCode == 200) {
    return RakutenBooksResponse.fromJson(convert.jsonDecode(response.body));
  } else {
    throw Exception('Failed to connect to webservice');
  }
}
