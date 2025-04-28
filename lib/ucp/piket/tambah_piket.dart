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
  void initState() {
    super.initState();
    _namaController.text = widget.email;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
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
