import 'package:flutter/material.dart';
import 'form_body_info.dart';
import 'about_page.dart'; // นำเข้าหน้าข้อมูลผู้พัฒนา

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'การคำนวณพื้นที่',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('การคำนวณพื้นที่'),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    'การคำนวณพื้นที่',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              // รูปภาพของพื้นที่สี่เหลี่ยม
              Image.asset(
                'images/test2.jpg',
                height: 150,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  elevation: 0, // Shadow scale
                ),
                child: const Text('พื้นที่สี่เหลี่ยม'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FormBodyInfoPage(type: 'rectangle'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              // รูปภาพของพื้นที่วงกลม
              Image.asset(
                'images/test3.jpg',
                height: 150,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  elevation: 0, // Shadow scale
                ),
                child: const Text('พื้นที่วงกลม'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FormBodyInfoPage(type: 'circle'),
                    ),
                  );
                },
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(),
                  ),
                );
              },
              child: const Icon(Icons.person), // ใช้ไอคอนรูปคน
              backgroundColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
