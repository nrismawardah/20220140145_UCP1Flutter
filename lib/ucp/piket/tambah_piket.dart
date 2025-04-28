import 'package:flutter/material.dart';

class TambahPiketPage extends StatefulWidget {
  final String email;
  const TambahPiketPage({Key? key, required this.email}) : super(key: key);

  @override
  State<TambahPiketPage> createState() => _TambahPiketPageState();
}

class _TambahPiketPageState extends State<TambahPiketPage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _tugasController = TextEditingController();
  DateTime? _selectedDate;
  List<String> _daftarTugas = [];
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
