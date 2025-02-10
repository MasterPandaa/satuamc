import 'package:flutter/material.dart';
import 'klinik_template.dart';

class KlinikRadiologiPage extends StatelessWidget {
  const KlinikRadiologiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const KlinikTemplate(
      title: 'Klinik Spesialis Radiologi',
      sectionTitle: 'Dokter Spesialis',
      staffList: [
        {'name': 'dr. Ana Majdawati, Sp.Rad', 'role': 'Spesialis Radiologi'},
        {
          'name': 'dr. Nur Hayati, M.Med.Ed., Sp.Rad',
          'role': 'Spesialis Radiologi'
        },
      ],
    );
  }
}
