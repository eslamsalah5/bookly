import 'package:bookly/core/widgets/custom_circular_progress_indicator.dart';
import 'package:bookly/core/widgets/error_view.dart';
import 'package:bookly/core/widgets/navigat.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
      if (state is SimilarBooksSuccess) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .15,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsetsDirectional.only(end: 16.0),
              child: InkWell(
                onTap: () {
                  navTo(context, BookDetailsView(bookModel: state.books[index]));
                },
                child: FeaturedBook(
                    imageUrl:
                        state.books[index].volumeInfo?.imageLinks?.thumbnail ??
                            ''),
              ),
            ),
            itemCount: state.books.length,
          ),
        );
      } else if (state is SimilarBooksFailure) {
        return ErrorView(errorMessage: state.errorMessage);
      } else {
        return CustomCircularProgressIndicator();
      }
    });
  }
}
