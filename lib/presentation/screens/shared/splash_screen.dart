import 'dart:async';
import 'package:faculty_project/constants/screens.dart';
import 'package:faculty_project/generated/assets.dart';
import 'package:flutter/material.dart';
import '../../../data/local/cache_helper.dart';
import '../../styles/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timer = Timer(
      const Duration(
        seconds: 1,
      ),
      () => Navigator.pushNamedAndRemoveUntil(
          context, Screens.loginScreen, (route) => false),
    );
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                Assets.imagesHomeImage,
              ),
              fit: BoxFit.fill,
            ),
          ),
          child:  Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.315,
              width: MediaQuery.of(context).size.width * 0.715,
              decoration: BoxDecoration(
                color: AppColor.grey.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: const Center(
                child: Text(
                  'HUCI\n App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 80.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
