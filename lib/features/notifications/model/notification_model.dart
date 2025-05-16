

import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationsModel {

  final String id;
  final String title;
  final String body;
  final DateTime date;
  final bool isSeen;

//<editor-fold desc="Data Methods">
  const NotificationsModel({
    required this.id,
    required this.title,
    required this.body,
    required this.date,
    required this.isSeen,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationsModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          body == other.body &&
          date == other.date &&
          isSeen == other.isSeen
      );

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ body.hashCode ^ date.hashCode ^ isSeen.hashCode;


  @override
  String toString() {
    return 'NotificationsModel{' +
        ' id: $id,' +
        ' title: $title,' +
        ' body: $body,' +
        ' date: $date,' +
        ' isSeen: $isSeen,' +
        '}';
  }

  NotificationsModel copyWith({
    String? id,
    String? title,
    String? body,
    DateTime? date,
    bool? isSeen,
  }) {
    return NotificationsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      date: date ?? this.date,
      isSeen: isSeen ?? this.isSeen,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'date': date,
      'isSeen': isSeen,
    };
  }

  factory NotificationsModel.fromMap(Map<String, dynamic> map) {
    return NotificationsModel(
      id: map['id'] as String,
      title: map['title'] as String,
      body: map['body'] as String,
      date: (map['date'] as Timestamp).toDate(),
      isSeen: map['isSeen'] as bool,

    );
  }

//</editor-fold>
}

