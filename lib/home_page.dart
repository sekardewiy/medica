import 'package:flutter/material.dart';
import 'SpecialistDoctorPage.dart'; // Import halaman spesialis dokter
import 'belanja_kategori_page.dart'; // Import halaman belanja kategori
import 'appointment_page.dart'; // Import halaman buat janji offline

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    NotificationTab(),
    RiwayatTab(),
    ProfileTab(), // Tambahkan ProfileTab
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile dan Nama Pengguna
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nama Pengguna',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 16),
                          SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              'Alamat Pengguna',
                              style: TextStyle(fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            // Tiga Icon dengan Nama
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFeatureItem(
                  Icons.chat,
                  'Chat dengan Dokter',
                  () {
                    // Navigasi ke halaman rekomendasi dokter
                    Navigator.pushNamed(context, '/doctor_recommendation');
                  },
                ),
                _buildFeatureItem(Icons.store, 'Toko Kesehatan', () {
                  // Navigasi ke halaman belanja sesuai kategori
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BelanjaKategoriPage()),
                  );
                }),
                _buildFeatureItem(Icons.calendar_today, 'Buat Janji Offline', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppointmentPage()),
                  );
                }),
              ],
            ),
            SizedBox(height: 30),
            // Tulisan Spesialis
            Text(
              'Spesialis',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Kolom Spesialis dengan Icon
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildSpecialistItem(context, 'Cardiology', Icons.favorite),
                _buildSpecialistItem(context, 'Dermatology', Icons.face),
                _buildSpecialistItem(context, 'Gynecology', Icons.pregnant_woman),
                _buildSpecialistItem(context, 'General Medicine', Icons.healing),
                _buildSpecialistItem(context, 'Odontology', Icons.local_hospital),
                _buildSpecialistItem(context, 'Oncology', Icons.healing_outlined),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData iconData, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue,
            child: Icon(iconData, size: 30, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildSpecialistItem(BuildContext context, String label, IconData iconData) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SpecialistDoctorsPage(specialist: label),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white, // Set background to white
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue, width: 2), // Add blue border
        ),
        child: Row(
          children: [
            Icon(
              iconData,
              color: Colors.blue, // Set icon color to blue
            ),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(color: Colors.blue), // Set text color to blue
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notifikasi Kesehatan Hari Ini',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildHealthNotification(
              'Pentingnya Mengonsumsi Air Putih',
              'Pastikan Anda cukup minum air putih setiap hari untuk menjaga kesehatan tubuh.',
              Icons.local_drink,
            ),
            _buildHealthNotification(
              'Tips Menjaga Kesehatan Mental',
              'Cobalah untuk beristirahat yang cukup dan hindari stres berlebihan dalam menjaga kesehatan mental Anda.',
              Icons.self_improvement,
            ),
            _buildHealthNotification(
              'Manfaat Olahraga Rutin',
              'Olahraga rutin dapat meningkatkan kebugaran dan menjaga kesehatan jantung.',
              Icons.directions_run,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHealthNotification(String title, String description, IconData iconData) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            iconData,
            color: Colors.blue,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RiwayatTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Riwayat Aktivitas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildActivityHistory(
              'Membeli Obat di Toko Kesehatan',
              'Anda telah membeli obat di Toko Kesehatan pada 20 Juni 2023.',
              Icons.shopping_cart,
            ),
            _buildActivityHistory(
              'Chat dengan Dokter',
              'Anda telah melakukan chat dengan dokter pada 22 Juni 2023.',
              Icons.chat,
            ),
            _buildActivityHistory(
              'Konsultasi dengan Dokter',
              'Anda telah melakukan konsultasi dengan dokter pada 23 Juni 2023.',
              Icons.medical_services,
            ),
            _buildActivityHistory(
              'Resep Dokter',
              'Anda telah menerima resep dokter pada 24 Juni 2023.',
              Icons.receipt,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityHistory(String title, String description, IconData iconData) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            iconData,
            color: Colors.blue,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture and Name
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nama Pengguna',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'email@example.com',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            // Account Settings
            Text(
              'Pengaturan Akun',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildProfileOption(
              'Informasi Pribadi',
              'Update nama, email, dan informasi pribadi lainnya.',
              Icons.person,
              () {
                // Navigate to personal information page
              },
            ),
            _buildProfileOption(
              'Keamanan',
              'Update kata sandi dan pengaturan keamanan lainnya.',
              Icons.lock,
              () {
                // Navigate to security settings page
              },
            ),
            _buildProfileOption(
              'Pengaturan Aplikasi',
              'Update pengaturan aplikasi dan preferensi.',
              Icons.settings,
              () {
                // Navigate to app settings page
              },
            ),
            _buildProfileOption(
              'Bantuan',
              'Hubungi dukungan dan lihat FAQ.',
              Icons.help,
              () {
                // Navigate to help and FAQ page
              },
            ),
            _buildProfileOption(
              'Keluar',
              'Keluar dari aplikasi.',
              Icons.logout,
              () {
                // Log out the user
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(String title, String subtitle, IconData iconData, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Icon(iconData, color: Colors.blue),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
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

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
    },
  ));
}
