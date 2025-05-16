

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metropol_mawanda_peter/features/loan_approvals/model/loan_approval_model.dart';
import 'package:metropol_mawanda_peter/features/loan_repayments/model/loan_repayment_model.dart';
import 'package:metropol_mawanda_peter/features/loan_repayments/presentation/controllers/loan_repayment_controller.dart';
import 'package:metropol_mawanda_peter/routes/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'loan_approval_repository.g.dart';


@Riverpod(keepAlive: true)
LoanApprovalRepository loanApprovalRepository(LoanApprovalRepositoryRef ref) {
  return LoanApprovalRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<List<LoanApprovalModel>> getLoanApprovals(GetLoanApprovalsRef ref, String userId) {
  final firebaseRepository = ref.watch(loanApprovalRepositoryProvider);
  return firebaseRepository.getLoanApprovals(userId);
}



class LoanApprovalRepository {

  LoanApprovalRepository(this._firestore);

  final FirebaseFirestore _firestore;

  Future<void> addLoanApproval(
      LoanApprovalModel loanApprovalModel, String userId) async {
    final docRef = await _firestore
        .collection('users')
        .doc(userId)
        .collection('loanApprovals')
        .add(loanApprovalModel.toMap());
    await docRef.update({'id': docRef.id});
  }


  Stream<List<LoanApprovalModel>> getLoanApprovals(String userId) {
    return FirebaseFirestore.instance.collection('users')
        .doc(userId)
        .collection('loanApprovals')
        .orderBy('approvedDate', descending: true)
        .snapshots()
        .map((querySnap) =>
        querySnap.docs.map((doc) => LoanApprovalModel.fromMap(doc.data())).toList()
    );
  }



}