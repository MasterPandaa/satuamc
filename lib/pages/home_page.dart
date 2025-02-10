import 'package:flutter/material.dart';
import '../widgets/fade_scroll_configuration.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> mainServices = [
      {
        'title': 'Rawat Inap',
        'icon': Icons.local_hospital,
        'color': Colors.blue,
        'route': '/rawat-inap',
      },
      {
        'title': 'Rawat Jalan',
        'icon': Icons.medical_services,
        'color': Colors.green,
        'route': '/rawat-jalan',
        'subServices': [
          {
            'title': 'Klinik Anak',
            'route': '/rawat-jalan/klinik-anak',
          },
          {
            'title': 'Terapi Ozon',
            'route': '/rawat-jalan/terapi-ozon',
          },
          {
            'title': 'Klinik Neurologi (Syaraf)',
            'route': '/rawat-jalan/klinik-neurologi',
          },
          {
            'title': 'Klinik Kulit & Kelamin',
            'route': '/rawat-jalan/klinik-kulit',
          },
          {
            'title': 'Klinik Penyakit Dalam & Jantung',
            'route': '/rawat-jalan/klinik-penyakit-dalam',
          },
          {
            'title': 'Klinik Mata',
            'route': '/rawat-jalan/klinik-mata',
          },
          {
            'title': 'Klinik Bedah',
            'route': '/rawat-jalan/klinik-bedah',
          },
          {
            'title': 'Klinik THT',
            'route': '/rawat-jalan/klinik-tht',
          },
          {
            'title': 'Fisioterapi & Cedera Olahraga',
            'route': '/rawat-jalan/fisioterapi',
          },
          {
            'title': 'Klinik Laktasi',
            'route': '/rawat-jalan/klinik-laktasi',
          },
          {
            'title': 'Klinik Jiwa & Hipnoterapi',
            'route': '/rawat-jalan/klinik-jiwa',
          },
          {
            'title': 'Klinik Kandungan',
            'route': '/rawat-jalan/klinik-kandungan',
          },
          {
            'title': 'Klinik Ortopedi',
            'route': '/rawat-jalan/klinik-ortopedi',
          },
          {
            'title': 'Klinik Radiologi',
            'route': '/rawat-jalan/klinik-radiologi',
          },
        ],
      },
      {
        'title': 'ICU/NICU',
        'icon': Icons.monitor_heart,
        'color': Colors.red,
        'route': '/icu-nicu',
      },
      {
        'title': 'Emergency',
        'icon': Icons.emergency,
        'color': Colors.orange,
        'route': '/emergency',
      },
      {
        'title': 'Layanan Penunjang',
        'icon': Icons.medical_information,
        'color': Colors.purple,
        'route': '/layanan-penunjang',
        'subServices': [
          {
            'title': 'Radiologi',
            'route': '/layanan-penunjang/radiologi',
          },
          {
            'title': 'Fisioterapi & Sport Injury',
            'route': '/layanan-penunjang/fisioterapi',
          },
          {
            'title': 'Laboratorium',
            'route': '/layanan-penunjang/laboratorium',
          },
          {
            'title': 'Hypnotherapy',
            'route': '/layanan-penunjang/hypnotherapy',
          },
          {
            'title': 'Beauty Center',
            'route': '/layanan-penunjang/beauty-center',
          },
          {
            'title': 'Wound Care',
            'route': '/layanan-penunjang/wound-care',
          },
          {
            'title': 'Home Care & Home Service',
            'route': '/layanan-penunjang/home-care',
          },
          {
            'title': 'Instalasi Farmasi',
            'route': '/layanan-penunjang/farmasi',
          },
        ],
      },
      {
        'title': 'Tes Covid-19',
        'icon': Icons.coronavirus,
        'color': Colors.teal,
        'route': '/tes-covid',
      },
    ];

    return Container(
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
              const Text(
                'Selamat Datang di SatuAMC',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Pilih layanan kesehatan yang Anda butuhkan',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.1,
                ),
                itemCount: mainServices.length,
                itemBuilder: (context, index) {
                  final service = mainServices[index];
                  return FadeInScrollItem(
                    duration: Duration(milliseconds: 400 + (index * 100)),
                    child: _buildServiceCard(context, service),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, Map<String, dynamic> service) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: service['color'].withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            if (service['subServices'] != null) {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) => Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Pilih ${service['title']}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Flexible(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: service['subServices'].length,
                          itemBuilder: (context, index) {
                            final subService = service['subServices'][index];
                            return ListTile(
                              title: Text(subService['title']),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, subService['route']);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              Navigator.pushNamed(context, service['route']);
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: service['color'].withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  service['icon'],
                  size: 32,
                  color: service['color'],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                service['title'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
