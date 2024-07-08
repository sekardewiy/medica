import 'package:flutter/material.dart';
import 'payment_screen.dart'; // Sesuaikan dengan path file PaymentScreen

class DoctorRecommendationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rekomendasi Dokter'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DoctorItem(
                profileImage: 'assets/doctor2.png', // Ubah sesuai dengan path gambar dokter
                name: 'Dr. Bunga Putri Sp.OG',
                specialist: 'Gynecology',
                experience: '5 tahun',
                likedByPatients: '95%',
                chatPrice: 'Rp 100.000',
              ),
              SizedBox(height: 16),
              DoctorItem(
                profileImage: 'assets/doctor1.png', // Ubah sesuai dengan path gambar dokter
                name: 'Dr. Ramadhan',
                specialist: 'General Medicine',
                experience: '8 tahun',
                likedByPatients: '92%',
                chatPrice: 'Rp 120.000',
              ),
              // Tambahkan DoctorItem lainnya sesuai kebutuhan
            ],
          ),
        ),
      ),
    );
  }
}

class DoctorItem extends StatelessWidget {
  final String profileImage;
  final String name;
  final String specialist;
  final String experience;
  final String likedByPatients;
  final String chatPrice;

  const DoctorItem({
    Key? key,
    required this.profileImage,
    required this.name,
    required this.specialist,
    required this.experience,
    required this.likedByPatients,
    required this.chatPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentScreen(
              doctorName: name,
              chatPrice: chatPrice,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(profileImage),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Spesialis: $specialist'),
                  SizedBox(height: 4),
                  Text('Pengalaman: $experience'),
                  SizedBox(height: 4),
                  Text('Disukai oleh Pasien: $likedByPatients'),
                  SizedBox(height: 4),
                  Text('Biaya Chat: $chatPrice'),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentScreen(
                            doctorName: name,
                            chatPrice: chatPrice,
                          ),
                        ),
                      );
                    },
                    child: Text('Chat'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
