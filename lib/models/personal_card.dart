class PersonalCard {
  final String name;
  final String phone;
  final String email;
  final String? linkedin; // Campo opcional
  final String? text; // Campo opcional

  PersonalCard({
    required this.name,
    required this.phone,
    required this.email,
    this.linkedin,
    this.text,
  });

  factory PersonalCard.fromJson(Map<String, dynamic> json) {
    return PersonalCard(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      linkedin: json['linkedin'], // Obtiene el campo linkedin si existe
      text: json['text'], // Obtiene el campo linkedin si existe
    );
  }
}