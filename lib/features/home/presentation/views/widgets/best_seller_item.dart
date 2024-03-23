import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_rating.dart';
import 'package:flutter/material.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 70,
          ),
          child: AspectRatio(
            aspectRatio: 70 / 105,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                AssetsImg.test,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Harry Potter and the Goblet of Fire',
                maxLines: 2,
              ),
              SizedBox(
                height: 2,
              ),
              Text('J.K. Rowling'),
              Row(
                children: [
                  Text('19.99 €'),
                  Spacer(),
                  CustomRating(),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
