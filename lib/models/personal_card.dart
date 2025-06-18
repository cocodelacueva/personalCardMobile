class PersonalCard {
  final String name;
  final String phone;
  final String email;
  final String? qr; // Campo opcional
  final String? text; // Campo opcional

  PersonalCard({
    required this.name,
    required this.phone,
    required this.email,
    this.qr,
    this.text,
  });

  factory PersonalCard.fromJson(Map<String, dynamic> json) {
    return PersonalCard(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      qr: json['qr'], // Obtiene el campo qr si existe
      text: json['text'], // Obtiene el campo qr si existe
    );
  }
}