import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/launch_url.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 50,
              child: Center(
                child: Text(
                  '19.99€',
                  style: Styles.textStyle18.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(15),
                  bottomStart: Radius.circular(15),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              customLaunchUrl(context, bookModel.volumeInfo?.previewLink);
            },
            child: Container(
              height: 50,
              child: Center(
                child: Text(
                  getText(bookModel),
                  style:
                      Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xffEF8262),
                borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(15),
                  bottomEnd: Radius.circular(15),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String getText(BookModel bookModel) {
    if(bookModel.volumeInfo?.previewLink == null) {
      return 'not Available';
    } return 'Free Preview';
  }
}
