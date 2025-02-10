import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/pelayanan_page.dart';
import 'pages/telekonsultasi_page.dart';
import 'pages/call_center_page.dart';
import 'pages/rawat_inap_page.dart';
import 'pages/rawat-jalan/klinik_anak_page.dart';
import 'pages/rawat-jalan/terapi_ozon_page.dart';
import 'pages/rawat-jalan/klinik_neurologi_page.dart';
import 'pages/rawat-jalan/klinik_kulit_page.dart';
import 'pages/rawat-jalan/klinik_penyakit_dalam_page.dart';
import 'pages/rawat-jalan/klinik_mata_page.dart';
import 'pages/rawat-jalan/klinik_bedah_page.dart';
import 'pages/rawat-jalan/klinik_tht_page.dart';
import 'pages/rawat-jalan/fisioterapi_page.dart';
import 'pages/rawat-jalan/klinik_laktasi_page.dart';
import 'pages/rawat-jalan/klinik_jiwa_page.dart';
import 'pages/rawat-jalan/klinik_kandungan_page.dart';
import 'pages/rawat-jalan/klinik_ortopedi_page.dart';
import 'pages/rawat-jalan/klinik_radiologi_page.dart';
import 'pages/icu_nicu_page.dart';
import 'pages/emergency_page.dart';
import 'pages/layanan-penunjang/radiologi_page.dart';
import 'pages/layanan-penunjang/fisioterapi_page.dart';
import 'pages/layanan-penunjang/laboratorium_page.dart';
import 'pages/layanan-penunjang/hypnotherapy_page.dart';
import 'pages/layanan-penunjang/beauty_center_page.dart';
import 'pages/layanan-penunjang/wound_care_page.dart';
import 'pages/layanan-penunjang/home_care_page.dart';
import 'pages/layanan-penunjang/farmasi_page.dart';
import 'pages/test_covid_page.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SatuAMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      routes: {
        '/rawat-inap': (context) => const RawatInapPage(),
        '/rawat-jalan/klinik-anak': (context) => const KlinikAnakPage(),
        '/rawat-jalan/terapi-ozon': (context) => const TerapiOzonPage(),
        '/rawat-jalan/klinik-neurologi': (context) =>
            const KlinikNeurologiPage(),
        '/rawat-jalan/klinik-kulit': (context) => const KlinikKulitPage(),
        '/rawat-jalan/klinik-penyakit-dalam': (context) =>
            const KlinikPenyakitDalamPage(),
        '/rawat-jalan/klinik-mata': (context) => const KlinikMataPage(),
        '/rawat-jalan/klinik-bedah': (context) => const KlinikBedahPage(),
        '/rawat-jalan/klinik-tht': (context) => const KlinikTHTPage(),
        '/rawat-jalan/fisioterapi': (context) => const FisioterapiRJPage(),
        '/rawat-jalan/klinik-laktasi': (context) => const KlinikLaktasiPage(),
        '/rawat-jalan/klinik-jiwa': (context) => const KlinikJiwaPage(),
        '/rawat-jalan/klinik-kandungan': (context) =>
            const KlinikKandunganPage(),
        '/rawat-jalan/klinik-ortopedi': (context) => const KlinikOrtopediPage(),
        '/rawat-jalan/klinik-radiologi': (context) =>
            const KlinikRadiologiPage(),
        '/icu-nicu': (context) => const IcuNicuPage(),
        '/emergency': (context) => const EmergencyPage(),
        '/tes-covid': (context) => const TestCovidPage(),
        '/layanan-penunjang/radiologi': (context) => const RadiologiPage(),
        '/layanan-penunjang/fisioterapi': (context) => const FisioterapiPage(),
        '/layanan-penunjang/laboratorium': (context) =>
            const LaboratoriumPage(),
        '/layanan-penunjang/hypnotherapy': (context) =>
            const HypnotherapyPage(),
        '/layanan-penunjang/beauty-center': (context) =>
            const BeautyCenterPage(),
        '/layanan-penunjang/wound-care': (context) => const WoundCarePage(),
        '/layanan-penunjang/home-care': (context) => const HomeCarePage(),
        '/layanan-penunjang/farmasi': (context) => const FarmasiPage(),
      },
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    PelayananPage(),
    TelekonsultasiPage(),
    CallCenterPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.lightBlueAccent],
            ),
          ),
        ),
        title: Row(
          children: [
            // Bagian Kiri - SatuAMC (1/3 width)
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'SatuAMC',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            // Bagian Tengah - Logo (1/3 width)
            Expanded(
              flex: 1,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 36.5,
                      width: 36.5,
                      child: Opacity(
                        opacity: 0.91,
                        child: Image.asset(
                          'assets/images/logo.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Bagian Kanan - Emergency Button (1/3 width)
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.phone_in_talk,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () => _launchURL('tel:0274618224'),
                      ),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.medical_services_outlined),
              activeIcon: Icon(Icons.medical_services),
              label: 'Klinik',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_call_outlined),
              activeIcon: Icon(Icons.video_call),
              label: 'Telekonsultasi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.call_outlined),
              activeIcon: Icon(Icons.call),
              label: 'Call Center',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
