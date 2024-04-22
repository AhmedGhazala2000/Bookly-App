import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/use_cases/use_case_without_params.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>> {
  HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failures, List<BookEntity>>> call() {
    //Check Permission
    return homeRepo.fetchFeaturedBooks();
  }
}
