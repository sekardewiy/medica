import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bantuan',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                _buildHelpItem('FAQ', () {
                  // Implementasi logika tampilkan FAQ
                }),
                _buildHelpItem('Hubungi Kami', () {
                  // Implementasi logika tampilkan form hubungi kami
                }),
                // Tambahkan informasi bantuan lainnya
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHelpItem(String label, VoidCallback onTap) {
    return ListTile(
      title: Text(label),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
