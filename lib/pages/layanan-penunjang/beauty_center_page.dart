import 'package:flutter/material.dart';
import 'layanan_template.dart';

class BeautyCenterPage extends StatelessWidget {
  const BeautyCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayananTemplate(
      title: 'Beauty Center',
      description:
          'Beauty Center RS AMC Muhammadiyah menyediakan berbagai layanan perawatan kecantikan dengan teknologi modern dan tenaga ahli yang berpengalaman.',
      features: [
        'Facial Oksigen - Perawatan wajah dengan teknologi oxygen jet pell dan oxygen serum',
        'Body Massage - Relaksasi tubuh dan melancarkan sirkulasi darah',
        'Scrub Badan - Mengangkat sel kulit mati untuk kulit yang sehat dan lembut',
        'Creambath - Perawatan rambut dengan pijatan relaksasi',
        'Hair Mask - Perawatan khusus untuk rambut rusak',
      ],
    );
  }
}
