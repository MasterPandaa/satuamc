import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/fade_scroll_configuration.dart';

class CallCenterPage extends StatelessWidget {
  const CallCenterPage({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Tidak dapat membuka $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.withOpacity(0.1), Colors.white],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: ScrollConfiguration(
            behavior: FadeScrollBehavior(),
            child: Column(
              children: [
                FadeInScrollItem(
                  duration: const Duration(milliseconds: 400),
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 15,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.contact_phone,
                            size: 60,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Hubungi Kami',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Pilih cara yang nyaman untuk menghubungi kami',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                FadeInScrollItem(
                  duration: const Duration(milliseconds: 500),
                  child: _buildContactSection(
                    'Kontak Darurat',
                    [
                      _buildContactCard(
                        icon: Icons.emergency,
                        title: 'Emergency Call',
                        content: '(0274) 618224',
                        onTap: () => _launchURL('tel:0274618224'),
                        color: Colors.red,
                      ),
                      _buildContactCard(
                        icon: Icons.video_call,
                        title: 'Telekonsultasi',
                        content: '08170618400',
                        onTap: () => _launchURL('https://wa.me/628170618400'),
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                FadeInScrollItem(
                  duration: const Duration(milliseconds: 600),
                  child: _buildContactSection(
                    'Kontak Umum',
                    [
                      _buildContactCard(
                        icon: Icons.phone,
                        title: 'Telephone',
                        content: '(0274) 618400',
                        onTap: () => _launchURL('tel:0274618400'),
                        color: Colors.blue,
                      ),
                      _buildContactCard(
                        icon: Icons.message,
                        title: 'WhatsApp',
                        content: '08170618400',
                        onTap: () => _launchURL('https://wa.me/628170618400'),
                        color: Colors.green,
                      ),
                      _buildContactCard(
                        icon: Icons.fax,
                        title: 'FAX',
                        content: '0274 618055',
                        onTap: () => _launchURL('tel:0274618055'),
                        color: Colors.purple,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                FadeInScrollItem(
                  duration: const Duration(milliseconds: 700),
                  child: _buildContactSection(
                    'Media Sosial',
                    [
                      _buildContactCard(
                        icon: Icons.language,
                        title: 'Website',
                        content: 'www.rsamcmuhammadiyah.com',
                        onTap: () =>
                            _launchURL('https://rsamcmuhammadiyah.com/'),
                        color: Colors.blue,
                      ),
                      _buildContactCard(
                        icon: Icons.email,
                        title: 'E-Mail',
                        content: 'asrimedicalcenter@gmail.com',
                        onTap: () =>
                            _launchURL('mailto:asrimedicalcenter@gmail.com'),
                        color: Colors.red,
                      ),
                      _buildContactCard(
                        icon: Icons.tiktok,
                        title: 'TikTok',
                        content: '@rsamcmuhammadiyah',
                        onTap: () => _launchURL(
                            'https://www.tiktok.com/@rsamcmuhammadiyah'),
                        color: Colors.black,
                      ),
                      _buildContactCard(
                        icon: Icons.camera_alt,
                        title: 'Instagram',
                        content: '@rsamcmuhammadiyah',
                        onTap: () => _launchURL(
                            'https://www.instagram.com/rsamcmuhammadiyah'),
                        color: Colors.pink,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactSection(String title, List<Widget> cards) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...cards,
      ],
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String content,
    required VoidCallback onTap,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          content,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: color,
        ),
      ),
    );
  }
}
