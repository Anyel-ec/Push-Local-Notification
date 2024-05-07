part of 'notifications_bloc.dart';

class NotificationsState extends Equatable {

  final AuthorizationStatus status; // estado de la autorización

  final List<PushMessage> notifications;

  const NotificationsState({
    this.status = AuthorizationStatus.notDetermined, // estado inicial
    this.notifications = const [],
  });

  // para crear copias del estado
  NotificationsState copyWith({ 
    AuthorizationStatus? status,
    List<PushMessage>? notifications,
  }) {
    return NotificationsState(
      status: status ?? this.status,
      notifications: notifications ?? this.notifications,
    );
  }

  @override
  List<Object> get props => [status, notifications];
}
