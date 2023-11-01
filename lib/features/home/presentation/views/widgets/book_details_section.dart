import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_botton.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_book.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * .27,
            child: FeaturedBook(
              imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ?? "",
            )),
        SizedBox(
          height: 30,
        ),
        Text(
          bookModel.volumeInfo!.title!,
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 6.0, bottom: 16),
          child: Text(
            bookModel.volumeInfo?.authors?[0] ?? "",
            style: Styles.textStyle18.copyWith(
              color: Colors.white.withOpacity(.7),
            ),
          ),
        ),
        BookRating(
          bookRate: bookModel.volumeInfo?.averageRating ?? 0,
          bookReview: bookModel.volumeInfo?.ratingsCount ?? 0,
        ),
        SizedBox(
          height: 37,
        ),
        CustomBotton(bookModel: bookModel,),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
