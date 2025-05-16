import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';



class NotificationsServiceController {

  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future <void> onNotificationCreatedMethod(ReceivedNotification receivedNotification) async {
    debugPrint('onNotificationCreatedMethod $receivedNotification');
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future <void> onNotificationDisplayedMethod(ReceivedNotification receivedNotification) async {

    debugPrint('onNotificationDisplayedMethod $receivedNotification');


  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future <void> onDismissActionReceivedMethod(ReceivedAction receivedAction) async {
    debugPrint('onDismissActionReceivedMethod $receivedAction');

  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future <void> onActionReceivedMethod(ReceivedAction notification) async {

    debugPrint('onActionReceivedMethod $notification');
    print('tapped on notification');

    final payload = notification.payload ?? {};

    print('notify payload is $payload');

    if(payload['type'] == 'doorbell'){
      print('${payload['type']} go door_bell');



    } else if(payload['type'] == 'panic') {


      print('${payload['type']} go panic');


    } else {
      print('tapped on something else');

    }



  }
}