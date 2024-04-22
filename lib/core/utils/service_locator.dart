import 'package:bookly_app/features/home/data/data_sources/local/home_details_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_sources/local/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_sources/remote/home_details_remote_data_source.dart';
import 'package:bookly_app/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:bookly_app/features/home/data/repos/home_details_repo_impl.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_free_books_use_case.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:bookly_app/features/search/data/data_sources/search_local_data_source.dart';
import 'package:bookly_app/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:bookly_app/features/search/data/repos/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
      homeLocalDataSource: HomeLocalDataSourceImpl(),
    ),
  );

  getIt.registerSingleton<FetchFeaturedBooksUseCase>(
    FetchFeaturedBooksUseCase(
      getIt.get<HomeRepoImpl>(),
    ),
  );
  getIt.registerSingleton<FetchFreeBooksUseCase>(
    FetchFreeBooksUseCase(
      getIt.get<HomeRepoImpl>(),
    ),
  );
  getIt.registerSingleton<FetchSimilarBooksUseCase>(
    FetchSimilarBooksUseCase(
      HomeDetailsRepoImpl(
        homeDetailsRemoteDataSource: HomeDetailsRemoteDataSourceImpl(
          getIt.get<ApiService>(),
        ),
        homeDetailsLocalDataSource: HomeDetailsLocalDataSourceImpl(),
      ),
    ),
  );

  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      searchRemoteDataSource: SearchRemoteDataSource(
        getIt.get<ApiService>(),
      ),
      searchLocalDataSource: SearchLocalDataSource(),
    ),
  );
}
