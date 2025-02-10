import 'package:flutter/material.dart';
import 'klinik_template.dart';

class KlinikPenyakitDalamPage extends StatelessWidget {
  const KlinikPenyakitDalamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const KlinikTemplate(
      title: 'Klinik Spesialis Penyakit Dalam',
      description:
          'Klinik Spesialis Penyakit Dalam RS AMC Muhammadiyah memberikan pelayanan konsultasi dan penanganan untuk berbagai penyakit dalam dan jantung. Ditangani oleh dokter spesialis yang berpengalaman.',
      sectionTitle: 'Dokter Spesialis',
      staffList: [
        {
          'name': 'dr. Agus Widiyatmoko, M.Sc., Sp.PD',
          'role': 'Spesialis Penyakit Dalam'
        },
        {
          'name': 'dr. Fitria Nurul, Sp.PD., M.Sc',
          'role': 'Spesialis Penyakit Dalam'
        },
        {
          'name': 'dr. Medicia Yurista, Sp.PD',
          'role': 'Spesialis Penyakit Dalam'
        },
      ],
    );
  }
}
