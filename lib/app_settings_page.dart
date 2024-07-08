import 'package:flutter/material.dart';

class AppSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Settings'),
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
                  'Pengaturan Aplikasi',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                _buildSettingItem('Bahasa', () {
                  // Implementasi logika pengaturan bahasa
                }),
                _buildSettingItem('Notifikasi', () {
                  // Implementasi logika pengaturan notifikasi
                }),
                // Tambahkan pengaturan aplikasi lainnya
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
