import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_application/ui/screens/login_screen.dart';
import 'package:mobile_application/ui/utils/assets_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

void navigateToLogin() {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
      (route) => false);


}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SvgPicture.asset(
              AssetsUtils.backgroundSVG,
              fit: BoxFit.fitHeight,
            ),
          ),
          Center(
            child: SvgPicture.asset(
              AssetsUtils.logoSVG,
              width: 90,
              fit: BoxFit.scaleDown,
            ),
          ),
        ],
      ),
    );
  }
}
