import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repos.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepos) : super(FeaturedBooksInitial());
  final HomeRepos homeRepos;
  Future<void> fetctFeaturedBook() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepos.fetctFeaturedBooks();
    result.fold((failure) {
      emit(FeaturedBooksFailure(errorMessage: failure.errorMessage));
    }, (books) {
      emit(FeaturedBooksSuccess(books: books));
    });
  }
}
