import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:push_local_notification/firebase_options.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  FirebaseMessaging messaging = FirebaseMessaging
      .instance; // nivel global para acceder a la instancia de firebase

  NotificationsBloc() : super(const NotificationsState()) {
    on<NotificationStatusChanged>(_notificationStatusChanged);

    _initianStatusCheck(); // acceso a los settings de las notificaciones --verifica el estado de las notificaciones
    _getFCMToken(); // obtener el token de notificaciones
    _onForegroundMessage(); // cuando la persona tenga la app abierta
  }

  static Future<void> initialFirebaseNotifications() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  void _notificationStatusChanged(
      NotificationStatusChanged event, Emitter<NotificationsState> emit) {
    //emitir el nuevo estado
    emit(state.copyWith(status: event.status));
  }

  void _initianStatusCheck() async {
    final setting = await messaging.getNotificationSettings();
    add(NotificationStatusChanged(setting
        .authorizationStatus)); // obtener el estado de las notificaciones
    _getFCMToken(); // obtener el token de notificaciones
    /*
    un usuario tiene múltiples tokens de notificaciones
        cyberdevmatrix: [
            token1, token2, token3
        ]
    */
  }

  void _handleRemoteMessage(RemoteMessage message) {
    print('Notification: ${message.notification?.title}');
    print('Notification: ${message.notification?.body}');

    if (message.notification == null) return;

    print ('Notification: ${message.notification?.title}');
  }


  void _onForegroundMessage() { // cuando la persona tenga la app abierta
    FirebaseMessaging.onMessage.listen((RemoteMessage message) { // escuchar los mensajes, siempre escuchandoi 
      _handleRemoteMessage(message); // mostrar el mensaje
    });
   
  }

  // obtener el token de notificaciones
  void _getFCMToken() async {
    final setting = await messaging.getNotificationSettings();

    if (setting.authorizationStatus == AuthorizationStatus.authorized) {
      String? token = await messaging.getToken();
      print('Token: $token');
    }
  }

  // un metodo del bloc
  void requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true, // alerta crítica
      provisional: false,
      sound: true,
    );

    add(NotificationStatusChanged(settings.authorizationStatus));
  }
}
