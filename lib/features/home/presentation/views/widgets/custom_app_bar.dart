import 'package:bookly/core/utils/assets_name.dart';
import 'package:bookly/core/widgets/navigat.dart';
import 'package:bookly/features/search/presentation/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 44, bottom: 30),
      child: Row(
        children: [
          Image.asset(
            Assets.imagesLogo,
            height: 18,
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              navTo(context, SearchView());
            },
            icon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 25,
            ),
          )
        ],
      ),
    );
  }
}
