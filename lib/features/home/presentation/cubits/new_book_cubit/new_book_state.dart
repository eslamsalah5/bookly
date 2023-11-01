part of 'new_book_cubit.dart';

sealed class NewBookState extends Equatable {
  const NewBookState();

  @override
  List<Object> get props => [];
}

final class NewBookInitial extends NewBookState {}
final class NewBooksLoading extends NewBookState {}

final class NewBooksFailure extends NewBookState {
  final String errorMessage;

 const NewBooksFailure({required this.errorMessage});
}

final class NewBooksSuccess extends NewBookState {
  final List<BookModel>books;

const  NewBooksSuccess({required this.books});
}
