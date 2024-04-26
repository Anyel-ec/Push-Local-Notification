import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permisos de notificación'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: solciitar permisos de notificación
            }
          )
        ],
      ),
      body: const _HomeView()
      );
  }
}


class _HomeView extends StatelessWidget {
  const _HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: 
      (context, index) => ListTile(
        title: const Text('Notificación'),
        subtitle: const Text('Descripción de la notificación'),
        trailing: IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
          }
        ),
      ),
    );
  }
}