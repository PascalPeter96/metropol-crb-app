import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metropol_mawanda_peter/features/auth/data/auth_repository.dart';
import 'package:metropol_mawanda_peter/features/loan_repayments/data/loan_repayment_repository.dart';
import 'package:metropol_mawanda_peter/features/loan_repayments/model/loan_repayment_model.dart';
import 'package:metropol_mawanda_peter/features/loan_repayments/presentation/controllers/loan_repayment_controller.dart';
import 'package:metropol_mawanda_peter/features/loan_repayments/presentation/widgets/loan_repayment_card.dart';
import 'package:metropol_mawanda_peter/services/notifications/notification_service.dart';
import 'package:metropol_mawanda_peter/theme/app_theme.dart';
import 'package:metropol_mawanda_peter/widgets/app_header.dart';
import 'package:metropol_mawanda_peter/widgets/app_text_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoanRepaymentsScreen extends ConsumerStatefulWidget {
  const LoanRepaymentsScreen({super.key});

  @override
  ConsumerState createState() => _LoanRepaymentsScreenState();
}

class _LoanRepaymentsScreenState extends ConsumerState<LoanRepaymentsScreen> {

  @override
  Widget build(BuildContext context) {
    final userId = ref.watch(currentUserProvider)?.uid;
    final loanRepayments = ref.watch(getLoanRepaymentsProvider(userId ?? ''));
    return Scaffold(
      appBar: AppCustomHeader(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: AppTheme.primaryColor,
              child: Padding(padding: AppTheme.mainCardAxisPadding,
                child: Text((loanRepayments.isLoading || loanRepayments.hasError) ? '0' : loanRepayments.value!.length.toString(), style: AppTheme.whiteButtonText,)
              ),
            ),
            Text((loanRepayments.isLoading || loanRepayments.hasError) ? 'Loan Repayments' :loanRepayments.value!.length <= 1 ? 'Loan Repayment' : 'Loan Repayments', style: AppTheme.appHeader,)
          ],
        ),
        actions: [
        ],
      ),


      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          children: [

            SizedBox(height: 3.h,),
            loanRepayments.when(
                data: (data) {
                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async{
                          ref.refresh(getLoanRepaymentsProvider(userId ?? ''));
                      },
                      child: ListView.builder(
                        itemCount: data.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                        var lr = data[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Bounceable(
                            onTap: () async{
                              final SharedPreferences prefs = await SharedPreferences.getInstance();
                              final String? fcm = prefs.getString('fcm');

                              print('my fcm $fcm');

                              DocumentReference loanRef = FirebaseFirestore.instance.collection('users').doc(userId).collection('loanRepayments').doc();
                              await loanRef.set({
                                'id' : loanRef.id,
                                'amount' : 2000,
                                'date': DateTime.now(),
                                'lender' : 'Equity Uganda',
                                'method' :'E-Loan',
                                'repaymentDate': DateTime.now(),
                                'loanApprovalId' : '1',
                                'url': 'https://equitygroupholdings.com/wp-content/themes/equity/assets/img/equity-bank-logo.png'
                              });
                              await NotificationService.sendNoficationToselectedUser(
                                deviceToken: fcm.toString(),
                                title:
                                'Repaid Equity Loan',
                                type: 'loanRepayments',
                                recieverId: '',
                                senderId: '',
                                data: {},
                                body:
                                'Repaid Loan of 2000 UGX',
                                channelId: '',

                              );
                            },
                              child: LoanRepaymentCard(lr)),
                        );
                      }),
                    ),
                  );
                }, error: (e, st) {
                  return Text(e.toString());
            }, loading: (){
              return Expanded(
                child: Skeletonizer(
                  enabled: true,
                  child: ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return LoanRepaymentCard(LoanRepaymentModel(id: 'id', amount: 0, repaymentDate: DateTime.now(), lender: 'lender', method: 'method', loanApprovalId: 'loanApprovalId', date: DateTime.now(), url: 'https://equitygroupholdings.com/wp-content/themes/equity/assets/img/equity-bank-logo.png'));
                      }),
                ),
              );
            }),
          ],
        ),
      ),

    );
  }
}
