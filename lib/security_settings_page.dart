import 'package:flutter/material.dart';

class SecuritySettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Security Settings'),
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
                  'Pengaturan Keamanan',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                _buildSettingItem('Ganti Kata Sandi', () {
                  // Implementasi logika ganti kata sandi
                }),
                _buildSettingItem('Verifikasi Dua Langkah', () {
                  // Implementasi logika verifikasi dua langkah
                }),
                // Tambahkan pengaturan keamanan lainnya
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem(String label, VoidCallback onTap) {
    return ListTile(
      title: Text(label),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
