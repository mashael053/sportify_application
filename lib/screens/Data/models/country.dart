class Country {
  final String name;
  final String code;

  Country({required this.name, required this.code});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['country_name'],
      code: json['country_code'],
    );
  }
}
