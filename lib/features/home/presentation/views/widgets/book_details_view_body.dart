import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_custom_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/similar_book_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel,});
 final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      BookDetailsCustomAppBar(),
                      BookDetailsSection(bookModel: bookModel,),
                      SimilarBookSection(bookModel: bookModel,),
                    ],
                  ),
                ),
              ),
            ],
          );
  }
}
