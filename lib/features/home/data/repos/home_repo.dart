import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/models/book_model/item.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<Item>>> fetchFeaturedBooks();
  Future<Either<Failures, List<Item>>> fetchNewestBooks();
}
