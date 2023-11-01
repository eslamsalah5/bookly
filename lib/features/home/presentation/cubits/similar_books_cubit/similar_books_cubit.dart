import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repos.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepos) : super(SimilarBooksInitial());
   final HomeRepos homeRepos;
  Future<void> fetctSimilarBooks({required String category,required String q}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepos.fetctSimilarBooks(category: category,q: q);
    result.fold((failure) {
      emit(SimilarBooksFailure(errorMessage: failure.errorMessage));
    }, (books) {
      emit(SimilarBooksSuccess(books: books));
    });
  }
}
