import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_items_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_items_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          BookItemsListView(),
          Padding(
            padding: EdgeInsets.only(top: 49, left: 30, bottom: 20),
            child: Text(
              'Best Seller',
            ),
          ),
          Expanded(child: BestSellerItemsListView()),
        ],
      ),
    );
  }
}

