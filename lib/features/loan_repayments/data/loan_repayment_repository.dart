

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metropol_mawanda_peter/features/loan_repayments/model/loan_repayment_model.dart';
import 'package:metropol_mawanda_peter/features/loan_repayments/presentation/controllers/loan_repayment_controller.dart';
import 'package:metropol_mawanda_peter/routes/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'loan_repayment_repository.g.dart';


@Riverpod(keepAlive: true)
LoanRepaymentRepository loanRepaymentRepository(LoanRepaymentRepositoryRef ref) {
  return LoanRepaymentRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<List<LoanRepaymentModel>> getLoanRepayments(GetLoanRepaymentsRef ref, String userId) {
  final firebaseRepository = ref.watch(loanRepaymentRepositoryProvider);
  return firebaseRepository.getLoanRepayments(userId);
}



class LoanRepaymentRepository {

  LoanRepaymentRepository(this._firestore);

  final FirebaseFirestore _firestore;

  Future<void> addLoanRepayment(
      LoanRepaymentModel loanRepaymentModel, String userId) async {
    final docRef = await _firestore
        .collection('users')
        .doc(userId)
        .collection('loanRepayments')
        .add(loanRepaymentModel.toMap());
    await docRef.update({'id': docRef.id});
  }


  Stream<List<LoanRepaymentModel>> getLoanRepayments(String userId) {
    return FirebaseFirestore.instance.collection('users')
        .doc(userId)
        .collection('loanRepayments')
        .orderBy('date', descending: true)
        .snapshots()
        .map((querySnap) =>
        querySnap.docs.map((doc) => LoanRepaymentModel.fromMap(doc.data())).toList()
    );
  }



}