import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokemon.dart';

class ApiService {
  final String baseUrl = "https://http.dog";

  Future<List<Perros>> fetchPerrosList() async {
    final response = await http.get(Uri.parse('$baseUrl/perro?limit=5'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List results = data['results'];
      return results.map((e) => Perros.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load Pokémon');
    }
  }
}