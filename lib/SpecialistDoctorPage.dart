import 'package:flutter/material.dart';
import 'payment_screen.dart'; // Pastikan untuk mengimpor PaymentScreen

class SpecialistDoctorsPage extends StatelessWidget {
  final String specialist;

  SpecialistDoctorsPage({required this.specialist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dokter Spesialis $specialist'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildDoctorCard(context, 'Dr. Adjie Kuncoro', 'Spesialis $specialist', '10 tahun', 90, 200000, 'assets/doctor1.png'),
          _buildDoctorCard(context, 'Dr. Shinta Aprilia', 'Spesialis $specialist', '5 tahun', 85, 150000, 'assets/doctor2.png'),
          _buildDoctorCard(context, 'Dr. Setya Wicaksono', 'Spesialis $specialist', '8 tahun', 95, 250000, 'assets/doctor1.png'),
        ],
      ),
    );
  }

  Widget _buildDoctorCard(BuildContext context, String name, String specialty, String experience, int satisfaction, int price, String imagePath) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Colors.blue, width: 2),
      ),
      color: Colors.white, // Set background to white
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(imagePath),
        ),
        title: Text(
          name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(specialty),
            Text('Pengalaman: $experience'),
            Text('Kepuasan Pasien: $satisfaction%'),
            Text('Harga: Rp $price'),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            // Navigasi ke halaman pembayaran saat tombol Chat diklik
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaymentScreen(doctorName: name, chatPrice: '$price')), // Masukkan data yang diperlukan
            );
          },
          child: Text('Chat'),
        ),
      ),
    );
  }
}
