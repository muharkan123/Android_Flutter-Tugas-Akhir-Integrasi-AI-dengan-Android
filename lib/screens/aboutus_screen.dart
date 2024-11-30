import 'package:flutter/material.dart';
import 'package:vitis1/screens/dashboard_screen.dart';
import 'package:vitis1/screens/howtouse_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutusScreen extends StatelessWidget {
  const AboutusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color iconAndTextColor = Color.fromARGB(255, 85, 130, 0);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 85, 130, 0), // Ubah warna icon burger
        ),
        centerTitle: true,
        title: Text(
          'About Me',
          style: TextStyle(
            color:
                Color.fromARGB(255, 85, 130, 0), // Mengatur warna teks AppBar
            fontFamily: 'Lexend', // Mengatur jenis font
            fontWeight: FontWeight.w600, // Mengatur ketebalan font
            fontSize: 18, // Mengatur ukuran font
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/Logo-Dash.png',
                  width: 400,
                  height: 400,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard,
                  color: iconAndTextColor), // Icon untuk Dashboard
              title:
                  Text('Dashboard', style: TextStyle(color: iconAndTextColor)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info,
                  color: iconAndTextColor), // Icon untuk How To Use
              title:
                  Text('How To Use', style: TextStyle(color: iconAndTextColor)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HowtouseScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.people,
                  color: iconAndTextColor), // Icon untuk About Us
              title:
                  Text('About Me', style: TextStyle(color: iconAndTextColor)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutusScreen()),
                );
              },
            ),
            // Tambahkan item lain jika diperlukan
          ],
        ),
      ),
      body: Center(
        child: Card(
          child: Container(
            width: 300,
            height: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/images/fotoku.jpg",
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Text(
                    'Muhammad Arkan Fauzan Wicaksono',
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 16,
                      color: Color(0xFF558200),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.5,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Text(
                    'Mahasiswa yang melakukan studi di jurusan Teknologi Informasi Telkom University. Dengan tugas akhir di bidang Artificial Intelligent dan diterapkan ke Mobile Developer',
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 12,
                      color: Color(0xFF535353),
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.3,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Silakan klik tombol ',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                      color: Color.fromARGB(255, 58, 58, 58),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Kembali ke Dashboard',
                        style: TextStyle(
                            color: Color.fromARGB(255, 84, 129, 0),
                            fontWeight: FontWeight.bold,
                            decoration:
                                TextDecoration.underline // Ketebalan teks
                            ),
                      ),
                      TextSpan(
                        text:
                            ' untuk kembali ke halaman dashboard untuk menginputkan gambar',
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Center(
                child: Container(
                  width: 300,
                  height: 43,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // White button background color
                      elevation: 0, // No shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // No rounded corners
                        side: BorderSide(
                            color: Color.fromARGB(255, 85, 130, 0),
                            width: 1), // Green border
                      ),
                    ),
                    child: Text(
                      'Kembali ke Dashboard',
                      style: GoogleFonts.montserrat(
                        color:
                            Color.fromARGB(255, 85, 130, 0), // Green text color
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
