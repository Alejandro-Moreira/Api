import 'package:flutter/material.dart';
import '../models/perros.dart';
import '../services/api_services.dart';

class PerrosProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Perros> _perrosList = [];
  bool _isLoading = false;

  List<Perros> get perrosList => _perrosList;
  bool get isLoading => _isLoading;

  Future<void> fetchPerros() async {
    _isLoading = true;
    notifyListeners();

    _perrosList = await _apiService.fetchPerrosList();
    _isLoading = false;
    notifyListeners();
  }
}
