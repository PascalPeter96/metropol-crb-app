

import 'package:cloud_firestore/cloud_firestore.dart';

class CreditInquiryModel {

  final String id;
  final String institution;
  final String reason;
  final DateTime inquiryDate;
  final String url;

//<editor-fold desc="Data Methods">
  const CreditInquiryModel({
    required this.id,
    required this.institution,
    required this.reason,
    required this.inquiryDate,
    required this.url,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CreditInquiryModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          institution == other.institution &&
          reason == other.reason &&
          inquiryDate == other.inquiryDate &&
          url == other.url
      );

  @override
  int get hashCode =>
      id.hashCode ^
      institution.hashCode ^
      reason.hashCode ^
      inquiryDate.hashCode ^
      url.hashCode
  ;

  @override
  String toString() {
    return 'CreditInquiryModel{' +
        ' id: $id,' +
        ' institution: $institution,' +
        ' reason: $reason,' +
        ' inquiryDate: $inquiryDate,' +
        ' url: $url,' +
        '}';
  }

  CreditInquiryModel copyWith({
    String? id,
    String? institution,
    String? reason,
    DateTime? inquiryDate,
    String? url,
  }) {
    return CreditInquiryModel(
      id: id ?? this.id,
      institution: institution ?? this.institution,
      reason: reason ?? this.reason,
      inquiryDate: inquiryDate ?? this.inquiryDate,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'institution': institution,
      'reason': reason,
      'inquiryDate': inquiryDate,
      'url': url,
    };
  }

  factory CreditInquiryModel.fromMap(Map<String, dynamic> map) {
    return CreditInquiryModel(
      id: map['id'] as String,
      institution: map['institution'] as String,
      reason: map['reason'] as String,
      inquiryDate: (map['inquiryDate'] as Timestamp).toDate(),
      url: map['url'] as String,
    );
  }

//</editor-fold>
}

