import 'package:flutter/material.dart';

class BookDetailsCustomAppBar extends StatelessWidget {
  const BookDetailsCustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 30, bottom: 20),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                size: 25,
              )),
          Spacer(),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined))
        ],
      ),
    );
  }
}
