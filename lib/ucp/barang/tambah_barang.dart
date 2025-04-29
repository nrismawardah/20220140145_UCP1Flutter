import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ucp1/ucp/barang/detail_barang.dart';

class TambahBarangPage extends StatefulWidget {
  final String email;

  const TambahBarangPage({Key? key, required this.email}) : super(key: key);

  @override
  State<TambahBarangPage> createState() => _TambahBarangPageState();
}

class _TambahBarangPageState extends State<TambahBarangPage> {
  final _formKey = GlobalKey<FormState>();
  final _jumlahController = TextEditingController();

  DateTime? _selectedDate;
  String? _selectedJenisTransaksi;
  String? _selectedJenisBarang;
  int _hargaSatuan = 0;

  final _jenisTransaksiList = ['Barang Masuk', 'Barang Keluar'];
  final Map<String, int> _barangHargaMap = {
    'Carrier': 540000,
    'Tenda': 150000,
    'Sleeping Bag': 50000,
    'Sepatu': 70000,
  };

  bool _tanggalError = false;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
      locale: const Locale('id', 'ID'),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6985AC),
        toolbarHeight: 90,
        title: const Text('Pendataan Barang'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tanggal Transaksi',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () async {
                  await _selectDate(context);
                  setState(() {
                    _tanggalError = false;
                  });
                },
                child: InputDecorator(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    suffixIcon: const Icon(Icons.calendar_today),
                    errorText:
                        _tanggalError ? 'Tanggal tidak boleh kosong' : null,
                  ),
                  child: Text(
                    _selectedDate == null
                        ? 'Pilih Tanggal'
                        : DateFormat(
                          'EEEE, dd MMMM yyyy',
                          'id_ID',
                        ).format(_selectedDate!),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Jenis Transaksi',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              DropdownButtonFormField<String>(
                value: _selectedJenisTransaksi,
                hint: const Text('Jenis Transaksi'),
                items:
                    _jenisTransaksiList
                        .map(
                          (item) =>
                              DropdownMenuItem(value: item, child: Text(item)),
                        )
                        .toList(),
                onChanged:
                    (val) => setState(() => _selectedJenisTransaksi = val),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                validator:
                    (value) =>
                        value == null
                            ? 'Jenis Transaksi tidak boleh kosong'
                            : null,
              ),
              const SizedBox(height: 16),
              const Text(
                'Jenis Barang',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              DropdownButtonFormField<String>(
                value: _selectedJenisBarang,
                hint: const Text('Jenis Barang'),
                items:
                    _barangHargaMap.keys
                        .map(
                          (item) =>
                              DropdownMenuItem(value: item, child: Text(item)),
                        )
                        .toList(),
                onChanged: (val) {
                  setState(() {
                    _selectedJenisBarang = val;
                    _hargaSatuan = _barangHargaMap[val]!;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                validator:
                    (value) =>
                        value == null
                            ? 'Jenis Barang tidak boleh kosong'
                            : null,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _jumlahController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Jumlah Barang',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Jumlah barang tidak boleh kosong'
                                  : null,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        prefixText: 'Rp. ',
                        labelText: 'Harga Satuan',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      controller: TextEditingController(
                        text: _hargaSatuan.toString(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        _selectedDate != null) {
                      int jumlahBarang = int.parse(_jumlahController.text);
                      int totalHarga = jumlahBarang * _hargaSatuan;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DetailBarangPage(
                                tanggal: _selectedDate!,
                                jenisTransaksi: _selectedJenisTransaksi!,
                                jenisBarang: _selectedJenisBarang!,
                                jumlahBarang: jumlahBarang,
                                totalHarga: totalHarga,
                                hargaSatuan: _hargaSatuan,
                                email: widget.email,
                              ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6985AC),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
