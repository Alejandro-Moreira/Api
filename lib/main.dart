import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/pokemon_provider.dart';
import 'models/pokemon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PerrosProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter PokeAPI Demo',
        home: PerrosListScreen(),
      ),
    );
  }
}

class PerrosListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokémon List'),
      ),
      body: Consumer<PerrosProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: provider.perrosList.length,
            itemBuilder: (context, index) {
              Perros perros = provider.perrosList[index];
              return ListTile(
                title: Text(perros.name),
                onTap: () {
                  // Puedes agregar una navegación a un detalle de Pokémon aquí
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<PerrosProvider>(context, listen: false).fetchPerros();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}