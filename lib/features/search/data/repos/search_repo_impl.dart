import 'dart:developer';

import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/models/book_model/item.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  ApiService apiService;

  SearchRepoImpl({required this.apiService});

  @override
  Future<Either<Failures, List<BookItem>>> fetchSearchedBooks(
      {required String booksName}) async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?filter=free-ebooks&maxResults=40&q=$booksName',
      );
      var books = BookModel.fromJson(data).items!;
      return Right(books);
    } on DioException catch (e) {
      return Left(
        ServerFailure.fromDioException(dioException: e),
      );
    } catch (e) {
      log(e.toString());
      return Left(
        ServerFailure(errMessage: 'Oops there was an error, please try later!'),
      );
    }
  }
}
