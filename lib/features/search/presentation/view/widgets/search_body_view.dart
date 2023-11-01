import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/repos/home_repos_impl.dart';
import 'package:bookly/features/search/presentation/cubits/cubit/search_book_cubit.dart';
import 'package:bookly/features/search/presentation/view/widgets/custom_text_field.dart';
import 'package:bookly/features/search/presentation/view/widgets/search_book_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBodyView extends StatelessWidget {
  const SearchBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBookCubit(getIt.get<HomeReposImpl>()),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              CustomTextField(),
              SizedBox(
                height: 16,
              ),
              Text(
                'Search Result',
                style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: SearchBookListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
