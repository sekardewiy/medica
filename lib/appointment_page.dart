import 'package:flutter/material.dart';

class AppointmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buat Janji Offline'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildHospitalItem(
            context,
            'Klinik Ultra Medica',
            'Jl. Tegalturi No.53, Giwangan, Kec. Umbulharjo, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55163, Indonesia.',
            'assets/hospital1.png',
            'Cara Buat Janji: Call 021-123456',
          ),
          _buildHospitalItem(
            context,
            'RS PKU Muhammadiyah Yogyakarta',
            'Jl. KH Ahmad Dahlan No.20, Kota Yogyakarta',
            'assets/hospital2.png',
            'Cara Buat Janji: Visit Website',
          ),
          _buildHospitalItem(
            context,
            'RSKIA Permata Bunda',
            'Jl. Ngeksigondo No. 56 Yogyakarta',
            'assets/hospital3.jpg',
            'Cara Buat Janji: WhatsApp 08123456789',
          ),
          // Tambahkan item rumah sakit atau klinik lainnya sesuai kebutuhan
        ],
      ),
    );
  }

  Widget _buildHospitalItem(BuildContext context, String name, String address, String imagePath, String appointmentInfo) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Colors.blue, width: 2.0),
      ),
      child: ListTile(
        leading: Image.asset(
          imagePath,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(address),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HospitalDetailPage(
                name: name,
                address: address,
                imagePath: imagePath,
                appointmentInfo: appointmentInfo,
              ),
            ),
          );
        },
      ),
    );
  }
}

class HospitalDetailPage extends StatelessWidget {
  final String name;
  final String address;
  final String imagePath;
  final String appointmentInfo;

  const HospitalDetailPage({
    Key? key,
    required this.name,
    required this.address,
    required this.imagePath,
    required this.appointmentInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, width: double.infinity, height: 200, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(address, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text('Cara Buat Janji:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(appointmentInfo, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _showAppointmentDialog(context);
              },
              child: Text('Buat Janji'),
            ),
          ],
        ),
      ),
    );
  }

  void _showAppointmentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Buat Janji di $name'),
        content: Text('Pastikan data anda sudah benar.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Berhasil membuat janji di $name'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: Text('Konfirmasi'),
          ),
        ],
      ),
    );
  }
}
