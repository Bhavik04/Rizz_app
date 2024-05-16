import 'package:flutter/material.dart';
import 'package:rizz/common/utils.dart';


class SplashScreen extends StatefulWidget {
  static const routeName = 'SplashScreen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('F33C5E'),
        body: Container(
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              stops: const [0.1, 0.3, 0.9],
              colors: [
                HexColor('F33C5E'),
                HexColor('F85D3E'),
                HexColor('FF8A41'),
              ],
            ),
          ),
          child: Center(
            child: Image.asset(
              'assets/images/splash.png',
            ),
          ),
        ),
      ),
    );
  }
}
