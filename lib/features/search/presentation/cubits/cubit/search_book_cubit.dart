import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/repos/home_repos.dart';
import 'package:bookly/features/search/presentation/cubits/cubit/search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  SearchBookCubit(this.homeRepos) : super(SearchBooksInitial());
   final HomeRepos homeRepos;
  Future<void> fetctSearchBooks({required String q}) async {
    emit(SearchBooksLoading());
    var result = await homeRepos.fetctSearchBooks(q: q);
    result.fold((failure) {
      emit(SearchBooksFailure(errorMessage: failure.errorMessage));
    }, (books) {
      emit(SearchBooksSuccess(books: books));
    });
  }
}
