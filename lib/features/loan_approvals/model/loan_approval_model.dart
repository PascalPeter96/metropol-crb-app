import 'package:cloud_firestore/cloud_firestore.dart';

class LoanApprovalModel {

  final String id;
  final int amount;
  final String lender;
  final DateTime approvedDate;
  final String status;
  final String url;

//<editor-fold desc="Data Methods">
  const LoanApprovalModel({
    required this.id,
    required this.amount,
    required this.lender,
    required this.approvedDate,
    required this.status,
    required this.url,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoanApprovalModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          amount == other.amount &&
          lender == other.lender &&
          approvedDate == other.approvedDate &&
          status == other.status &&
          url == other.url
      );

  @override
  int get hashCode =>
      id.hashCode ^
      amount.hashCode ^
      lender.hashCode ^
      approvedDate.hashCode ^
      status.hashCode ^
      url.hashCode;

  @override
  String toString() {
    return 'LoanApprovalModel{' +
        ' id: $id,' +
        ' amount: $amount,' +
        ' lender: $lender,' +
        ' approvedDate: $approvedDate,' +
        ' status: $status,' +
        ' url: $url,' +
        '}';
  }

  LoanApprovalModel copyWith({
    String? id,
    int? amount,
    String? lender,
    DateTime? approvedDate,
    String? status,
    String? url,
  }) {
    return LoanApprovalModel(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      lender: lender ?? this.lender,
      approvedDate: approvedDate ?? this.approvedDate,
      status: status ?? this.status,
      url: status ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'lender': lender,
      'approvedDate': approvedDate,
      'status': status,
      'url': url,
    };
  }

  factory LoanApprovalModel.fromMap(Map<String, dynamic> map) {
    return LoanApprovalModel(
      id: map['id'] as String,
      amount: map['amount'] as int,
      lender: map['lender'] as String,
      approvedDate: (map['approvedDate'] as Timestamp).toDate(),
      status: map['status'] as String,
      url: map['url'] as String,
    );
  }

//</editor-fold>
}