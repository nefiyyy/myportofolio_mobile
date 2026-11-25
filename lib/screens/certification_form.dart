import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class CertificationFormPage extends StatefulWidget {
  const CertificationFormPage({super.key});

  @override
  State<CertificationFormPage> createState() => _CertificationFormPageState();
}

class _CertificationFormPageState extends State<CertificationFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  String _issuer = "";
  DateTime? _issueDate;
  String _link = "";

  // buat nampilin tanggal yang dipilih di kolom tanggal
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime d) => "${d.day}/${d.month}/${d.year}";

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _issueDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _issueDate = picked;
        _dateController.text = _formatDate(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Certification Form'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Nama sertifikat
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Nama Sertifikat",
                  hintText: "Contoh: Belajar Dasar Flutter",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => setState(() => _name = value),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Nama sertifikat tidak boleh kosong!";
                  }
                  if (value.trim().length > 100) {
                    return "Nama sertifikat maksimal 100 karakter!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // 2. Penerbit
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Penerbit",
                  hintText: "Contoh: Dicoding",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => setState(() => _issuer = value),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Penerbit tidak boleh kosong!";
                  }
                  if (value.trim().length > 100) {
                    return "Penerbit maksimal 100 karakter!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // 3. Tanggal terbit (pakai kalender)
              TextFormField(
                controller: _dateController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: "Tanggal Terbit",
                  hintText: "Klik untuk memilih tanggal",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: _pickDate,
                validator: (value) {
                  if (_issueDate == null) {
                    return "Tanggal terbit wajib dipilih!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // 4. Link sertifikat (opsional)
              TextFormField(
                keyboardType: TextInputType.url,
                decoration: const InputDecoration(
                  labelText: "Link Sertifikat (opsional)",
                  hintText: "https://...",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => setState(() => _link = value),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return null; // boleh kosong
                  }
                  final uri = Uri.tryParse(value.trim());
                  if (uri == null ||
                      !(uri.scheme == "http" || uri.scheme == "https") ||
                      uri.host.isEmpty) {
                    return "Link harus diawali http:// atau https://";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Tombol Simpan
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Sertifikat berhasil disimpan!"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Nama: ${_name.trim()}"),
                              Text("Penerbit: ${_issuer.trim()}"),
                              Text("Tanggal: ${_formatDate(_issueDate!)}"),
                              Text(
                                "Link: ${_link.trim().isEmpty ? '-' : _link.trim()}",
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              child: const Text("OK"),
                              onPressed: () {
                                Navigator.pop(context);
                                _formKey.currentState!.reset();
                                _dateController.clear();
                                setState(() => _issueDate = null);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
