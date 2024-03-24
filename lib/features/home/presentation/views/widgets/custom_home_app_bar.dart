import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 50, top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AssetsImg.logo,
            height: 17,
          ),
          IconButton(
            onPressed: () {
              Get.to(
                () => const SearchView(),
                transition: Transition.fadeIn,
                duration: kTransitionDuration,
              );
            },
            icon: const Icon(FontAwesomeIcons.magnifyingGlass),
          ),
        ],
      ),
    );
  }
}
