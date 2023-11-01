import 'package:bookly/core/widgets/custom_circular_progress_indicator.dart';
import 'package:bookly/core/widgets/error_view.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/cubits/new_book_cubit/new_book_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/new_book_item.dart';
import 'package:bookly/features/search/presentation/cubits/cubit/search_book_cubit.dart';
import 'package:bookly/features/search/presentation/cubits/cubit/search_book_state.dart';
import 'package:bookly/features/search/presentation/view/widgets/no_search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBookListView extends StatelessWidget {
  const SearchBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBookCubit, SearchBookState>(
      builder: (context, state) {
        if (state is SearchBooksInitial) {
          return NOSearchView();
        } else
        if (state is SearchBooksSuccess) {
          return ListView.builder(
            itemBuilder: (context, index) => NewBookItem(
              bookModel: state.books[index],
            ),
            itemCount: state.books.length,
          );
        } else if (state is SearchBooksFailure) {
          
          return ErrorView(errorMessage: state.errorMessage);
        } else {
          return CustomCircularProgressIndicator();
        }
      },
    );
  }
}
