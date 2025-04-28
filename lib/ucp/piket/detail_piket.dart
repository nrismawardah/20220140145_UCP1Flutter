import 'package:flutter/material.dart';

class DetailPiketPage extends StatelessWidget {
  final String email;
  final String tanggal;
  final String tugas;

  const DetailPiketPage({
    Key? key,
    required this.email,
    required this.tanggal,
    required this.tugas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF6985AC),
        toolbarHeight: 90,
        title: Text('Detail $tugas'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tanggal,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6985AC),
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF6985AC),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      email,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFF6985AC),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  tugas,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
