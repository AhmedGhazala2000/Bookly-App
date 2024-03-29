import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/models/book_model/item.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failures, List<BookItem>>> fetchSearchedBooks(
      {required String booksName});
}
