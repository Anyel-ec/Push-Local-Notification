import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_local_notification/config/router/app_router.dart';
import 'package:push_local_notification/config/theme/app_theme.dart';
import 'package:push_local_notification/presentation/blocs/notifications/notifications_bloc.dart';
// Import the generated file
import 'firebase_options.dart';

void main() async {
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler); // manejar las notificaciones en segundo plano
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationsBloc.initialFirebaseNotifications(); // inicializar firebase

  runApp(
    MultiBlocProvider( // distribuir en toda la app el bloc para recibir en cualquier lugar las notificaciones
      providers: [
         BlocProvider(create: (_) => NotificationsBloc())
      ]
    , child: const MainApp()
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      debugShowCheckedModeBanner: false, // desactivar el show de debug
      theme: AppTheme().getTheme(),
      routerConfig: appRouter,
    );
  }
}
