import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/personal_card.dart';

class JsonLoader {
  Future<PersonalCard> loadPersonalCard() async {
    final String jsonString = await rootBundle.loadString('assets/data/personal_card.json');
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    return PersonalCard.fromJson(jsonData);
  }
}