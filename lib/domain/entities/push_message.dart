class PushMessage {
  final String messageId;
  final String title;
  final String body;
  final DateTime sentDate;
  final Map<String, dynamic>? data;
  final String? imageUrl;

  PushMessage({
    required this.messageId,
    required this.sentDate,
    required this.title,
    required this.body,
    this.data,
    this.imageUrl,
  });

  @override
  String toString() {
    return '''
  PushMessage: $messageId, 
  title: $title,
  body: $body,
  sentDate: $sentDate,
  data: $data,
  imageUrl: $imageUrl
  
    ''';
  }
}
