import 'package:bookly_app/core/models/book_model/item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonsAction extends StatelessWidget {
  const ButtonsAction({Key? key, required this.book}) : super(key: key);
  final BookItem book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: getPrice(),
              textColor: Colors.black,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              onPressed: buildOnPressed(link: book.saleInfo?.buyLink),
            ),
          ),
          Expanded(
            child: CustomButton(
              text: 'Preview',
              backColor: const Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              onPressed: buildOnPressed(link: book.volumeInfo?.previewLink),
            ),
          ),
        ],
      ),
    );
  }

  String getPrice() {
    if (book.saleInfo?.saleability == 'FOR_SALE') {
      return '${book.saleInfo?.listPrice?.amount?.round()} ${book.saleInfo?.listPrice?.currencyCode}';
    } else if (book.saleInfo?.saleability == 'FREE') {
      return 'Free';
    } else if (book.saleInfo?.saleability == 'NOT_FOR_SALE') {
      return 'Not for sale';
    }
    return book.saleInfo?.saleability ?? '';
  }

  void Function()? buildOnPressed({required String? link}) {
    if (link != null) {
      return () async {
        await launchUrl(Uri.parse(link));
      };
    }
    return null;
  }
}
