import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String doctorName;

  const ChatScreen({Key? key, required this.doctorName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat dengan $doctorName'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(8),
              children: [
                // Contoh bubble chat dari dokter (kiri)
                BubbleChat(
                  message: 'Halo, ada yang bisa saya bantu?',
                  isDoctor: true,
                ),
                // Contoh bubble chat dari pengguna (kanan)
                BubbleChat(
                  message: 'Halo dok, saya ingin konsultasi tentang ...',
                  isDoctor: false,
                ),
                // Tambahkan bubble chat lainnya sesuai kebutuhan
              ],
            ),
          ),
          // Input untuk mengetik pesan
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ketik pesan...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    // Logika untuk mengirim pesan
                  },
                  icon: Icon(Icons.send, color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BubbleChat extends StatelessWidget {
  final String message;
  final bool isDoctor;

  const BubbleChat({
    Key? key,
    required this.message,
    required this.isDoctor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      alignment: isDoctor ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isDoctor ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: isDoctor ? Radius.circular(0) : Radius.circular(16),
            bottomRight: isDoctor ? Radius.circular(16) : Radius.circular(0),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(color: isDoctor ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
