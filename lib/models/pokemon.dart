class Perros{
  final String name;
  final String url;
  final String image;

  Perros({required this.name, required this.url, required this.image});

  factory Perros.fromJson(Map<String, dynamic>json){
    return Perros(
      name: json['name'], 
      url: json['url'],
      image: 'https://http.dog/[code].jpg'
      );
  }
}