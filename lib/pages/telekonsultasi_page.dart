import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/telekonsultasi_data.dart';
import '../widgets/fade_scroll_configuration.dart';

class TelekonsultasiPage extends StatefulWidget {
  const TelekonsultasiPage({super.key});

  @override
  State<TelekonsultasiPage> createState() => _TelekonsultasiPageState();
}

class _TelekonsultasiPageState extends State<TelekonsultasiPage> {
  String searchString = "";
  String selectedKlinik = "Semua Klinik";
  String selectedHari = "Semua Hari";
  final TextEditingController _searchController = TextEditingController();

  // Daftar klinik yang tersedia
  final List<String> klinikList = [
    "Semua Klinik",
    "Penyakit Dalam",
    "Kebidanan dan Kandungan",
    "Anak",
    "Kulit dan Kelamin",
    "Jiwa (Psikiatri)",
    "Laktasi",
    "Bedah",
    "Radiologi",
    "THT",
    "Umum",
    "Neurologi",
  ];

  // Daftar hari
  final List<String> hariList = [
    "Semua Hari",
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jumat",
    "Sabtu",
    "Minggu",
  ];

  List<Map<String, dynamic>> getFilteredDokter() {
    var filteredList = telekonsultasiList;

    // Filter berdasarkan pencarian
    if (searchString.isNotEmpty) {
      filteredList = filteredList.where((dokter) {
        return dokter["nama"]!
                .toLowerCase()
                .contains(searchString.toLowerCase()) ||
            dokter["spesialis"]!
                .toLowerCase()
                .contains(searchString.toLowerCase());
      }).toList();
    }

    // Filter berdasarkan klinik
    if (selectedKlinik != "Semua Klinik") {
      filteredList = filteredList.where((dokter) {
        return dokter["spesialis"] == selectedKlinik;
      }).toList();
    }

    // Filter berdasarkan hari
    if (selectedHari != "Semua Hari") {
      filteredList = filteredList.where((dokter) {
        var jadwalHari = dokter["jadwal"][selectedHari];
        return jadwalHari != null && jadwalHari != "-";
      }).toList();
    }

    return filteredList;
  }

  @override
  Widget build(BuildContext context) {
    var filteredDokter = getFilteredDokter();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.withOpacity(0.1), Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Search Field dengan desain yang lebih menarik
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      searchString = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Cari Dokter atau Spesialis...',
                    prefixIcon: const Icon(Icons.search, color: Colors.blue),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Filter Section dengan desain yang lebih menarik
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: selectedKlinik,
                        decoration: const InputDecoration(
                          labelText: 'Klinik',
                          border: OutlineInputBorder(),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        ),
                        items: klinikList.map((String klinik) {
                          return DropdownMenuItem(
                            value: klinik,
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return Container(
                                  constraints: BoxConstraints(
                                      maxWidth: constraints.maxWidth),
                                  child: Text(
                                    klinik,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                );
                              },
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedKlinik = newValue!;
                          });
                        },
                        isExpanded: true,
                        menuMaxHeight: 300,
                        icon: const Icon(Icons.arrow_drop_down,
                            color: Colors.blue),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: selectedHari,
                        decoration: const InputDecoration(
                          labelText: 'Hari',
                          border: OutlineInputBorder(),
                        ),
                        items: hariList.map((String hari) {
                          return DropdownMenuItem(
                            value: hari,
                            child: Text(hari),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedHari = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Daftar Dokter dengan desain yang lebih menarik
              Expanded(
                child: ScrollConfiguration(
                  behavior: FadeScrollBehavior(),
                  child: ListView.builder(
                    itemCount: filteredDokter.length,
                    itemBuilder: (context, index) {
                      return FadeInScrollItem(
                        duration: Duration(milliseconds: 400 + (index * 100)),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.blue.withOpacity(0.1),
                              child: const Icon(Icons.person,
                                  color: Colors.blue, size: 30),
                            ),
                            title: Text(
                              filteredDokter[index]["nama"]!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Text(
                                  filteredDokter[index]["spesialis"]!,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
                                if (selectedHari != "Semua Hari") ...[
                                  const SizedBox(height: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      "Jadwal $selectedHari: ${filteredDokter[index]["jadwal"][selectedHari]}",
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            trailing: ElevatedButton.icon(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      _buildJadwalDialog(filteredDokter[index]),
                                );
                              },
                              icon: const Icon(Icons.calendar_today,
                                  size: 16, color: Colors.white),
                              label: const Text('Jadwal'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Modifikasi dialog jadwal
  Widget _buildJadwalDialog(Map<String, dynamic> dokter) {
    Map<String, String> jadwal = dokter["jadwal"];
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.7,
        ),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 15,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header dengan foto profil dan info dokter
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue.withOpacity(0.1),
                  child: const Icon(Icons.person, color: Colors.blue, size: 35),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dokter["nama"]!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        dokter["spesialis"] ?? "Dokter Spesialis",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Divider(),
            ),
            // Jadwal dalam ScrollView
            Flexible(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: jadwal.entries.map((entry) {
                    bool isPraktek = entry.value != "-" &&
                        entry.value.toLowerCase() != "tidak praktek" &&
                        !entry.value.toLowerCase().contains("cuti");
                    bool isPerjanjian =
                        entry.value.toLowerCase().contains("perjanjian");

                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 15),
                      decoration: BoxDecoration(
                        color: isPraktek
                            ? Colors.blue.withOpacity(0.05)
                            : Colors.red.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isPraktek
                              ? Colors.blue.withOpacity(0.1)
                              : Colors.red.withOpacity(0.1),
                        ),
                      ),
                      child: Row(
                        children: [
                          // Hari
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: isPraktek
                                  ? Colors.blue.withOpacity(0.1)
                                  : Colors.red.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              entry.key,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isPraktek ? Colors.blue : Colors.red,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Jam Praktek
                          Expanded(
                            child: Text(
                              isPerjanjian
                                  ? "Dengan Perjanjian"
                                  : (isPraktek ? entry.value : "Tidak Praktek"),
                              style: TextStyle(
                                color: isPraktek ? Colors.black87 : Colors.red,
                                fontWeight: isPraktek
                                    ? FontWeight.w500
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                          // Status Icon
                          if (isPraktek)
                            Icon(
                              isPerjanjian
                                  ? Icons.event_available
                                  : Icons.check_circle,
                              color: Colors.green,
                              size: 20,
                            ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Tombol tutup
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Tutup',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
