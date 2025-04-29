import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
