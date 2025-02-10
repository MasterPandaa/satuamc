import 'package:flutter/material.dart';
import 'klinik_template.dart';

class KlinikTHTPage extends StatelessWidget {
  const KlinikTHTPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const KlinikTemplate(
      title: 'Klinik Spesialis THT',
      description:
          'Klinik THT RS AMC Muhammadiyah memberikan pelayanan konsultasi dan penanganan untuk berbagai keluhan dan penyakit yang berhubungan dengan telinga, hidung, dan tenggorokan.',
      sectionTitle: 'Dokter Spesialis',
      staffList: [
        {'name': 'dr. Asti Widuri, Sp.THT', 'role': 'Spesialis THT'},
        {
          'name': 'dr. Rizka Fakhriani, MM., Sp. THT-KL',
          'role': 'Spesialis THT'
        },
        {'name': 'dr. Deoni Daniswara, Sp.THT-KL', 'role': 'Spesialis THT'},
      ],
    );
  }
}
