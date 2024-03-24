import 'package:bookly_app/features/home/presentation/views/widgets/book_details.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(left: 30, right: 50, bottom: 20),
          child: BookDetails(),
        );
      },
      itemCount: 20,
    );
  }
}
