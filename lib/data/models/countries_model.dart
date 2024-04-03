class Country {
  String countryKey;
  String countryName;
  String countryIso2;
  String? countryLogo; // Make countryLogo nullable
  Country({
    required this.countryKey,
    required this.countryName,
    required this.countryIso2,
    this.countryLogo, // Update the constructor to accept a nullable countryLogo
  });
  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      countryKey: json['country_key'].toString(),
      countryName: json['country_name'].toString(),
      countryIso2: json['country_iso2'].toString(),
      countryLogo: json['country_logo'], // countryLogo may be null
    );
  }
}

