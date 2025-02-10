import 'package:flutter/material.dart';
import 'klinik_template.dart';

class KlinikKandunganPage extends StatelessWidget {
  const KlinikKandunganPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const KlinikTemplate(
      title: 'Klinik Spesialis Kandungan',
      description:
          'Klinik Kandungan/Obstetrics & Gynecology Clinic di RS AMC Muhammadiyah memberikan pelayanan terkait kehamilan dan masalah kewanitaan lainnya yang didukung oleh dokter spesialis yang berkompeten.',
      sectionTitle: 'Dokter Spesialis',
      staffList: [
        {
          'name': 'dr. Supriyatiningsih (Upi\'), Sp. OG., M. Kes',
          'role': 'Spesialis Kandungan'
        },
        {
          'name': 'dr. Alfun Dhiya An, Sp.OG., M.Kes',
          'role': 'Spesialis Kandungan'
        },
        {
          'name': 'dr. Alfaina Wahyuni, Sp.OG., M.Kes',
          'role': 'Spesialis Kandungan'
        },
        {
          'name': 'dr. Ivanna Beru Brahmana, Sp.OG (K)',
          'role': 'Spesialis Kandungan'
        },
      ],
    );
  }
}
