import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ucp1/ucp/home.dart';

class DetailBarangPage extends StatelessWidget {
  final DateTime tanggal;
  final String jenisTransaksi;
  final String jenisBarang;
  final int jumlahBarang;
  final int hargaSatuan;
  final int totalHarga;
  final String email;

  const DetailBarangPage({
    Key? key,
    required this.tanggal,
    required this.jenisTransaksi,
    required this.jenisBarang,
    required this.jumlahBarang,
    required this.hargaSatuan,
    required this.totalHarga,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp. ',
      decimalDigits: 0,
    );
    final dateFormat = DateFormat('EEEE, dd MMMM yyyy', 'id_ID');
    return Scaffold(
      backgroundColor: const Color(0xFFFEF7F6),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green.withOpacity(0.1),
                      border: Border.all(color: Colors.green, width: 2),
                    ),
                  ),
                  const Icon(Icons.check_circle, color: Colors.green, size: 80),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Data Berhasil Disimpan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            buildInfoRow('Tanggal', dateFormat.format(tanggal)),
            buildInfoRow('Jenis Transaksi', jenisTransaksi),
            buildInfoRow('Jenis Barang', jenisBarang),
            buildInfoRow('Jumlah Barang', jumlahBarang.toString()),
            buildInfoRow(
              'Jenis Harga Satuan',
              currencyFormat.format(hargaSatuan),
            ),
            buildInfoRow('Total Harga', currencyFormat.format(totalHarga)),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6985AC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(email: email),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: const Text(
                    'Selesai',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
