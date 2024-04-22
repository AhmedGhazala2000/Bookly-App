import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/utils/constant.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();

  List<BookEntity> fetchFreeBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(kFeaturedBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchFreeBooks() {
    var box = Hive.box<BookEntity>(kFreeBox);
    return box.values.toList();
  }
}
