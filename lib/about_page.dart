import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About the Developer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // รูปโปรไฟล์ (รูปภาพธรรมดา)
            Center(
               child: Image.asset(
                'images/profile.jpg', // เปลี่ยนเส้นทางเป็นรูปโปรไฟล์ของคุณ
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            // ข้อมูลผู้พัฒนา
            const Text(
              'Name: [ถิรวัฒน์ ณ ลำปาง]',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Student ID: [6521600460]',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            const Text(
              'Phone: [0988405158]',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
  
          ],
        ),
      ),
    );
  }
}
