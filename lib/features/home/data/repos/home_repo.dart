import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/models/book_model/item.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookItem>>> fetchFeaturedBooks();
  Future<Either<Failures, List<BookItem>>> fetchNewestBooks();
  Future<Either<Failures, List<BookItem>>> fetchSimilarBooks({required String category});

}
