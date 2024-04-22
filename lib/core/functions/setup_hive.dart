import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/utils/constant.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> setupHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kFreeBox);
  await Hive.openBox<BookEntity>(kSimilarBox);
  await Hive.openBox<BookEntity>(kSearchBox);
}
