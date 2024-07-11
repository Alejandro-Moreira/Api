import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/perros_provider.dart';
import 'models/perros.dart';

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
        title: 'Flutter Dogs API Demo',
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
        title: Text('Lista de Perros'),
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
                leading: Image.network(perros.url),
                title: Text('Imagen ${index + 1}'),
                onTap: () {
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
