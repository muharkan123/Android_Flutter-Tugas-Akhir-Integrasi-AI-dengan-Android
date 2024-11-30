import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitis1/screens/dashboard_screen.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4FDFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100, right: 30, left: 30),
            child: Text(
              'Selamat Datang',
              style: GoogleFonts.lexend(
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: Color.fromARGB(255, 84, 129, 0),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 30, right: 30), // Padding kiri ditambahkan di sini
            child: RichText(
              text: TextSpan(
                text: 'Vitis',
                style: TextStyle(
                  color: Color.fromARGB(255, 84, 129, 0),
                  fontWeight: FontWeight.bold, // Ketebalan teks
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'AI',
                    style: TextStyle(
                      color: Color.fromARGB(255, 84, 129, 0),
                      fontWeight: FontWeight.bold, // Ketebalan teks
                    ),
                  ),
                  TextSpan(
                    text:
                        ' memudahkan anda dalam melakukan identifikasi penyakit pada tanaman anggur dengan menggunakan citra digital daun anggur',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color.fromARGB(255, 58, 58, 58),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Image.asset(
              'assets/images/Logo-Dash.png', // Replace with the path to your PNG image
              width: 400, // Set the desired width
              height: 400, // Set the desired height
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: RichText(
                text: TextSpan(
                  text: 'Silakan klik',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    color: Color.fromARGB(255, 58, 58, 58),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Get Started',
                      style: TextStyle(
                          color: Color.fromARGB(255, 84, 129, 0),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline // Ketebalan teks
                          ),
                    ),
                    TextSpan(
                      text: ' untuk memulai',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                        color: Color.fromARGB(255, 58, 58, 58),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Center(
            child: Container(
              width: 280,
              height: 43,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(
                      255, 85, 130, 0), // Background color of button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // No rounded corners
                  ),
                ),
                child: Text(
                  'Get Started',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Center(
            child: Container(
              width: 280,
              height: 43,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 85, 130, 0), // Green border color
                  width: 1, // Border width
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Action when button is pressed
                  SystemNavigator.pop();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // White button background color
                  elevation: 0, // No shadow
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // No rounded corners
                  ),
                ),
                child: Text(
                  'Quit',
                  style: GoogleFonts.montserrat(
                    color: Color.fromARGB(255, 85, 130, 0), // Green text color
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
