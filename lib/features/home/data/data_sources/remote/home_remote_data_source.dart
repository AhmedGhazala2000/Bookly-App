import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/constant.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:hive/hive.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();

  Future<List<BookEntity>> fetchFreeBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
      endPoint: 'volumes?printType=books&maxResults=40&q=programming',
    );
    List<BookEntity> books = BookModel.fromJson(data).items!;
    var box = Hive.box<BookEntity>(kFeaturedBox);
    box.addAll(books);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchFreeBooks() async {
    var data = await apiService.get(
      endPoint:
          'volumes?printType=books&filter=free-ebooks&maxResults=40&q=programming',
    );
    List<BookEntity> books = BookModel.fromJson(data).items!;
    var box = Hive.box<BookEntity>(kFreeBox);
    box.addAll(books);
    return books;
  }
}
