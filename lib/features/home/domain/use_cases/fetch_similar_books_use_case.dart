import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/use_cases/use_case_with_params.dart';
import 'package:bookly_app/features/home/domain/repos/home_details_repo.dart';
import 'package:dartz/dartz.dart';

class FetchSimilarBooksUseCase extends UseCase<List<BookEntity>, String> {
  HomeDetailsRepo homeDetailsRepo;

  FetchSimilarBooksUseCase(this.homeDetailsRepo);

  @override
  Future<Either<Failures, List<BookEntity>>> call(String param) {
    //Check Permission
    return homeDetailsRepo.fetchSimilarBooks(category: param);
  }
}
