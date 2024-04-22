import 'dart:developer';

import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/data_sources/local/home_details_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_sources/remote/home_details_remote_data_source.dart';
import 'package:bookly_app/features/home/domain/repos/home_details_repo.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeDetailsRepoImpl implements HomeDetailsRepo {
  HomeDetailsRemoteDataSource homeDetailsRemoteDataSource;
  HomeDetailsLocalDataSource homeDetailsLocalDataSource;

  HomeDetailsRepoImpl(
      {required this.homeDetailsRemoteDataSource,
      required this.homeDetailsLocalDataSource});

  @override
  Future<Either<Failures, List<BookEntity>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      List<BookEntity> books;
      /* books = homeDetailsLocalDataSource.fetchSimilarBooks();
      if (books.isNotEmpty) {
        return right(books);
      } */
      books = await homeDetailsRemoteDataSource.fetchSimilarBooks(
          category: category);
      return right(books);
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
