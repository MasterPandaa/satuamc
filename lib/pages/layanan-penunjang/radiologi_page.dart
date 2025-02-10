import 'package:flutter/material.dart';
import 'layanan_template.dart';

class RadiologiPage extends StatelessWidget {
  const RadiologiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayananTemplate(
      title: 'Radiologi',
      description:
          'Layanan radiologi kami menyediakan pemeriksaan X-RAY dan USG dengan peralatan modern dan tim ahli yang berpengalaman.',
      imageUrls: [
        'xray1.jpeg',
        'xray2.jpg',
        'xray3.jpg',
        'xray4.jpg',
        'xray5.jpeg',
        'xray6.jpeg',
        'xray7.jpeg',
      ],
      features: [
        'X-RAY dengan teknologi digital',
        'USG 4D',
        'Interpretasi hasil oleh dokter spesialis radiologi',
        'Hasil dapat diakses secara digital',
      ],
    );
  }
}
