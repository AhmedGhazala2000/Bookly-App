import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/utils/constant.dart';
import 'package:hive/hive.dart';

abstract class HomeDetailsLocalDataSource {
  List<BookEntity> fetchSimilarBooks();
}

class HomeDetailsLocalDataSourceImpl extends HomeDetailsLocalDataSource {
  @override
  List<BookEntity> fetchSimilarBooks() {
    var box = Hive.box<BookEntity>(kSimilarBox);
    return box.values.toList();
  }
}
