import 'package:bookly_app/core/entities/book_entity.dart';

String getPrice(BookEntity book) {
  if (book.priceSaleability == 'FOR_SALE') {
    return '${book.price} ${book.priceCurrency}';
  } else if (book.priceSaleability == 'FREE') {
    return 'Free';
  } else if (book.priceSaleability == 'NOT_FOR_SALE') {
    return 'Not for sale';
  }
  return book.priceSaleability ?? '';
}
