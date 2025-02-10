import 'package:flutter/material.dart';
import 'klinik_template.dart';

class KlinikKulitPage extends StatelessWidget {
  const KlinikKulitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const KlinikTemplate(
      title: 'Klinik Spesialis Kulit & Kelamin',
      description:
          'Klinik Kulit & Kelamin/Dermato & Venereology Clinic di RS AMC Muhammadiyah memberikan pelayanan konsultasi kesehatan kulit & kelamin serta perawatan kecantikan. Klinik Kulit & kelamin RS AMC Muhammadiyah didukung dengan fasilitas penunjang yang lengkap dan dokter spesialis yang berkompeten.',
      sectionTitle: 'Dokter Spesialis',
      staffList: [
        {
          'name': 'dr. Devi Artami Susetiati, M.Sc., Sp.KK(K), FINSDV, FAADV',
          'role': 'Spesialis Kulit & Kelamin'
        },
        {
          'name': 'dr. Lutia Utami, M.Sc., Sp.KK',
          'role': 'Spesialis Kulit & Kelamin'
        },
        {
          'name': 'dr. Dinda Saraswati Murniastuti, Sp.DV',
          'role': 'Spesialis Kulit & Kelamin'
        },
      ],
    );
  }
}
