import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class SimilarBookSection extends StatelessWidget {
  const SimilarBookSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 16,
        ),
        SimilarBooksListView(
          bookModel: bookModel,
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
