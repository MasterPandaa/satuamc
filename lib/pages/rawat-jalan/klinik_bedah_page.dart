import 'package:flutter/material.dart';
import 'klinik_template.dart';

class KlinikBedahPage extends StatelessWidget {
  const KlinikBedahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const KlinikTemplate(
      title: 'Klinik Spesialis Bedah',
      description:
          'Klinik bedah/surgery clinic di RS AMC Muhammadiyah melayani konsultasi kasus-kasus bedah. Selain dokter spesialis bedah umum, RS AMC Muhammadiyah juga memiliki dokter spesialis bedah anak.',
      sectionTitle: 'Dokter Spesialis',
      staffList: [
        {'name': 'dr. Nicko Rahmanio, Sp.B', 'role': 'Spesialis Bedah'},
        {'name': 'dr. Fadli Robby A., MMR., Sp.B', 'role': 'Spesialis Bedah'},
        {
          'name': 'dr. Hafni Zuchra Noor, MM, Sp.BA',
          'role': 'Spesialis Bedah Anak'
        },
      ],
    );
  }
}
