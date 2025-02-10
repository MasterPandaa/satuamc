import 'package:flutter/material.dart';

class TerapiOzonPage extends StatelessWidget {
  const TerapiOzonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terapi Ozon'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.lightBlueAccent],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.withOpacity(0.1), Colors.white],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSection(
                  'Tentang Terapi Ozon',
                  'Ozon (O3) merupakan molekul yang berada di bumi dan berperan untuk melindungi bumi dari radiasi ultraviolet. Sejak ratusan tahun lalu, ozon telah digunakan terutama untuk membunuh virus dan bakteri pada berbagai aspek kehidupan di Jerman dan saat ini penggunaan ozon semakin luas dalam bidang kesehatan.\n\nBerdasarkan penjelasan dr. Agus Widiyatmoko, Sp.PD., M.Sc (Dokter Spesialis Penyakit Dalam & Direktur Utama RS AMC Muhammadiyah), ozon terbuat dari oksigen murni dengan kadar 99,9%. Oksigen murni ini akan diubah menjadi ozon dengan menggunakan alat khusus untuk kemudian digunakan sebagai terapi alternatif dalam dunia kesehatan. Terapi ozon dapat dilakukan dengan dua metode, yaitu terapi ozon dengan media darah dan dengan media saline (garam fisiologis).',
                  Icons.info_outline,
                ),
                const SizedBox(height: 24),
                _buildSection(
                  'Manfaat Terapi Ozon',
                  '',
                  Icons.check_circle_outline,
                  bulletPoints: const [
                    'Sumber antioksidan yang kuat : Terapi ozon merupakan sumber antioksidan yang sangat kuat (600 x lebih kuat dari vitamin C) yang akan membantu proses detoksifikasi zat toksin dalam tubuh.',
                    'Sebagai anti virus dan anti bakteri : Terapi ozon dapat digunakan sebagai terapi pendukung penanganan berbagai infeksi dalam tubuh',
                    'Mampu memperbaiki proses oksigenasi dalam jaringan tubuh : Dengan terapi ozon, dinding eritrosit akan menjadi lebih lentur.',
                    'Dapat menjadi terapi pendukung pasien dengan penyakit degeneratif (seperti diabetes, hipertensi)',
                    'Dapat menjadi terapi pendamping untuk kemoterapi sehingga efek kemoterapi dapat diminimalisir',
                    'Terapi ozon dapat meningkatkan vitalitas dan kesehatan tubuh',
                  ],
                ),
                const SizedBox(height: 24),
                _buildSection(
                  'Efek Samping Terapi Ozon',
                  'Pada umumnya, efek samping terapi ozon sangat minimal. Pada beberapa kasus yang jarang terjadi, muncul reaksi alergi yang dapat ditangani dengan anti alergi. Kontraindikasi dari terapi ozon yaitu perdarahan, sehingga pasien dengan masalah perdarahan seperti saat menstruasi, pemberian terapi ozon harus ditunda terlebih dahulu.',
                  Icons.warning_amber_outlined,
                ),
                const SizedBox(height: 24),
                _buildSection(
                  'Baik Untuk Semua Golongan Usia',
                  'Terapi ozon, yang merupakan antioksidan kuat, sangat baik diberikan pada berbagai golongan usia. Namun, tetap perlu berkonsultasi dengan dokter terlebih dahulu untuk menentukan frekuensi dan kadar pemberian ozon yang tepat.',
                  Icons.people_outline,
                ),
                const SizedBox(height: 24),
                _buildHospitalInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content, IconData icon,
      {List<String>? bulletPoints}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.blue.shade700),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (content.isNotEmpty)
            Text(
              content,
              style: const TextStyle(fontSize: 15, height: 1.5),
            ),
          if (bulletPoints != null) ...[
            const SizedBox(height: 8),
            ...bulletPoints.map((point) => Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('• ', style: TextStyle(fontSize: 15)),
                      Expanded(
                        child: Text(
                          point,
                          style: const TextStyle(fontSize: 15, height: 1.5),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ],
      ),
    );
  }

  Widget _buildHospitalInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'RS AMC Muhammadiyah',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'RS AMC Muhammadiyah merupakan satu-satunya rumah sakit yang memberikan pelayanan terapi ozon di Daerah Istimewa Yogyakarta sejak beberapa tahun lalu.',
            style: TextStyle(fontSize: 15, height: 1.5),
          ),
          SizedBox(height: 8),
          Text(
            'Alamat: Jalan HOS Cokroaminoto No 17B, Yogyakarta',
            style: TextStyle(fontSize: 15, height: 1.5),
          ),
        ],
      ),
    );
  }
}
