import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_snack_bar.dart';

Future<void> customLaunchUrl(BuildContext context, String? url) async {
  if (url != null) {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      customSnackBar(context, 'Cannot launch $url');
    }
  }
}