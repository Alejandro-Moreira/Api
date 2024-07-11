import '../models/perros.dart';

class ApiService {
  final String baseUrl = "https://http.dog";

  Future<List<Perros>> fetchPerrosList() async {
    final List<Perros> perrosList = [];

    const List<String> httpCodes = [
      '200',
      '201',
      '202',
      '204',
      '301',
      '302',
      '303',
      '400',
      '401',
      '403',
      '404',
      '405',
      '406',
      '499',
      '500',
      '502',
      '503',
      '504'
    ];

    for (var code in httpCodes) {
      perrosList.add(Perros(url: '$baseUrl/$code.jpg'));
    }

    return perrosList;
  }
}
