import 'package:bookly/core/errors/Failure.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepos {
  Future<Either<Failures, List<BookModel>>> fetctNewBooks();
  Future<Either<Failures, List<BookModel>>> fetctFeaturedBooks();
  Future<Either<Failures, List<BookModel>>> fetctSimilarBooks(
      {required String category,required String q});
  Future<Either<Failures, List<BookModel>>> fetctSearchBooks(
      {required String q});
}
