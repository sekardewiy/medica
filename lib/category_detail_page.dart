import 'package:flutter/material.dart';

class CategoryDetailPage extends StatelessWidget {
  final String categoryTitle;

  const CategoryDetailPage({Key? key, required this.categoryTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori: $categoryTitle'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.white, // Set background color to white
        padding: EdgeInsets.all(16),
        child: _buildCategoryItems(context),
      ),
    );
  }

  Widget _buildCategoryItems(BuildContext context) {
    switch (categoryTitle) {
      case 'Obat':
        return _buildMedicineList(context);
      case 'Susu':
        return _buildMilkList(context);
      case 'Ibu dan Anak':
        return _buildMotherChildList(context);
      case 'Kecantikan':
        return _buildBeautyList(context);
      default:
        return Center(
          child: Text('Kategori belum diimplementasikan'),
        );
    }
  }

  Widget _buildMedicineList(BuildContext context) {
    return ListView(
      children: [
        _buildListItem(context, 'Paracetamol', 'Obat penurun demam', 'Rp 10.000', 'assets/medicine1.png'),
        _buildListItem(context, 'Amoxicillin', 'Obat antibiotik', 'Rp 15.000', 'assets/medicine2.jpg'),
        _buildListItem(context, 'Loperamide', 'Obat anti-diare', 'Rp 12.000', 'assets/medicine5.png'),
        _buildListItem(context, 'Loratadine', 'Obat anti alergi', 'Rp 18.000', 'assets/medicine3.jpg'),
        _buildListItem(context, 'Omeprazole', 'Obat maag', 'Rp 25.000', 'assets/medicine4.jpg'),
      ],
    );
  }

  Widget _buildMilkList(BuildContext context) {
    return ListView(
      children: [
        _buildListItem(context, 'Susu Bendera', 'Susu segar', 'Rp 20.000', 'assets/milk1.jpg'),
        _buildListItem(context, 'Susu Ultra', 'Susu rendah lemak', 'Rp 22.000', 'assets/milk3.png'),
        _buildListItem(context, 'Susu Bear Brand', 'Susu kental manis', 'Rp 18.000', 'assets/milk4.png'),
        _buildListItem(context, 'Susu SGM', 'Susu formula', 'Rp 30.000', 'assets/milk2.png'),
      ],
    );
  }

  Widget _buildMotherChildList(BuildContext context) {
    return ListView(
      children: [
        _buildListItem(context, 'Popok Bayi', 'Popok ukuran S', 'Rp 50.000', 'assets/ibudananak1.jpg'),
        _buildListItem(context, 'Pembersih Bayi', 'Sabun mandi bayi', 'Rp 15.000', 'assets/ibudananak4.png'),
        _buildListItem(context, 'Pakaian Bayi', 'Baju bayi laki-laki', 'Rp 40.000', 'assets/ibudananak2.jpg'),
        _buildListItem(context, 'Permen Anak', 'Permen rasa buah', 'Rp 5.000', 'assets/ibudananak3.png'),
      ],
    );
  }

  Widget _buildBeautyList(BuildContext context) {
    return ListView(
      children: [
        _buildListItem(context, 'Bedak Tabur', 'Bedak Tabur NARS', 'Rp 35.000', 'assets/kecantikan4.png'),
        _buildListItem(context, 'Lipstik Matte', 'Lipstik warna merah', 'Rp 50.000', 'assets/kecantikan1.jpg'),
        _buildListItem(context, 'Masker Wajah', 'Masker wajah G@G', 'Rp 40.000', 'assets/kecantikan3.png'),
        _buildListItem(context, 'Serum Vitamin C', 'Serum anti-aging', 'Rp 60.000', 'assets/kecantikan2.jpg'),
      ],
    );
  }

  Widget _buildListItem(BuildContext context, String name, String description, String price, String imagePath) {
    return GestureDetector(
      onTap: () {
        _showItemDetails(context, name, price);
      },
      child: Card(
        elevation: 3,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListTile(
          leading: Image.asset(
            imagePath,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
          title: Text(name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(description),
              Text(
                'Harga: $price',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              _addToCart(context, name, price);
            },
          ),
        ),
      ),
    );
  }

  void _showItemDetails(BuildContext context, String itemName, String itemPrice) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(itemName),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Deskripsi: Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
            SizedBox(height: 8),
            Text('Harga: $itemPrice'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Tutup'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _buyItem(context, itemName);
            },
            child: Text('Beli Sekarang'),
          ),
        ],
      ),
    );
  }

  void _buyItem(BuildContext context, String itemName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Berhasil membeli $itemName'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _addToCart(BuildContext context, String itemName, String itemPrice) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Berhasil menambahkan $itemName ke keranjang belanja'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
