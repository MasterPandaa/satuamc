import 'package:flutter/material.dart';
import 'klinik_template.dart';

class KlinikLaktasiPage extends StatelessWidget {
  const KlinikLaktasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const KlinikTemplate(
      title: 'Klinik Laktasi',
      sectionTitle: 'Dokter',
      staffList: [
        {'name': 'dr. Mita Wulansari', 'role': 'Dokter Laktasi'},
        {'name': 'dr. Hidayatul Kurniawati, M.Sc', 'role': 'Dokter Laktasi'},
      ],
    );
  }
}
