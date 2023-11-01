
import 'package:bookly/core/widgets/build_outline_input_border.dart';
import 'package:bookly/features/search/presentation/cubits/cubit/search_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatelessWidget {
 
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(

      decoration: InputDecoration(
        hintText: "Search",
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Opacity(
            opacity: .7,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
        border: buildOutlineInputBorder(),
        enabled: true,
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
      onSubmitted: (q) {
        var searchCubit = BlocProvider.of<SearchBookCubit>(context);
                searchCubit.fetctSearchBooks(q: q);
      },
    );
  }
}
