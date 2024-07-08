import 'package:flutter/material.dart';
import 'category_detail_page.dart'; // Import halaman detail kategori

class BelanjaKategoriPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Belanja Sesuai Kategori'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.white, // Set background color to white
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                'Toko Terpercaya',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            _buildTrustedStoreItem(context, 'Apotek 24 Jam'),
            SizedBox(height: 12),
            _buildTrustedStoreItem(context, 'Kimia Farma'),
            SizedBox(height: 12),
            _buildTrustedStoreItem(context, 'Watson'),
            SizedBox(height: 12),
            _buildTrustedStoreItem(context, 'Guardian'),
            SizedBox(height: 12),
            _buildTrustedStoreItem(context, 'Apotek Roxy'),
            SizedBox(height: 20),
            Text(
              'Pilih Kategori',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            _buildCategoryRow(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTrustedStoreItem(BuildContext context, String storeName) {
    return GestureDetector(
      onTap: () {
        // Implementasi navigasi ke halaman detail toko
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            storeName,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildCategoryItem(context, 'Obat', Icons.local_pharmacy),
        _buildCategoryItem(context, 'Susu', Icons.local_drink),
        _buildCategoryItem(context, 'Ibu dan Anak', Icons.pregnant_woman),
        _buildCategoryItem(context, 'Kecantikan', Icons.face),
      ],
    );
  }

  Widget _buildCategoryItem(BuildContext context, String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        // Implementasi navigasi untuk masing-masing kategori
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CategoryDetailPage(categoryTitle: title)),
        );
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue,
            child: Icon(icon, size: 30, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
