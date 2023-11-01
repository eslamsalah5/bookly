import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/new_book_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_book_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 30.0),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                FeaturedBookListView(),
                SizedBox(
                  height: 50,
                ),
                Text("Newest Book", style: Styles.textStyle18),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              NewBooksListView(),
            ]),
          ),
        ],
      ),
    );
  }
}