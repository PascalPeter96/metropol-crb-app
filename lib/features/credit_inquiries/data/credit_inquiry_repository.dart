

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metropol_mawanda_peter/features/credit_inquiries/model/credit_inquiry_model.dart';
import 'package:metropol_mawanda_peter/features/loan_repayments/model/loan_repayment_model.dart';
import 'package:metropol_mawanda_peter/features/loan_repayments/presentation/controllers/loan_repayment_controller.dart';
import 'package:metropol_mawanda_peter/routes/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'credit_inquiry_repository.g.dart';


@Riverpod(keepAlive: true)
CreditInquiryRepository creditInquiryRepository(CreditInquiryRepositoryRef ref) {
  return CreditInquiryRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<List<CreditInquiryModel>> getCreditInquiries(GetCreditInquiriesRef ref, String userId) {
  final firebaseRepository = ref.watch(creditInquiryRepositoryProvider);
  return firebaseRepository.getCreditInquiries(userId);
}



class CreditInquiryRepository {

  CreditInquiryRepository(this._firestore);

  final FirebaseFirestore _firestore;

  Future<void> addCreditInquiry(
      CreditInquiryModel creditInquiryModel, String userId) async {
    final docRef = await _firestore
        .collection('users')
        .doc(userId)
        .collection('creditInquiries')
        .add(creditInquiryModel.toMap());
    await docRef.update({'id': docRef.id});
  }


  Stream<List<CreditInquiryModel>> getCreditInquiries(String userId) {
    return FirebaseFirestore.instance.collection('users')
        .doc(userId)
        .collection('creditInquiries')
        .orderBy('inquiryDate', descending: true)
        .snapshots()
        .map((querySnap) =>
        querySnap.docs.map((doc) => CreditInquiryModel.fromMap(doc.data())).toList()
    );
  }



}