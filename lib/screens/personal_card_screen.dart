import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../services/json_loader.dart';
import '../models/personal_card.dart';


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
    personalCard = JsonLoader().loadPersonalCard();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange, // Fondo general naranja
      child: Scaffold(
        backgroundColor: Colors.orange, // Fondo de la pantalla negro
        appBar: AppBar(
          title: const Text('Portinos.com'),
          centerTitle: true,
          backgroundColor: Colors.orange, // Fondo del AppBar negro
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
                  color: Colors.black, // Fondo de la tarjeta negro
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          card.name,
                          style: const TextStyle(fontSize: 36, color: Colors.white), // Texto blanco
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          card.phone,
                          style: const TextStyle(fontSize: 24, color: Colors.white), // Texto blanco
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          card.email,
                          style: const TextStyle(fontSize: 18, color: Colors.white), // Texto blanco
                          textAlign: TextAlign.center,
                        ),
                        if (card.qr != null) ...[
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