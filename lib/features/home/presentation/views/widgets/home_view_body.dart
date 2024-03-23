import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_items_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_items_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: CustomAppBar()),
          SliverToBoxAdapter(child: BookItemsListView()),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 50, left: 30, bottom: 20),
              child: Text(
                'Best Seller',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat'
                ),
              ),
            ),
          ),
          BestSellerItemsListView(),
        ],
      ),
    );
  }
}
