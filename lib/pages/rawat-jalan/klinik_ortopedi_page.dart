import 'package:flutter/material.dart';
import 'klinik_template.dart';

class KlinikOrtopediPage extends StatelessWidget {
  const KlinikOrtopediPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const KlinikTemplate(
      title: 'Klinik Spesialis Ortopedi',
      sectionTitle: 'Dokter Spesialis',
      staffList: [
        {
          'name': 'dr. H. Kuncahyo Kamal Arifin, Sp.OT',
          'role': 'Spesialis Ortopedi'
        },
        {'name': 'dr. Wahyu Setyawan, Sp.OT', 'role': 'Spesialis Ortopedi'},
      ],
    );
  }
}
