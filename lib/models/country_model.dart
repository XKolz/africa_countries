class Country {
  final String name;
  final String capital;
  final String flag;
  final String languages;

  Country({
    required this.name,
    required this.capital,
    required this.flag,
    required this.languages,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'] ?? 'Unknown',
      capital: (json['capital'] as List<dynamic>?)?.first ?? 'No Capital',
      flag: json['flags']['png'],
      languages: json['languages'] != null
          ? (json['languages'] as Map<String, dynamic>).values.join(', ')
          : 'Unknown',
    );
  }
}
