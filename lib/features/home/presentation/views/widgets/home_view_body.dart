import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_featured_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: CustomHomeAppBar()),
        SliverToBoxAdapter(child: BookFeaturedListView()),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 50, left: 30, bottom: 20),
            child: Text(
              'Newest Books',
              style: Styles.styleSemiBold18,
            ),
          ),
        ),
        NewestBooksListView(),
      ],
    );
  }
}
