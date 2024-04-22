import 'dart:developer';

import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/search/data/data_sources/search_local_data_source.dart';
import 'package:bookly_app/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:bookly_app/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  SearchRepoImpl(
      {required this.searchRemoteDataSource,
      required this.searchLocalDataSource});

  SearchRemoteDataSource searchRemoteDataSource;
  SearchLocalDataSource searchLocalDataSource;

  @override
  Future<Either<Failures, List<BookEntity>>> fetchSearchedBooks(
      {required String booksName}) async {
    try {
      List<BookEntity> books;
      /* books = searchLocalDataSource.fetchSearchedBooks();
      if (books.isNotEmpty) {
        return Right(books);
      } */
      books =
          await searchRemoteDataSource.fetchSearchedBooks(booksName: booksName);
      return Right(books);
    } on DioException catch (e) {
      return Left(
        ServerFailure.fromDioException(dioException: e),
      );
    } catch (e) {
      log(e.toString());
      return Left(
        ServerFailure(
          errMessage: 'Oops there was an error, please try later!',
        ),
      );
    }
  }
}
