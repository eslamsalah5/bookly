import 'package:bookly/core/utils/dio_helper.dart';
import 'package:bookly/features/home/data/repos/home_repos_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<DioHelper>(DioHelper(Dio()));
  getIt.registerSingleton<HomeReposImpl>(
    HomeReposImpl(
      getIt.get<DioHelper>(),
    ),
  );
}
