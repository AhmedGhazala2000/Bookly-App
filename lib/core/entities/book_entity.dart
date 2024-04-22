import 'package:hive/hive.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String image;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String authorName;
  @HiveField(3)
  final int? price;
  @HiveField(4)
  final String? priceSaleability;
  @HiveField(5)
  final String? priceCurrency;
  @HiveField(6)
  final String? previewLink;
  @HiveField(7)
  final String? buyLink;
  @HiveField(8)
  final num averageRating;
  @HiveField(9)
  final num ratingsCount;
  @HiveField(10)
  final String? category;

  const BookEntity({
    required this.category,
    required this.image,
    required this.title,
    required this.authorName,
    required this.price,
    required this.priceSaleability,
    required this.priceCurrency,
    required this.averageRating,
    required this.ratingsCount,
    required this.previewLink,
    required this.buyLink,
  });
}
