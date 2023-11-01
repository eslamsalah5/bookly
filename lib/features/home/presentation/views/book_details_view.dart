import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repos_impl.dart';
import 'package:bookly/features/home/presentation/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  final BookModel bookModel;
  const BookDetailsView({Key? key, required this.bookModel}) : super(key: key);

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  late SimilarBooksCubit _similarBooksCubit;

  @override
  void initState() {
    super.initState();
    _similarBooksCubit = SimilarBooksCubit(getIt.get<HomeReposImpl>());

    // Check if categories list is not null and not empty
    if (widget.bookModel.volumeInfo?.categories != null &&
        widget.bookModel.volumeInfo!.categories!.isNotEmpty) {
      _similarBooksCubit.fetctSimilarBooks(
          category: widget.bookModel.volumeInfo!.categories![0],q: widget.bookModel.volumeInfo!.title);
    }
  }

  @override
  void dispose() {
    _similarBooksCubit.close(); // Close the cubit to free up resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SimilarBooksCubit>.value(
      value: _similarBooksCubit, // Provide the existing cubit instance
      child: Scaffold(
        body: BookDetailsViewBody(bookModel: widget.bookModel),
      ),
    );
  }
}
