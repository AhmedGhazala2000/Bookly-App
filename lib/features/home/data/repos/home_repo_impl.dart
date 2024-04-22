import 'dart:developer';

import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/data_sources/local/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRemoteDataSource homeRemoteDataSource;
  HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});

  @override
  Future<Either<Failures, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchFeaturedBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchFeaturedBooks();
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

  @override
  Future<Either<Failures, List<BookEntity>>> fetchFreeBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchFreeBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchFreeBooks();
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
