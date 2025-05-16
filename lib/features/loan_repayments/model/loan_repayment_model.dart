
import 'package:cloud_firestore/cloud_firestore.dart';

class LoanRepaymentModel {

  final String id;
  final int amount;
  final DateTime repaymentDate;
  final String lender;
  final String method;
  final String loanApprovalId;
  final DateTime date;
  final String url;


//<editor-fold desc="Data Methods">
  const LoanRepaymentModel({
    required this.id,
    required this.amount,
    required this.repaymentDate,
    required this.lender,
    required this.method,
    required this.loanApprovalId,
    required this.date,
    required this.url,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoanRepaymentModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          amount == other.amount &&
          repaymentDate == other.repaymentDate &&
          lender == other.lender &&
          method == other.method &&
          loanApprovalId == other.loanApprovalId &&
          date == other.date &&
          url == other.url
      );

  @override
  int get hashCode =>
      id.hashCode ^
      amount.hashCode ^
      repaymentDate.hashCode ^
      lender.hashCode ^
      method.hashCode ^
      loanApprovalId.hashCode ^
      loanApprovalId.hashCode;

  @override
  String toString() {
    return 'LoanRepaymentModel{' +
        ' id: $id,' +
        ' amount: $amount,' +
        ' repaymentDate: $repaymentDate,' +
        ' lender: $lender,' +
        ' method: $method,' +
        ' loanApprovalId: $loanApprovalId,' +
        ' date: $date,' +
        ' url: $url,' +
        '}';
  }

  LoanRepaymentModel copyWith({
    String? id,
    int? amount,
    DateTime? repaymentDate,
    String? lender,
    String? method,
    String? loanApprovalId,
    DateTime? date,
    String? url,
  }) {
    return LoanRepaymentModel(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      repaymentDate: repaymentDate ?? this.repaymentDate,
      lender: lender ?? this.lender,
      method: method ?? this.method,
      loanApprovalId: loanApprovalId ?? this.loanApprovalId,
      date: date ?? this.date,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'repaymentDate': repaymentDate,
      'lender': lender,
      'method': method,
      'loanApprovalId': loanApprovalId,
      'date': date,
      'url': url,
    };
  }

  factory LoanRepaymentModel.fromMap(Map<String, dynamic> map) {
    return LoanRepaymentModel(
      id: map['id'] as String,
      amount: map['amount'] as int,
      repaymentDate: (map['repaymentDate'] as Timestamp).toDate(),
      lender: map['lender'] as String,
      method: map['method'] as String,
      loanApprovalId: map['loanApprovalId'] as String,
      date: (map['date'] as Timestamp).toDate(),
      url: map['url'] as String,
    );
  }



//</editor-fold>
}