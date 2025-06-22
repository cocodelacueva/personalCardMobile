import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import '../models/personal_card.dart';

class JsonLoader {
  Future<PersonalCard> loadPersonalCard() async {
    final directory = await getApplicationDocumentsDirectory();
    final localFile = File('${directory.path}/personal_card.json');

    if (await localFile.exists()) {
      // Cargar desde el almacenamiento local
      final jsonData = json.decode(await localFile.readAsString());
      print('Cargando datos desde almacenamiento local: $jsonData');
      return PersonalCard.fromJson(jsonData);
    } else {
      // Cargar desde los assets
      final jsonString = await rootBundle.loadString('assets/data/personal_card.json');
      final jsonData = json.decode(jsonString);
      print('Cargando datos desde assets: $jsonData');
      return PersonalCard.fromJson(jsonData);
    }
  }
}