import 'package:bookly_app/constant.dart';
import 'package:bookly_app/features/home/data/models/book_model/item.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class BookImage extends StatelessWidget {
  const BookImage({super.key, required this.book});

  final BookItem book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => BookDetailsView(book: book),
          transition: Transition.fadeIn,
          duration: kTransitionDuration,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: AspectRatio(
          aspectRatio: 1 / 1.5,
          child: CachedNetworkImage(
            imageUrl: book.volumeInfo?.imageLinks?.thumbnail ?? '',
            fit: BoxFit.fill,
            placeholder: (context, url) {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: buildShimmerPlaceholder(),
              );
            },
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }

  Widget buildShimmerPlaceholder() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: AspectRatio(
        aspectRatio: 1 / 1.5,
        child: CachedNetworkImage(
          imageUrl: book.volumeInfo?.imageLinks?.thumbnail ?? '',
          fit: BoxFit.fill,
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
