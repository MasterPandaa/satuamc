import 'package:flutter/material.dart';
import 'layanan_template.dart';

class LaboratoriumPage extends StatelessWidget {
  const LaboratoriumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayananTemplate(
      title: 'Laboratorium',
      description:
          'Laboratorium RS AMC Muhammadiyah Yogyakarta memberikan pelayanan yang lengkap dan memiliki tingkat akurasi pemeriksaan cukup baik, didukung dengan peralatan laboratorium canggih.',
      imageUrls: [
        'lab1.jpg',
        'lab2.jpg',
        'lab3.jpg',
        'lab4.jpg',
      ],
      features: [
        'Hematologi',
        'Kimia Klinis',
        'Urinalisa',
        'Immunologi',
        'Mikrobiologi',
        'Patalogi Anatomi',
        'Andrologi',
        'Panel Pemantauan Diabetes (DM)',
        'Panel Lemak',
        'Panel TORCH',
        'Panel Anemia',
        'Panel Fungsi Hati',
        'Panel Fungsi Ginjal',
        'Panel Hepatitis',
        'Panel Fungsi Tiroid',
        'Panel Medical Check Up',
        'Panel Pemeriksaan NAPZA',
      ],
    );
  }
}
