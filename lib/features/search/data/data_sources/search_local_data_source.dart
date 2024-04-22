import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/utils/constant.dart';
import 'package:hive/hive.dart';

class SearchLocalDataSource {
  List<BookEntity> fetchSearchedBooks() {
    var box = Hive.box<BookEntity>(kSearchBox);
    return box.values.toList();
  }
}
