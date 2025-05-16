

import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}


Future<void> createLoanApprovalsNotification (
    String title, String body, Map<String, String> payload,
    )async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: 'loanApprovals',
      title: title,
      body: body,
      summary: 'loanApprovals',
      notificationLayout: NotificationLayout.Default,
      displayOnBackground: true,
      displayOnForeground: true,
      wakeUpScreen: true,
      fullScreenIntent: true,
      criticalAlert: true,
      payload: payload,
      // autoDismissible: false,
      // bigPicture: bigPictureUrl,
      // largeIcon: bigPictureUrl,


    ),


  );
}


Future<void> createLoanRepaymentsNotification (
    String title, String body, Map<String, String> payload,
    )async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: 'loanRepayments',
      title: title,
      body: body,
      summary: 'loanRepayments',
      notificationLayout: NotificationLayout.Default,
      displayOnBackground: true,
      displayOnForeground: true,
      wakeUpScreen: true,
      fullScreenIntent: true,
      criticalAlert: true,
      payload: payload,
      // bigPicture: bigPictureUrl,
      // largeIcon: bigPictureUrl,



    ),



  );
}



Future<void> createCreditInquiriesNotification (
    String title, String body, Map<String, String> payload
    )async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: 'creditInquiries',
      title: title,
      body: body,
      summary: 'creditInquiries',
      notificationLayout: NotificationLayout.Default,
      displayOnBackground: true,
      displayOnForeground: true,
      wakeUpScreen: true,
      fullScreenIntent: true,
      criticalAlert: true,
      payload: payload,
      // bigPicture: bigPictureUrl,
      // largeIcon: bigPictureUrl,


    ),


  );
}


Future<void> createMetropolNotification (
    String title, String body, Map<String, String> payload,
    )async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: 'metropol',
      title: title,
      body: body,
      summary: 'metropol',
      notificationLayout: NotificationLayout.Default,
      displayOnBackground: true,
      displayOnForeground: true,
      wakeUpScreen: true,
      fullScreenIntent: true,
      criticalAlert: true,
      payload: payload,
      // bigPicture: bigPictureUrl,
      // largeIcon: bigPictureUrl,


    ),



  );
}









void sendNotification(String title, String token, String body, String screen, String orderId) async {
  final response = await http.post(
    Uri.parse('https://fcm.googleapis.com/fcm/send'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization':
      'key=AAAAm_7fUXE:APA91bHE0N4-02ks2f66hF53lOHpqdX4vLld15WK_r2-Dopb0EgbxL9nUihKoKVrqO7znb_ELiI4QhKcHcyVke3uUJgPvnJCB9D97M46vlJoqr67xpuiadU0bnU4T5BAL_Jg0tXoFfCN',
    },
    body: jsonEncode(
      <String, dynamic>{
        'notification': <String, dynamic>{
          'body': body,
          'title': title,
        },
        'priority': 'high',
        'to': token,
        "sound": "default",
        'data': <String, String>{
          'screen': screen,
          'id': orderId

        },
      },
    ),
  );

  if (response.statusCode == 200) {

    print('Notification sent successfully');
  } else {
    print('Notification failed to send');
  }
}