import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';

class BestSellerItemsListView extends StatelessWidget {
  const BestSellerItemsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(left: 30, right: 50, bottom: 20),
          child: BestSellerItem(),
        );
      },
      itemCount: 20,
    );
  }
}
