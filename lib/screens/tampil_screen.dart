import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:vitis1/screens/hasil_scanning.dart';

class TampilScreen extends StatefulWidget {
  final String imagePath;
  final String baseUrl;

  const TampilScreen({Key? key, required this.imagePath, required this.baseUrl})
      : super(key: key);

  @override
  _TampilScreenState createState() => _TampilScreenState();
}

class _TampilScreenState extends State<TampilScreen> {
  bool isLoading = true;
  Uint8List? imageData;
  String prediction = '';

  @override
  void initState() {
    super.initState();
    // Panggil fungsi untuk memuat gambar setelah widget diinisialisasi
    _loadImage(widget.imagePath);
  }

  Future<void> _loadImage(String imagePath) async {
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse('${widget.baseUrl}/zoom'));

      request.files.add(await http.MultipartFile.fromPath('image', imagePath));

      var response = await request.send();

      if (response.statusCode == 200) {
        final responseBytes = await response.stream.toBytes();

        // Set state untuk menampilkan gambar
        setState(() {
          imageData = responseBytes;
          // isLoading = false;
        });

        // Lakukan prediksi setelah gambar di-zoom
        _predictImage(responseBytes);
      } else {
        throw Exception('Gagal memuat gambar: ${response.statusCode}');
      }
    } catch (e) {
      print('Error saat memuat gambar: $e');
    }
  }

  Future<void> _predictImage(Uint8List imageBytes) async {
    try {
      var predictRequest =
          http.MultipartRequest('POST', Uri.parse('${widget.baseUrl}/predict'));
      predictRequest.files.add(http.MultipartFile.fromBytes(
        'image',
        imageBytes,
        filename: 'image.jpg',
      ));

      var predictResponse = await predictRequest.send();

      if (predictResponse.statusCode == 200) {
        final predictionData = await predictResponse.stream.bytesToString();
        setState(() {
          prediction = predictionData;
          isLoading = false;
        });
      } else {
        throw Exception(
            'Gagal melakukan prediksi: ${predictResponse.statusCode}');
      }
    } catch (e) {
      print('Error saat melakukan prediksi: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50), // Mengatur tinggi AppBar
        child: AppBar(
          iconTheme: IconThemeData(
            color: Color.fromARGB(255, 85, 130, 0), // Ubah warna icon burger
          ),
          centerTitle: true,
          title: Text(
            'Scanning',
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
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 300,
                  height: 451,
                  padding: EdgeInsets.all(10),
                  child: isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Image.memory(
                          imageData!,
                          width: 400,
                          height: 400,
                        ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
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
                          text: 'Scanning',
                          style: TextStyle(
                            color: Color.fromARGB(255, 84, 129, 0),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text:
                              ' untuk memulai pendeteksian penyakit melalui gambar daun anggur',
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
              SizedBox(height: 15),
              Center(
                child: Container(
                  width: 280,
                  height: 43,
                  child: ElevatedButton(
                    onPressed: () {
                      // Ganti HasilScanScreen dengan nama kelas yang benar jika perlu
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HasilScanScreen(
                            prediction: prediction,
                            isLoading: isLoading,
                            imageData: imageData,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 85, 130, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: Text(
                      'Scanning',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
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
