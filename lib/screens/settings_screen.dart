import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _qrController = TextEditingController();
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/personal_card.json');
    if (await file.exists()) {
      final jsonData = json.decode(await file.readAsString());
      setState(() {
        _nameController.text = jsonData['name'];
        _phoneController.text = jsonData['phone'];
        _emailController.text = jsonData['email'];
        _qrController.text = jsonData['qr'];
        _textController.text = jsonData['text'];
      });
    }
  }

  Future<void> _saveData() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/personal_card.json');
    final jsonData = {
      'name': _nameController.text,
      'phone': _phoneController.text,
      'email': _emailController.text,
       'qr': _qrController.text,
       'text': _textController.text,
    };
    await file.writeAsString(json.encode(jsonData));
    print('Datos guardados: $jsonData');
    Navigator.pop(context, true); // Regresa a la pantalla principal
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
          ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _qrController,
              decoration: const InputDecoration(labelText: 'QR Link'),
            ),
            TextField(
              controller: _textController,
              decoration: const InputDecoration(labelText: 'Text'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveData,
              child: const Text('Save Settings'),
            ),
          ],
        ),
      ),
    );
  }
}