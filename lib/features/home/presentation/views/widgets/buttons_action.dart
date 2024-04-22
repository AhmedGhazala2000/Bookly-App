import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/functions/get_price.dart';
import 'package:bookly_app/core/widgets/show_snack_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonsAction extends StatelessWidget {
  const ButtonsAction({Key? key, required this.book}) : super(key: key);
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    String? buyLink = book.buyLink;
    String? previewLink = book.previewLink;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: buyLink != null
          ? Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: getPrice(book),
                    textColor: Colors.black,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                    onPressed: () async {
                      await launchUrl(Uri.parse(buyLink));
                    },
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
                    onPressed: previewLink != null
                        ? () async {
                            await launchUrl(Uri.parse(previewLink));
                          }
                        : null,
                  ),
                ),
              ],
            )
          : CustomButton(
              text: 'Preview',
              width: MediaQuery.sizeOf(context).width,
              backColor: const Color(0xffEF8262),
              borderRadius: BorderRadius.circular(16),
              onPressed: () async {
                previewLink != null
                    ? await launchUrl(Uri.parse(previewLink))
                    : showSnackBar(context, 'Link not found for this book!');
              }
              //buildOnPressed(context,link: previewLink),
              ),
    );
  }
}
