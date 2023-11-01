import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repos.dart';
import 'package:equatable/equatable.dart';

part 'new_book_state.dart';

class NewBookCubit extends Cubit<NewBookState> {
  NewBookCubit(this.homeRepos) : super(NewBookInitial());
   final HomeRepos homeRepos;
  Future<void> fetctNewBooks() async {
    emit(NewBooksLoading());
    var result = await homeRepos.fetctNewBooks();
    result.fold((failure) {
      emit(NewBooksFailure(errorMessage: failure.errorMessage));
    }, (books) {
      emit(NewBooksSuccess(books: books));
    });
  }
}
