import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../services/json_loader.dart';
import '../models/personal_card.dart';
import 'settings_screen.dart'; // Importa la nueva pantalla de configuración

class PersonalCardScreen extends StatefulWidget {
  const PersonalCardScreen({Key? key}) : super(key: key);

  @override
  _PersonalCardScreenState createState() => _PersonalCardScreenState();
}

class _PersonalCardScreenState extends State<PersonalCardScreen> {
  late Future<PersonalCard> personalCard;

  @override
  void initState() {
    super.initState();
    _loadPersonalCard();
  }

  void _loadPersonalCard() async {
    final loadedCard = await JsonLoader().loadPersonalCard(); // Espera el resultado del Future
    setState(() {
      personalCard = Future.value(loadedCard); // Actualiza el Future con los datos cargados
    });
    print('Datos cargados: ${loadedCard.name}, ${loadedCard.phone}, ${loadedCard.email}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          title: const Text('Portinos.com'),
          centerTitle: true,
          backgroundColor: Colors.orange,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () async {
                // Espera el resultado de la pantalla de configuración
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsScreen()),
                );
                if (result == true) {
                  // Recarga los datos si se guardaron cambios
                  _loadPersonalCard();
                }
              },
            ),
          ],
        ),
        body: FutureBuilder<PersonalCard>(
          future: personalCard,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading data', style: TextStyle(color: Colors.white)));
            } else if (snapshot.hasData) {
              final card = snapshot.data!;
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.all(16.0),
                child: Card(
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          card.name,
                          style: const TextStyle(fontSize: 36, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          card.phone,
                          style: const TextStyle(fontSize: 24, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          card.email,
                          style: const TextStyle(fontSize: 18, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),if (card.qr != null) ...[
                          const SizedBox(height: 20),
                          QrImageView(
                            data: card.qr!,
                            version: QrVersions.auto,
                            size: 200.0,
                            backgroundColor: Colors.white, // Fondo del QR blanco
                            errorCorrectionLevel: QrErrorCorrectLevel.M,
                          ),
                        ],
                        if (card.text != null) ...[
                          const SizedBox(height: 20),
                          Text(
                            card.text!,
                            style: const TextStyle(fontSize: 16, color: Colors.white), // Texto blanco
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Center(child: Text('No data available', style: TextStyle(color: Colors.white)));
            }
          },
        ),
      ),
    );
  }
}