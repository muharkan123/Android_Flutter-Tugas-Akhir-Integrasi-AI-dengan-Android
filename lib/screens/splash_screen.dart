import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitis1/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      ));
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Color(0xFFF4FDFF),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly, // Updated to spaceEvenly
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/vitis_icon.png', // Replace with the path to your PNG image
                    width: 350, // Set the desired width
                    height: 350, // Set the desired height
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    'from',
                    style: GoogleFonts.lexend(
                      fontSize: 12,
                      color: Color(0xFF6C6C6C),
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    'arkanfznw',
                    style: GoogleFonts.lexend(
                      fontSize: 12,
                      color: Color.fromARGB(255, 58, 135, 0),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
