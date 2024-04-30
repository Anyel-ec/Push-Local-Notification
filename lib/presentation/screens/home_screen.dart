import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_local_notification/presentation/blocs/notifications/notifications_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (NotificationsBloc bloc) => Text('${bloc.state.status}')), // mostrar el estado de las notificaciones
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.read<NotificationsBloc>().requestPermission();
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
          icon: const Icon(
            Icons.notifications),
          onPressed: () {
          }
        ),
      ),
    );
  }
}