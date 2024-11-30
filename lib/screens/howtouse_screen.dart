import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitis1/screens/aboutus_screen.dart';
import 'package:vitis1/screens/dashboard_screen.dart';

class HowtouseScreen extends StatelessWidget {
  const HowtouseScreen({super.key});

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
          'How To Use',
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
                color: Color(0xFFFFFFFF),
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
        child: Container(
          width: 370, // Lebar card
          height: 480, // Tinggi card
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cara Penggunaan",
                    style: GoogleFonts.lexendDeca(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF558200),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Masuk kedalam aplikasi lalu dibagian dashboard tekan tombol masukkan foto. Lalu pilih cara input gambar dengan menggunakan kamera atau dari penyimpanan anda. Lalu tekan tombol scanning. Tunggu sampai program selesai melakukan scanning. Setelah selesai akan muncul hasil identifikasi dan deteksi pada daun anggur yang anda masukkan beserta penanganan yang dianjurkan.",
                    style: GoogleFonts.lexendDeca(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF535353)),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
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
