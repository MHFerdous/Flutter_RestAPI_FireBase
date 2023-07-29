import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_application/data/models/auth_utility.dart';
import 'package:mobile_application/ui/screens/auth/login_screen.dart';
import 'package:mobile_application/ui/screens/bottom_nav_base_screen.dart';
import 'package:mobile_application/ui/utils/assets_utils.dart';
import 'package:mobile_application/ui/widgets/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToLogin();
  }

  void navigateToLogin() {
    Future.delayed(
      const Duration(seconds: 3),
    ).then(
      (_) async {
        final bool isLoggedIn = await AuthUtility.checkIfUserLoggedIn();
        if (mounted) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => isLoggedIn
                    ? const BottomNavBaseScreen()
                    : const LoginScreen(),
              ),
              (route) => false);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: Center(
        child: SvgPicture.asset(
          AssetsUtils.logoSVG,
          width: 90,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
