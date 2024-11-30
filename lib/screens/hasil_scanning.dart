import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:google_fonts/google_fonts.dart';

// Definisikan kelas DatasetInfo di luar kelas HasilScanScreen
class DatasetInfo {
  final String name;
  final String solusi_1;

  DatasetInfo({
    required this.name,
    required this.solusi_1,
  });
}

// Tempatkan list dataset di luar kelas HasilScanScreen
final List<DatasetInfo> dataset = [
  DatasetInfo(
    name: "Bercak Daun",
    solusi_1:
        "Cara Pengendalian dari penyakit ini ada beberapa cara yaitu dengan memetik dan membakar daun yang terinfeksi dan penyemprotan tanaman dengan menggunakan fungisida (mankozeb, oksiklorida tembaga atau benomyl)",
  ),
  DatasetInfo(
    name: "Bercak Merah",
    solusi_1:
        "Cara Pengendalian dari penyakit ini yaitu dengan melakukan pengendalian vektor dengan menggunakan jaring atau insektisida, pemusnahan tanaman inang liar dan gulma untuk mengurangi sumber penyakit, perlakuan air panas untuk bahan stek (20 menit pada suhu 50°C atau 180 menit pada suhu 45°C), dan pemangkasan cabang sakit atau keseluruhan tanaman untuk membuang sumber penyakit",
  ),
  DatasetInfo(
    name: "Embun Tepung Palsu",
    solusi_1:
        "Cara Pengendalian dari penyakit ini yaitu mengurangi kelembapan kebun, melakukan sanitasi kebun dengan memangkas tunas dan buah yang terinfeksi, melindungi tanaman dengan fungisida tembaga atau fungisida organik dan melindungi tanaman dengan atap plastik pada musim hujan",
  ),
  DatasetInfo(
    name: "Hama Tungau Merah",
    solusi_1:
        "Cara Pengendalian dari penyakit ini yaitu dengan melakukan penyemprotan dengan akarisida berbahan aktif abjection (numectin, alfamec, agrimec, demolish atau bamec) dan taburkan Bubur Bordo atau Bubur California pada daun",
  ),
];

class HasilScanScreen extends StatelessWidget {
  final String prediction;
  final bool isLoading;
  final Uint8List? imageData;

  const HasilScanScreen({
    Key? key,
    required this.prediction,
    required this.isLoading,
    this.imageData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mencari dataset yang sesuai dengan prediksi
    DatasetInfo? selectedDataset;
    for (var datasetInfo in dataset) {
      if (datasetInfo.name == prediction) {
        selectedDataset = datasetInfo;
        break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 85, 130, 0),
        ),
        centerTitle: true,
        title: Text(
          'Hasil Deteksi',
          style: TextStyle(
            color: Color.fromARGB(255, 85, 130, 0),
            fontFamily: 'Lexend',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 1),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
                    height: 495,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 25, left: 25),
                          child: isLoading
                              ? CircularProgressIndicator()
                              : imageData != null
                                  ? Image.memory(
                                      imageData!,
                                      width: 300,
                                      height: 300,
                                    )
                                  : SizedBox(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 25, top: 3, bottom: 10),
                          child: Text(
                            'Hasil Prediksi:',
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF5F5F5F),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, bottom: 10),
                          child: Text(
                            prediction,
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF558200),
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFF558200), // Warna hijau
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF), // Warna hijau
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(
                                  10), // Radius 0 untuk sisi kanan bawah
                            ),
                          ),
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, bottom: 15),
                            child: Text(
                              selectedDataset != null
                                  ? selectedDataset!.solusi_1
                                  : 'Daun Sehat, silakan dilanjutkan untuk perawatannya agar hasil yang lebih maksimal',
                              style: GoogleFonts.montserrat(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF558200),
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
