import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/constant.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:hive/hive.dart';

abstract class HomeDetailsRemoteDataSource {
  Future<List<BookEntity>> fetchSimilarBooks({required String category});
}

class HomeDetailsRemoteDataSourceImpl extends HomeDetailsRemoteDataSource {
  ApiService apiService;

  HomeDetailsRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String category}) async {
    var data = await apiService.get(
      endPoint:
          'volumes?printType=books&maxResults=40&orderBy=relevance&q=$category',
    );
    List<BookEntity> books = BookModel.fromJson(data).items!;
    var box = Hive.box<BookEntity>(kSimilarBox);
    box.addAll(books);
    return books;
  }
}
