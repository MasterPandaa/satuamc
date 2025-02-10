import 'package:flutter/material.dart';
import '../data/klinik_data.dart';
import '../widgets/fade_scroll_configuration.dart';

class PelayananPage extends StatefulWidget {
  const PelayananPage({super.key});

  @override
  State<PelayananPage> createState() => _PelayananPageState();
}

class _PelayananPageState extends State<PelayananPage> {
  String searchString = "";
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, dynamic>> getFilteredAndSortedKliniks() {
    if (searchString.isEmpty) {
      return klinikList;
    }

    var filteredList = klinikList.where((klinik) {
      return klinik["nama"]!.toLowerCase().contains(searchString.toLowerCase());
    }).toList();

    filteredList.sort((a, b) {
      String nameA = a["nama"]!.toLowerCase();
      String nameB = b["nama"]!.toLowerCase();

      bool aStartsWith = nameA.startsWith(searchString.toLowerCase());
      bool bStartsWith = nameB.startsWith(searchString.toLowerCase());

      if (aStartsWith && !bStartsWith) return -1;
      if (!aStartsWith && bStartsWith) return 1;

      return nameA.compareTo(nameB);
    });

    return filteredList;
  }

  @override
  Widget build(BuildContext context) {
    var filteredKliniks = getFilteredAndSortedKliniks();

    return Container(
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
                  hintText: 'Cari Klinik...',
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
            Expanded(
              child: ScrollConfiguration(
                behavior: FadeScrollBehavior(),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1,
                  ),
                  itemCount: filteredKliniks.length,
                  itemBuilder: (context, index) {
                    return FadeInScrollItem(
                      offset: 30.0,
                      duration: Duration(milliseconds: 400 + (index * 100)),
                      child: Container(
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
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (BuildContext context) {
                                return _buildDokterList(filteredKliniks[index]);
                              },
                            );
                          },
                          child: _buildKlinikCard(filteredKliniks[index]),
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
    );
  }

  Widget _buildKlinikCard(Map<String, dynamic> klinik) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.medical_services,
            size: 40,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            klinik["nama"]!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDokterList(Map<String, dynamic> klinik) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.medical_services, color: Colors.blue),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Dokter ${klinik["nama"]}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: (klinik["dokter"] as List).length,
              itemBuilder: (context, dokterIndex) {
                return _buildDokterListTile(klinik["dokter"][dokterIndex]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDokterListTile(Map<String, dynamic> dokter) {
    return ListTile(
      leading: const Icon(Icons.person),
      title: Text(dokter["nama"]),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return _buildJadwalDialog(dokter);
          },
        );
      },
    );
  }

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
          maxHeight:
              MediaQuery.of(context).size.height * 0.7, // 70% dari tinggi layar
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
            // Header dengan ikon dan judul
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.access_time, color: Colors.blue),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    'Jadwal ${dokter["nama"]}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Jadwal dalam ScrollView
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: jadwal.entries.map((entry) {
                    bool isPraktek = entry.value != "-" &&
                        entry.value.toLowerCase() != "tidak praktek" &&
                        entry.value.toLowerCase() != "cuti belajar";
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(12),
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
                          Container(
                            padding: const EdgeInsets.all(8),
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
                          Expanded(
                            child: Text(
                              isPraktek ? entry.value : "Tidak Praktek",
                              style: TextStyle(
                                color: isPraktek ? Colors.black87 : Colors.red,
                                fontWeight: isPraktek
                                    ? FontWeight.w500
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                          if (isPraktek)
                            const Icon(
                              Icons.check_circle,
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
            const SizedBox(height: 20),
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
