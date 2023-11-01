import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/navigat.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_book.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class NewBookItem extends StatelessWidget {
  final BookModel bookModel;

  const NewBookItem({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 20.0),
      child: InkWell(
        onTap: () => navTo(context, BookDetailsView(bookModel: bookModel,)),
        child: Row(
          children: [
            SizedBox(
              height: 100,
              child: FeaturedBook(
                  imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ?? ''),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .55,
                    child: Text(
                      bookModel.volumeInfo?.title ?? '',
                      style: Styles.textStyle20
                          .copyWith(fontFamily: kGtSectraFine),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.symmetric(vertical: 4.0),
                    child: Text(
                      bookModel.volumeInfo?.authors?[0] ?? '',
                      style: Styles.textStyle14.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(.7),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text("Free",
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold)),
                      Spacer(),
                      BookRating(
                        bookRate: bookModel.volumeInfo?.averageRating ?? 0,
                        bookReview: bookModel.volumeInfo?.ratingsCount ?? 0,
                      ),
                      Spacer(),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
