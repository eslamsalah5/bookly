import 'package:flutter/material.dart';

class NOSearchView extends StatelessWidget {
  const NOSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'there is no Books ',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            'searching now 🔍',
            style: TextStyle(
              fontSize: 30,
            ),
          )
        ],
      ),
    );
  }
}
