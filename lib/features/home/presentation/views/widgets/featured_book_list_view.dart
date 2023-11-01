import 'package:bookly/core/widgets/custom_circular_progress_indicator.dart';
import 'package:bookly/core/widgets/error_view.dart';
import 'package:bookly/core/widgets/navigat.dart';
import 'package:bookly/features/home/presentation/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBookListView extends StatelessWidget {
  const FeaturedBookListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsetsDirectional.only(end: 16.0),
                child: InkWell(
                  onTap: () => navTo(
                    context,
                    BookDetailsView(bookModel:  state.books[index],),
                  ),
                  child: FeaturedBook(
                    imageUrl:
                        state.books[index].volumeInfo?.imageLinks?.thumbnail ??
                            " ",
                  ),
                ),
              ),
              itemCount: state.books.length,
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return ErrorView(errorMessage: state.errorMessage);
        } else {
          return CustomCircularProgressIndicator();
        }
      },
    );
  }
}
