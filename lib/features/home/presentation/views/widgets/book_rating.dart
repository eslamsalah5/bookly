import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
   final num bookRate;
  final num bookReview;
  const BookRating({
    super.key, required this.bookRate, required this.bookReview,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 20,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 6.3, end: 5),
          child: Text(
            '$bookRate',
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          "($bookReview)",
          style: Styles.textStyle14.copyWith(
           color: Colors.white.withOpacity(.7),
          ),
        ),
      ],
    );
  }
}
