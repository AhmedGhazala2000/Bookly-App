import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookEntity>>> fetchFeaturedBooks();

  Future<Either<Failures, List<BookEntity>>> fetchFreeBooks();
}
