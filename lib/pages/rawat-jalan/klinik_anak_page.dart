import 'package:flutter/material.dart';
import 'klinik_template.dart';

class KlinikAnakPage extends StatelessWidget {
  const KlinikAnakPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const KlinikTemplate(
      title: 'Klinik Spesialis Anak',
      description:
          'Klinik Anak/Pediatric Clinic di RS AMC Muhammadiyah memberikan pelayanan konsultasi anak kepada orang tua pasien yang memeiliki keluhan seputar kesehatan dan perkembangan anak.',
      sectionTitle: 'Dokter Spesialis',
      staffList: [
        {
          'name': 'dr. Bambang Edi Susyanto, Sp.A., M.Kes',
          'role': 'Spesialis Anak'
        },
        {'name': 'dr. Gina Puspita, Sp.A., M.Sc', 'role': 'Spesialis Anak'},
      ],
    );
  }
}
