import 'package:flutter/material.dart';
import 'layanan_template.dart';

class FisioterapiPage extends StatelessWidget {
  const FisioterapiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayananTemplate(
      title: 'Fisioterapi & Sport Injury',
      description:
          'Pelayanan kesehatan yang ditujukan kepada individu dan/atau kelompok untuk mengembangkan, memelihara, dan memulihkan gerak dan fungsi tubuh sepanjang rentang kehidupan dengan menggunakan penanganan secara manual, peningkatan gerak, peralatan (physics, elektroterapeutis dan mekanis) pelatihan fungsi, dan komunikasi.',
      imageUrls: [
        'fisio1.jpg',
        'fisio2.jpg',
        'fisio3.jpg',
      ],
      features: [
        'Penanganan gangguan sistem saraf',
        'Terapi musculoskeletal',
        'Rehabilitasi kardiopulmovaskular',
        'Fisioterapi pediatri dan geriatri',
        'Sport injury management',
        'Kesehatan wanita',
        'Penanganan cedera olahraga',
        'Rehabilitasi stroke',
        'Terapi nyeri sendi dan punggung',
        'Pemulihan patah tulang',
        'Terapi keterlambatan perkembangan anak',
        'Penanganan inkontinensia urine',
      ],
    );
  }
}
