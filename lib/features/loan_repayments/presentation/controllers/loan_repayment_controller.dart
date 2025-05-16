

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metropol_mawanda_peter/features/loan_repayments/data/loan_repayment_repository.dart';
import 'package:metropol_mawanda_peter/features/loan_repayments/model/loan_repayment_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'loan_repayment_controller.g.dart';


@riverpod
class LoanRepaymentController extends _$LoanRepaymentController {
  @override
  FutureOr<void> build() {
    // TODO: implement build
    throw UnimplementedError();
  }


  Future<void> addLoan(LoanRepaymentModel loanRepaymentModel, String userId) async {
    state = const AsyncLoading();
    final loanRepaymentRepo = ref.read(loanRepaymentRepositoryProvider);
    state = await AsyncValue.guard(() =>
        loanRepaymentRepo.addLoanRepayment(loanRepaymentModel, userId)
    );
  }


}



