import 'package:flutter/material.dart';
import 'validators.dart'; // นำเข้า validators ที่คุณใช้

class FormBodyInfoPage extends StatefulWidget {
  final String type;

  const FormBodyInfoPage({Key? key, required this.type}) : super(key: key);

  @override
  _FormBodyInfoPageState createState() => _FormBodyInfoPageState();
}

class _FormBodyInfoPageState extends State<FormBodyInfoPage> {
  final _formKey = GlobalKey<FormState>();
  final _lengthController = TextEditingController();
  final _widthController = TextEditingController();
  final _radiusController = TextEditingController();
  double _area = 0.0; // ตัวแปรเก็บผลลัพธ์ของการคำนวณพื้นที่

  // ฟังก์ชันคำนวณพื้นที่
  void _calculateArea() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        if (widget.type == 'rectangle') { // ถ้าประเภทคือ 'rectangle'
          final length = double.tryParse(_lengthController.text) ?? 0;
          final width = double.tryParse(_widthController.text) ?? 0;
          _area = length * width; // คำนวณพื้นที่ของสี่เหลี่ยมผืนผ้า
        } else if (widget.type == 'circle') { // ถ้าประเภทคือ 'circle'
          final radius = double.tryParse(_radiusController.text) ?? 0;
          _area = 3.14159 * radius * radius; // คำนวณพื้นที่ของวงกลม
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.type == 'rectangle' ? 'พื้นที่สี่เหลี่ยมผืนผ้า' : 'พื้นที่วงกลม'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // แสดงรูปภาพที่เกี่ยวข้องกับการคำนวณ
            Center(
              child: Image.asset(
                widget.type == 'rectangle' ? 'images/test2.jpg' : 'images/test3.jpg',
                height: 150,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // ฟิลด์กรอกข้อมูลตามประเภทที่เลือก
                  if (widget.type == 'rectangle') ...[
                    TextFormField(
                      controller: _lengthController,
                      decoration: const InputDecoration(labelText: 'ความยาว (หน่วยเป็นซม)'),
                      keyboardType: TextInputType.number,
                      validator: Validator.validateInput,
                    ),
                    TextFormField(
                      controller: _widthController,
                      decoration: const InputDecoration(labelText: 'ความกว้าง (หน่วยเป็นซม)'),
                      keyboardType: TextInputType.number,
                      validator: Validator.validateInput,
                    ),
                  ] else if (widget.type == 'circle') ...[
                    TextFormField(
                      controller: _radiusController,
                      decoration: const InputDecoration(labelText: 'รัศมี (หน่วยเป็นซม)'),
                      keyboardType: TextInputType.number,
                      validator: Validator.validateInput,
                    ),
                  ],
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _calculateArea,
                    child: const Text('คำนวณพื้นที่'),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'พื้นที่: ${_area.toStringAsFixed(2)} ตารางหน่วย', // แสดงผลลัพธ์เป็นตารางเซนติเมตร
                    style: const TextStyle(fontSize: 24),
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
