import 'package:bookly/features/search/presentation/view/widgets/search_body_view.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: 
      SearchBodyView(),
    );
  }
}