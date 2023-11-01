import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/repos/home_repos_impl.dart';
import 'package:bookly/features/home/presentation/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/cubits/new_book_cubit/new_book_cubit.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(getIt.get<HomeReposImpl>())
            ..fetctFeaturedBook(),
        ),
        BlocProvider(
          create: (context) => NewBookCubit(getIt.get<HomeReposImpl>())..fetctNewBooks(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          useMaterial3: true,
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        home: const SplashView(),
      ),
    );
  }
}
