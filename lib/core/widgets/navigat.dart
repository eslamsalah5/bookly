import 'package:flutter/material.dart';

void navTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

void navToAndReplace(context, widget) => Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));
