import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitis1/screens/aboutus_screen.dart';
import 'package:vitis1/screens/dashboard_screen.dart';
import 'package:vitis1/screens/howtouse_screen.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

// Buat model data
class DatasetInfo {
  final String name;
  final String solusi_1;

  DatasetInfo({required this.name, required this.solusi_1});
}

final List<DatasetInfo> datasets = [
  DatasetInfo(
    name: "bercak_Daun",
    solusi_1:
        "Cara Pengendalian dari penyakit ini ada beberapa cara yaitu dengan memetik dan membakar daun yang terinfeksi dan penyemprotan tanaman dengan menggunakan fungisida (mankozeb, oksiklorida tembaga atau benomyl)",
  ),
  DatasetInfo(
    name: "bercak_Merah",
    solusi_1:
        "Cara Pengendalian dari penyakit ini yaitu dengan melakukan pengendalian vektor dengan menggunakan jaring atau insektisida, pemusnahan tanaman inang liar dan gulma untuk mengurangi sumber penyakit, perlakuan air panas untuk bahan stek (20 menit pada suhu 50°C atau 180 menit pada suhu 45°C), dan pemangkasan cabang sakit atau keseluruhan tanaman untuk membuang sumber penyakit",
  ),
  DatasetInfo(
    name: "embun_Tepung_Palsu",
    solusi_1:
        "Cara Pengendalian dari penyakit ini yaitu mengurangi kelembapan kebun, melakukan sanitasi kebun dengan memangkas tunas dan buah yang terinfeksi, melindungi tanaman dengan fungisida tembaga atau fungisida organik dan melindungi tanaman dengan atap plastik pada musim hujan",
  ),
  DatasetInfo(
    name: "hama_Tungau",
    solusi_1:
        "Cara Pengendalian dari penyakit ini yaitu dengan melakukan penyemprotan dengan akarisida berbahan aktif abjection (numectin, alfamec, agrimec, demolish atau bamec) dan taburkan Bubur Bordo atau Bubur California pada daun",
  ),
  DatasetInfo(
    name: "daun_Sehat",
    solusi_1:
        "Daun sudah sehat, silakan lanjutkan perawatan agar hasil yang lebih maksimal",
  ),
];

class InformasiScreen extends StatelessWidget {
  const InformasiScreen({Key? key});

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
          'Informasi Data',
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
              leading: Icon(Icons.dashboard, color: iconAndTextColor),
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
              leading: Icon(Icons.info, color: iconAndTextColor),
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
              leading: Icon(Icons.people, color: iconAndTextColor),
              title:
                  Text('About Me', style: TextStyle(color: iconAndTextColor)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutusScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: PageView.builder(
        itemCount: datasets.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 50),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 4,
              child: SizedBox(
                width: 245,
                height: 401,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            child: Container(
                              color: Colors.white, // Background Bagian Atas
                              child: Image.asset(
                                'assets/images/dtst/${datasets[index].name}.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                              height: 8), // Beri jarak antara gambar dan teks
                          Text(
                            datasets[index]
                                .name
                                .replaceAll('_', ' ')
                                .capitalize(), // Ubah teks menjadi judul yang lebih baik
                            style: TextStyle(
                              color: Color(0xFF558200),
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF558200), // Background Bagian Bawah
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Cara Pengendalian :",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                  height:
                                      8), // Jarak antara "Cara Pengendalian :" dengan teks selanjutnya
                              Text(
                                datasets[index].solusi_1,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.0,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        'Geser kesamping kiri atau kanan untuk melihat data apa saja yang terdapat dalam aplikasi ini',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                      color: Color.fromARGB(255, 58, 58, 58),
                    ),
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
