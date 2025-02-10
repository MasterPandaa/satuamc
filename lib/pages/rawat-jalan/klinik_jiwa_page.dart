import 'package:flutter/material.dart';
import 'klinik_template.dart';

class KlinikJiwaPage extends StatelessWidget {
  const KlinikJiwaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const KlinikTemplate(
      title: 'Klinik Jiwa & Hipnoterapi',
      sectionTitle: 'Dokter Spesialis & TIM',
      staffList: [
        {
          'name': 'Dr. dr. Warih Andan Puspitosari, M.Sc, SpKJ(K)',
          'role': 'Spesialis Kedokteran Jiwa'
        },
        {
          'name': 'dr. RR. Tesaviani Kusumastiwi, Sp.KJ',
          'role': 'Spesialis Kedokteran Jiwa'
        },
        {
          'name': 'Gathut Satrio Winahyu, ST, C.Ht, M.ht, NLP',
          'role': 'Hipnoterapis'
        },
      ],
    );
  }
}
