import 'package:flutter/material.dart';
import 'chat_screen.dart'; // Pastikan untuk mengimpor ChatScreen untuk navigasi setelah pembayaran

class PaymentScreen extends StatelessWidget {
  final String doctorName;
  final String chatPrice; // Jika perlu, gunakan untuk menampilkan harga chat

  const PaymentScreen({
    Key? key,
    required this.doctorName,
    required this.chatPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran untuk $doctorName'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.white, // Latar belakang putih
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.payment, size: 80, color: Colors.blue),
              SizedBox(height: 20),
              Text(
                'Anda perlu melakukan pembayaran untuk chat dengan $doctorName.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implementasi logika untuk pembayaran (misalnya, integrasi dengan gateway pembayaran)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Proses pembayaran dimulai untuk $doctorName')),
                  );
                  
                  // Simulasi pembayaran berhasil, lanjut ke halaman chat
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(doctorName: doctorName),
                    ),
                  );
                },
                child: Text('Lanjutkan Pembayaran'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
