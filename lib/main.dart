import 'package:bookly_app/core/utils/constant.dart';
import 'package:bookly_app/core/functions/setup_hive.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_free_books_use_case.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/free_books_cubit/free_books_cubit.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:bookly_app/core/utils/simple_bloc_observers.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  await setupHive();
  Bloc.observer = SimpleBlocObservers();
  setupServiceLocator();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const BooklyApp(),
    ),
  );
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt.get<FetchFeaturedBooksUseCase>())
                ..getFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              FreeBooksCubit(getIt.get<FetchFreeBooksUseCase>())
                ..getFreeBooks(),
        ),
      ],
      child: GetMaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: kPrimaryColor,
          fontFamily: 'Montserrat',
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
      ),
    );
  }
}
