

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metropol_mawanda_peter/theme/app_theme.dart';

extension AsyncValueResponse on AsyncValue {

  void showAlertToast(BuildContext context) {
    if(!isLoading && hasError) {
      final message = _errorMessage(error);
      CherryToast.error(

          description:  Text(message.toString(),),

          animationType:  AnimationType.fromTop,

          animationDuration:  Duration(milliseconds:  1000),

          autoDismiss:  true

      ).show(context);
    }
  }

}

String _errorMessage(Object? error) {

  if(error is FirebaseAuthException) {
    return error.message ?? error.toString();
  } else {
    return error.toString();
  }
}