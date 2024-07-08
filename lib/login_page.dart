import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                signIn(context);
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  void signIn(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Validasi email
    if (!validateEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Format email tidak valid. Harap periksa kembali.')),
      );
      return;
    }

    // Validasi password
    if (!validatePassword(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password harus memiliki setidaknya 6 karakter dan mengandung huruf besar, huruf kecil, serta angka atau karakter khusus.')),
      );
      return;
    }

    // Lanjutkan dengan proses sign-in
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Navigate to home page or handle successful sign-in
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Format email tidak valid. Harap periksa alamat email Anda.')),
        );
      } else if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Pengguna dengan email tersebut tidak ditemukan.')),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password yang dimasukkan salah. Silakan coba lagi.')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal masuk. Silakan coba lagi nanti.')),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $e')),
      );
    }
  }

  bool validateEmail(String email) {
    // Implement your email validation logic here
    // Example: Check if email contains '@' and '.'
    return email.contains('@') && email.contains('.');
  }

  bool validatePassword(String password) {
    // Implement your password validation logic here
    // Example: Check if password length is at least 6 characters
    return password.length >= 6;
  }
}
