import 'package:flutter/material.dart';
import 'klinik_template.dart';

class FisioterapiRJPage extends StatelessWidget {
  const FisioterapiRJPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const KlinikTemplate(
      title: 'Fisioterapi & Cedera Olahraga',
      sectionTitle: 'TIM Fisioterapi',
      staffList: [
        {'name': 'Yuni Purwasih, A.Md.Fis', 'role': 'Fisioterapis'},
        {'name': 'Agung Hnafi, A.Md.Fis', 'role': 'Fisioterapis'},
      ],
    );
  }
}
