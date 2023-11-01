
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

sealed class SearchBookState extends Equatable {
  const SearchBookState();

  @override
  List<Object> get props => [];
}

final class SearchBooksInitial extends SearchBookState {}

final class SearchBooksLoading extends SearchBookState {}

final class SearchBooksFailure extends SearchBookState {
  final String errorMessage;

  SearchBooksFailure({required this.errorMessage});
}

final class SearchBooksSuccess extends SearchBookState {
  final List<BookModel>books;

  SearchBooksSuccess({required this.books});
}
