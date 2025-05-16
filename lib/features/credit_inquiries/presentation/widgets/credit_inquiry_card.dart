import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metropol_mawanda_peter/features/credit_inquiries/model/credit_inquiry_model.dart';
import 'package:metropol_mawanda_peter/features/loan_repayments/model/loan_repayment_model.dart';
import 'package:metropol_mawanda_peter/theme/app_theme.dart';
import 'package:metropol_mawanda_peter/utils/utilities.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreditInquiryCard extends ConsumerWidget {
  final CreditInquiryModel creditInquiryModel;
  const CreditInquiryCard(this.creditInquiryModel, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.sp),
        side: BorderSide(
          color: AppTheme.purpleTextColor.withOpacity(0.4),
          width: 2
        )
      ),
      leading: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.5.sp)
        ),
        width: 20.w,
        height: 10.h,
        child: CachedNetworkImage(imageUrl: creditInquiryModel.url),
      ),
      title: Text(creditInquiryModel.reason, style: AppTheme.cardTitle16,),
      subtitle: Text(creditInquiryModel.institution.toString()),
      trailing: Text(Utilities.formatToUS(creditInquiryModel.inquiryDate), style: AppTheme.priceText16,),
    );
  }
}