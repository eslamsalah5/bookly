import 'package:bookly/core/errors/Failure.dart';
import 'package:bookly/core/utils/dio_helper.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repos.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeReposImpl implements HomeRepos {
  final DioHelper dioHelper;

  HomeReposImpl(this.dioHelper);
  @override
  Future<Either<Failures, List<BookModel>>> fetctNewBooks() async {
    try {
      var response = await dioHelper.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=economy&Sorting=newest');
      List<BookModel> books = [];
      for (var item in response['items']) {
        books.add(
          BookModel.fromJson(item),
        );
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetctFeaturedBooks() async {
    try {
      var response = await dioHelper.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:programming');
      List<BookModel> books = [];
      for (var item in response['items']) {
        books.add(
          BookModel.fromJson(item),
        );
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetctSimilarBooks(
      {required String category,required String q}) async {
    try {
      var response = await dioHelper.get(
          endPoint:
              'volumes?Filtering=free-ebooks&q=$q&Sorting=relevance');
      List<BookModel> books = [];
      for (var item in response['items']) {
        books.add(
          BookModel.fromJson(item),
        );
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<Either<Failures, List<BookModel>>> fetctSearchBooks(
      {required String q}) async {
    try {
      var response = await dioHelper.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=$q&Sorting=relevance');
      List<BookModel> books = [];
      for (var item in response['items']) {
        try {
          books.add(
            BookModel.fromJson(item),
          );
        } on Exception catch (e) {
          BookModel.fromJson(item);
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
