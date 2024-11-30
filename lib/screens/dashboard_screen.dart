import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitis1/screens/aboutus_screen.dart';
import 'package:vitis1/screens/howtouse_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vitis1/screens/informasi_screen.dart';
import 'package:vitis1/screens/tampil_screen.dart';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  final String baseUrl = 'http://ftib.ittsby.id:55355';

  Future<void> zoomImage(BuildContext context, File imageFile) async {
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/zoom'));
    request.files
        .add(await http.MultipartFile.fromPath('image', imageFile.path));

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var imageData = await response.stream.toBytes();
        // Proses respons gambar yang di-zoom
        // Tidak perlu mengembalikan nilai karena tipe kembalian adalah Future<void>
        // Navigasi ke layar TampilScreen setelah gambar di-zoom
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TampilScreen(
              imagePath: imageFile.path,
              baseUrl: baseUrl,
            ),
          ),
        );
      } else {
        // Tangani error saat respons tidak berhasil
        print('Gagal mendapatkan gambar. Status kode: ${response.statusCode}');
        // Misalnya, tampilkan pesan kesalahan kepada pengguna
      }
    } catch (e) {
      // Tangani error jaringan
      print('Error jaringan: $e');
      // Misalnya, tampilkan pesan kesalahan jaringan kepada pengguna
    }
  }

  Future<void> _showImageSourceDialog(BuildContext context) async {
    final pickedImage = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              "Pilih Sumber Gambar",
              style: TextStyle(
                color: Color.fromARGB(255, 85, 130, 0),
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          content: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        Navigator.pop(
                            context, await _takePicture(ImageSource.camera));
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 85, 130, 0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/kamera.png',
                              width: 35,
                              height: 35,
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Kamera",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        String imagePath =
                            await _takePicture(ImageSource.gallery);
                        // Memanggil fungsi zoomImage setelah gambar dipilih
                        zoomImage(context, File(imagePath));
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 85, 130, 0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/galeri.png',
                              width: 35,
                              height: 35,
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Galeri",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.w600,
                              ),
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
    );

    if (pickedImage != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              TampilScreen(imagePath: pickedImage, baseUrl: baseUrl),
        ),
      );
    }
  }

  Future<String> _takePicture(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: source);

    if (pickedImage != null) {
      return pickedImage.path;
    }
    return ''; // Return empty string if no image is picked
  }

  @override
  Widget build(BuildContext context) {
    final Color iconAndTextColor = Color.fromARGB(255, 85, 130, 0);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50), // Mengatur tinggi AppBar
        child: AppBar(
          iconTheme: IconThemeData(
            color: Color.fromARGB(255, 85, 130, 0), // Ubah warna icon burger
          ),
          centerTitle: true,
          title: Text(
            'Dashboard',
            style: TextStyle(
              color:
                  Color.fromARGB(255, 85, 130, 0), // Mengatur warna teks AppBar
              fontFamily: 'Lexend', // Mengatur jenis font
              fontWeight: FontWeight.w600, // Mengatur ketebalan font
              fontSize: 18, // Mengatur ukuran font
            ),
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
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // Menempatkan Column di tengah pada sumbu Y
            children: [
              Card(
                elevation: 5, // Mengatur elevasi shadow
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Mengatur border radius
                  side: BorderSide(
                      color: Colors.black, width: 1), // Mengatur border
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        10), // Ubah nilai sesuai kebutuhan
                    border: Border.all(
                        color: Colors.black, width: 1), // Atur border
                  ),
                  width: 300,
                  height: 451,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/dash-logo.png',
                        // width: 400,
                        // height: 400,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Masukkan Foto',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight:
                              FontWeight.w600, // atau FontWeight.semibold
                          decoration: TextDecoration.underline,
                          color: Color(0xFF558200),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          'Silakan masukkan gambar daun tanaman yang ingin di deteksi',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF727272),
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                          text: 'Masukkan Foto',
                          style: TextStyle(
                              color: Color.fromARGB(255, 84, 129, 0),
                              fontWeight: FontWeight.bold,
                              decoration:
                                  TextDecoration.underline // Ketebalan teks
                              ),
                        ),
                        TextSpan(
                          text:
                              ' untuk memulai menginputkan gambar daun anggur',
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
              Center(
                child: Container(
                  width: 280,
                  height: 43,
                  child: ElevatedButton(
                    onPressed: () {
                      _showImageSourceDialog(
                          context); // Panggil method untuk mengambil foto
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(
                          255, 85, 130, 0), // Background color of button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // No rounded corners
                      ),
                    ),
                    child: Text(
                      'Masukkan Foto',
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
                height: 10,
              ),
              Center(
                child: Container(
                  width: 280,
                  height: 43,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          Color.fromARGB(255, 85, 130, 0), // Green border color
                      width: 1, // Border width
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InformasiScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // White button background color
                      elevation: 0, // No shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // No rounded corners
                      ),
                    ),
                    child: Text(
                      'Informasi Data',
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
            ],
          ),
        ),
      ),
    );
  }
}
