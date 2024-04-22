import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_featured_builder.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/free_books_builder.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(child: CustomHomeAppBar()),
        const SliverToBoxAdapter(child: BookFeaturedBuilder()),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 30, bottom: 20),
            child: Text(
              'Free Books',
              style: Styles.styleSemiBold18(context),
            ),
          ),
        ),
        const FreeBooksBuilder(),
      ],
    );
  }
}
