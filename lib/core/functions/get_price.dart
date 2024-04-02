import 'package:bookly_app/core/models/book_model/item.dart';

String getPrice(BookItem book) {
  if (book.saleInfo?.saleability == 'FOR_SALE') {
    return '${book.saleInfo?.listPrice?.amount?.round()} ${book.saleInfo?.listPrice?.currencyCode}';
  } else if (book.saleInfo?.saleability == 'FREE') {
    return 'Free';
  } else if (book.saleInfo?.saleability == 'NOT_FOR_SALE') {
    return 'Not for sale';
  }
  return book.saleInfo?.saleability ?? '';
}
