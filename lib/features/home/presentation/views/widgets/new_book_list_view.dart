import 'package:bookly/core/widgets/custom_circular_progress_indicator.dart';
import 'package:bookly/core/widgets/error_view.dart';
import 'package:bookly/features/home/presentation/cubits/new_book_cubit/new_book_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/new_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewBooksListView extends StatelessWidget {
  const NewBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewBookCubit, NewBookState>(
      builder: (context, state) {
        if (state is NewBooksSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => NewBookItem(
              bookModel: state.books[index],
            ),
            itemCount: state.books.length,
          );
        } else if (state is NewBooksFailure) {
          return ErrorView(errorMessage: state.errorMessage);
        } else {
          return CustomCircularProgressIndicator();
        }
      },
    );
  }
}
