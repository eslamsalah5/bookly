import 'package:bookly/core/utils/assets_name.dart';
import 'package:bookly/core/widgets/navigat.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    navToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(Assets.imagesLogo));
  }

  void navToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      navToAndReplace(context, const HomeView());
    });
  }
}
