class Perros {
  final String url;

  Perros({required this.url});

  factory Perros.fromJson(Map<String, dynamic> json) {
    return Perros(
      url: json['url'],
    );
  }
}
