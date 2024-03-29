import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/models/book_model/item.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failures, List<BookItem>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?q=programming&maxResults=40&filter=free-ebooks',
      );
      var books = BookModel.fromJson(data).items!;
      return Right(books);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(dioException: e));
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookItem>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?q=programming&filter=free-ebooks&maxResults=40&orderBy=newest',
      );
      var books = BookModel.fromJson(data).items!;
      return Right(books);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(dioException: e));
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookItem>>> fetchSimilarBooks({required String category}) async{
    try {
      var data = await apiService.get(
        endPoint:
        'volumes?filter=free-ebooks&maxResults=40&orderBy=relevance&q=$category',
      );
      var books = BookModel.fromJson(data).items!;
      return Right(books);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(dioException: e));
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
