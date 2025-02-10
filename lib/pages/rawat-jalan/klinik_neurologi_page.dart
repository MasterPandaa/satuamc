import 'package:flutter/material.dart';
import 'klinik_template.dart';

class KlinikNeurologiPage extends StatelessWidget {
  const KlinikNeurologiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const KlinikTemplate(
      title: 'Klinik Spesialis Neurologi',
      description:
          'Klinik Spesialis Neurologi (Syaraf) RS AMC Muhammadiyah memberikan pelayanan konsultasi dan penanganan untuk berbagai keluhan dan penyakit yang berhubungan dengan sistem saraf.',
      sectionTitle: 'Dokter Spesialis',
      staffList: [
        {
          'name': 'Dr. dr. Tri Wahyuliati, Sp.S., M.Kes',
          'role': 'Spesialis Saraf'
        },
        {
          'name': 'dr. Fery Luvita Sari, M.Sc., Sp.N',
          'role': 'Spesialis Saraf'
        },
      ],
    );
  }
}
