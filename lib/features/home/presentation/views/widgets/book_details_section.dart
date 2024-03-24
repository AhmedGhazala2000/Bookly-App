import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/buttons_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_rating.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 162,
          ),
          child: const BookItem(),
        ),
        const SizedBox(height: 40),
        Text(
          'The Jungle Book',
          style: Styles.styleRegular20
              .copyWith(fontSize: 30, fontFamily: 'GT Sectra Fine'),
        ),
        const SizedBox(height: 4),
        Opacity(
          opacity: .7,
          child: Text(
            'Rudyard Kipling',
            style: Styles.styleMedium14.copyWith(fontSize: 18),
          ),
        ),
        const SizedBox(height: 14),
        const CustomRating(),
        const SizedBox(height: 37),
        const ButtonsAction()
      ],
    );
  }
}

