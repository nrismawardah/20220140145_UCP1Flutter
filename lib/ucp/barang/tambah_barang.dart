import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class TambahBarangPage extends StatefulWidget {
  const TambahBarangPage({Key? key}) : super(key: key);

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
    return const Placeholder();
  }
}
