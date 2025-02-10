import 'package:flutter/material.dart';
import '../widgets/fade_scroll_configuration.dart';

class RawatInapPage extends StatefulWidget {
  const RawatInapPage({super.key});

  @override
  State<RawatInapPage> createState() => _RawatInapPageState();
}

class _RawatInapPageState extends State<RawatInapPage> {
  final List<KelasKamar> kelasKamar = [
    KelasKamar(
      nama: 'VIP',
      gambar: ['vip1.jpg', 'vip2.jpg', 'vip3.jpg'],
      fasilitas: [
        'BED PASIEN (ELEKTRIK BED)',
        'BED PENUNGGU',
        'BED SIDE CABINET',
        'KURSI PENUNGGU',
        'SATU SET SOFA',
        'MEJA KERJA',
        'LEMARI PAKAIAN',
        'OVER BED TABLE',
        'KAMAR MANDI DALAM DENGAN AIR PANAS',
        'RUANG BER-AC',
        '1 TV 40 INC',
        'KULKAS',
        'DISPENSER',
        'WIFI',
        'COFFEE AND TEA SETS',
      ],
    ),
    KelasKamar(
      nama: 'KELAS 1',
      gambar: ['kelas1_1.jpg', 'kelas1_2.jpg', 'kelas1_3.jpeg'],
      fasilitas: [
        'BED PASIEN (2 BED PER KAMAR)',
        'BED SIDE CABINET',
        'KURSI PENUNGGU',
        'TV LCD 36 INC',
        'OVER BED TABLE',
        'KAMAR MANDI DALAM DENGAN AIR PANAS',
        'DISPENSER',
        'RUANG BER AC',
      ],
    ),
    KelasKamar(
      nama: 'KELAS 2',
      gambar: ['kelas2_1.jpg', 'kelas2_2.jpg', 'kelas2_3.jpg'],
      fasilitas: [
        'BED PASIEN (3 BED PER KAMAR)',
        'BED SIDE CABINET',
        'KURSI PENUNGGU',
        'OVER BED TABLE',
        'KAMAR MANDI DALAM DENGAN AIR PANAS',
        'RUANG BER AC',
      ],
    ),
    KelasKamar(
      nama: 'KELAS 3',
      gambar: ['kelas3_1.jpg', 'kelas3_2.jpg', 'kelas3_3.jpg'],
      fasilitas: [
        'BED PASIEN (6 BED PER KAMAR)',
        'BED SIDE CABINET',
        'KURSI PENUNGGU',
        'OVER BED TABLE',
        '2 KAMAR MANDI DALAM',
        'KIPAS ANGIN',
      ],
    ),
  ];

  // Tambahkan Map untuk menyimpan PageController untuk setiap kelas kamar
  final Map<String, PageController> _pageControllers = {};

  @override
  void initState() {
    super.initState();
    // Inisialisasi PageController untuk setiap kelas kamar
    for (var kamar in kelasKamar) {
      _pageControllers[kamar.nama] = PageController();
    }
  }

  @override
  void dispose() {
    // Bersihkan PageController saat widget di dispose
    for (var controller in _pageControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rawat Inap'),
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
        child: ScrollConfiguration(
          behavior: FadeScrollBehavior(),
          child: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: kelasKamar.length,
            itemBuilder: (context, index) {
              return FadeInScrollItem(
                duration: Duration(milliseconds: 400 + (index * 100)),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.hotel,
                                color: Colors.blue,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              kelasKamar[index].nama,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 200,
                            child: PageView.builder(
                              controller:
                                  _pageControllers[kelasKamar[index].nama],
                              itemCount: kelasKamar[index].gambar.length,
                              itemBuilder: (context, imageIndex) {
                                return Image.asset(
                                  'assets/images/${kelasKamar[index].gambar[imageIndex]}',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                );
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 8),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    _pageControllers[kelasKamar[index].nama]
                                        ?.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    _pageControllers[kelasKamar[index].nama]
                                        ?.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.amber),
                                const SizedBox(width: 8),
                                Text(
                                  'Fasilitas Kamar',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            ...kelasKamar[index].fasilitas.map(
                                  (fasilitas) => Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      children: [
                                        Icon(Icons.check_circle,
                                            color: Colors.green[400], size: 20),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            fasilitas,
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class KelasKamar {
  final String nama;
  final List<String> gambar;
  final List<String> fasilitas;

  KelasKamar({
    required this.nama,
    required this.gambar,
    required this.fasilitas,
  });
}
