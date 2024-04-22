import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeDetailsRepo {
  Future<Either<Failures, List<BookEntity>>> fetchSimilarBooks(
      {required String category});
}
