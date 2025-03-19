class Eventmodel {
  static const String colllectionEvent = "Event";
  String id;
  String title;
  String description;
  DateTime dateTime;
  String time;
  bool isFavorite;

  Eventmodel({
    this.id = '',
    required this.title,
    required this.description,
    required this.dateTime,
    required this.time,
    this.isFavorite = false,
  });

  // Convert object to Firestore-compatible format
  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'time': time,
      'isFavorite': isFavorite,
    };
  }

  // Named constructor to create an object from Firestore data
  factory Eventmodel.fromFireStore(Map<String, dynamic> data) {
    return Eventmodel(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      dateTime: DateTime.fromMillisecondsSinceEpoch(data['dateTime'] ?? 0),
      time: data['time'] ?? '',
      isFavorite: data['isFavorite'] ?? false,
    );
  }
}
