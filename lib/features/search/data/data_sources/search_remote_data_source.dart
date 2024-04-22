import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/constant.dart';
import 'package:hive/hive.dart';

class SearchRemoteDataSource {
  SearchRemoteDataSource(this.apiService);

  ApiService apiService;

  Future<List<BookEntity>> fetchSearchedBooks(
      {required String booksName}) async {
    var data = await apiService.get(
      endPoint: 'volumes?printType=books&maxResults=40&q=$booksName',
    );
    var books = BookModel.fromJson(data).items!;
    var box = Hive.box<BookEntity>(kSearchBox);
    box.addAll(books);
    return books;
  }
}
