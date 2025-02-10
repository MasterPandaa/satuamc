import 'package:flutter/material.dart';
import 'klinik_template.dart';

class KlinikMataPage extends StatelessWidget {
  const KlinikMataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const KlinikTemplate(
      title: 'Klinik Spesialis Mata',
      description:
          'Klinik mata/Eye clinic di RS AMC Muhammadiyah melayani pengobatan penanganan kelainan pada mata dan penyakit seputar mata. Serta dilengkapi dengan peralatan diagnostik dan fasilitas penunjang yang lengkap dan memadai guna meningkatkan pelayanan.',
      sectionTitle: 'Dokter Spesialis',
      staffList: [
        {'name': 'dr. Nurfifi Arliani, Sp. M., MMR', 'role': 'Spesialis Mata'},
        {'name': 'dr. Ahmad Iklilludin, Sp.M', 'role': 'Spesialis Mata'},
      ],
    );
  }
}
