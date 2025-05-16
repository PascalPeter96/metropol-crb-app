import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;
import 'package:metropol_mawanda_peter/theme/app_theme.dart';

import 'notifications_service_contoller.dart';


class NotificationService {
  static ReceivedAction? initialAction;

  static Future<void> initializeNotification() async {
    await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
              channelKey: 'loanApprovals',
              channelName: 'loanApprovals',
              channelDescription: 'loanApprovals',
              importance: NotificationImportance.Max,
              defaultColor: AppTheme.primaryColor,
              channelShowBadge: true,
              playSound: true,
              criticalAlerts: true,
              enableVibration: true,
              ),
          NotificationChannel(
            channelKey: 'loanRepayments',
            channelName: 'loanRepayments',
            channelDescription: 'loanRepayments',
            importance: NotificationImportance.Max,
            defaultColor: AppTheme.primaryColor,
            channelShowBadge: true,
            playSound: true,
            criticalAlerts: true,
            enableVibration: true,
          ),
          NotificationChannel(
            channelKey: 'creditInquiries',
            channelName: 'creditInquiries',
            channelDescription: 'creditInquiries',
            importance: NotificationImportance.Max,
            defaultColor: AppTheme.primaryColor,
            channelShowBadge: true,
            playSound: true,
            criticalAlerts: true,
            enableVibration: true,
          ),

          NotificationChannel(
            channelKey: 'metropol',
            channelName: 'metropol',
            channelDescription: 'metropol',
            importance: NotificationImportance.Max,
            defaultColor: AppTheme.primaryColor,
            channelShowBadge: true,
            playSound: true,
            criticalAlerts: true,
            enableVibration: true,
          ),
        ],

        debug: true);

    await AwesomeNotifications()
        .isNotificationAllowed()
        .then((isAllowed) async {
      if (isAllowed) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    initialAction = await AwesomeNotifications()
        .getInitialNotificationAction(removeFromActionEvents: false);

    await AwesomeNotifications().setListeners(
      onActionReceivedMethod:
          NotificationsServiceController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationsServiceController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationsServiceController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationsServiceController.onDismissActionReceivedMethod,
    );
  }

  static Future<String> getAccessToken() async {
    var serviceAccountJson = {
      "type": "service_account",
      "project_id": "metropol-8aa1b",
      "private_key_id": "75084fe8e77e7426e9c375be108812bd8e094ee2",
      "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDHQYvdvNSmF2gT\nLcmR7M6OsWWztiCA7H7l9eaoKI/PSV9vAVb+p54kAiqSrt5T8ZFvYQkTf6zu6Lqu\ng/1HPrxD+p89phMrKZidLQow/ONGkuiiAEbkQxS0gtcHvoN2mNB8+oGw2e6ELTUS\nth4oZ8cqu/3rWNFEI4zP/DhNq2Cf1lxli+lp68M8vHQ0IRSiitGxlFeyl0JIZItJ\nmJ8hMp65OTvq5RzOnS0P3IvvT0y8bEZymU5zCMb1YvGoB3J1mRAEVQ+qQVCT68Rj\nq1uF9LOCt/4UfEdwVzvHEI9CxhTTrapTF+C7ge/uhPF4UQbNB+Uu5UXOgJM3jzAL\nZXXf78KPAgMBAAECggEABmy+zEm27PDAmoG1nVQZPZugZQuLKm0LExzQhlKMfzQP\n9N3XsW1ehC23tAlvF3N+Fi0hpEnPyIJOPACl2DgVzParT3W9P300s7i3OpN6O+p9\nFXV/KQQKtQlU/VBvdRGsrfhL2eklBN5foY39afMdW8DlCUN7YpWSMvCghiHvrdJR\nO+hzV5h4ioBMaGRjpECeZ9x1z8qALlfQAb6V6OK0rLZUyVuY7zxJPrna3+blt+h3\nH2XtIb3siZBPVhk2E1IdQCkXNMbPCptVVHPpxnVHV8YDNou+VYF6a+p7NBGR+EO0\nWQxZgx2wzKgetkV5y+XuzPlaTAr9ESiqYGMFh8z5TQKBgQDkBI6RKplt3zb7V30k\nk5/Kj8OQk7nYC53Xr34+H0KmLt90mnTTXplkzfVZ+V3fymqqudTWAkddsXjjLo2T\nprcCAIl0qYDsQWVRmMSrcK/Yy7uwgToqdSRmh99ONd0Wu68HBQkEur5ZFhLfz5Ie\nFxEqIbZ48UxOZQ/Jg/OtT/iVSwKBgQDftWfNEOzrGqst82uKYU4/LzK5E+I0H+dt\n0L+fXEcL+VbUsrORW4O2xUsMCAV15K2hePVZU34AHN0LqK0x1EBBteXj08jfuA9e\nzzFJIBCGBykrNAsbjtEJiKiWffx42qI7HA/NEN84eMApuDrFkuJ5r0wA+Bqsdt0P\nyGQAy5axTQKBgQDexIT01oWnjliNHmCpB4EpyWLrMSh0JoVDX7UaxDe9XDX8GZrh\nlp6OmZmHGdXY+k1UFtIVc4x9wRG2AplXE53gWt3wGFpYd1uhaHtcc2+ZgxIP03Ec\nYe36LezA4Gbr+tl5JjY1ZKzrJGG0P3sl4qtmWiGH71b5kEroOf4r6OGYGQKBgQCq\nhDmkw3vzEJbeJacZCWZ9HtrI2/EVziO3PuBw9gNpixq2cagR6fGRxPyZJRwUasQ2\nSl6pQczPBTEwC9hIHQMFk0Kxz+JTNJbyq3djx78QijDFL5wv20JWxAXNACcLb4st\nBwy8QFoFT3UZ18Vkh7t9CTMjofmi7888koA3YvdwGQKBgDVxgTrIE0feMUNJyae9\nIBzZfmWuIX+otVpzGeqe/KGc23AQplLiqQIeJy3cIZQviQw4+XUp+6FBpngt6GRT\n1vjdXLQXs3Vw3uuWTnCR0AljT45rWwq6XUNvNWZyol6SbzPUhjeGgLBnfErHKJ0I\nZ0dO3DAZVoYYImrrL+rUdPbX\n-----END PRIVATE KEY-----\n",
      "client_email": "firebase-adminsdk-fbsvc@metropol-8aa1b.iam.gserviceaccount.com",
      "client_id": "103633528546479352929",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40metropol-8aa1b.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    }
    ;

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging",
    ];
    http.Client client = await auth.clientViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);
// get access token using this client
    auth.AccessCredentials credentials =
        await auth.obtainAccessCredentialsViaServiceAccount(
            auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
            scopes,
            client);
    log('Access Token = ${credentials.accessToken.data}');
// close the client
    client.close();
    return credentials.accessToken.data;
  }

  static Future<void> sendNoficationToselectedUser({
    required String deviceToken,
    required String title,
    required String type,
    required String recieverId,
    required String senderId,
    required Map<String, dynamic> data,
    required String body,
    required String channelId,
  }) async {
    print('starting fcm send');
    final String serverAccessToken = await getAccessToken();
    String endpointFirebasecloudMessaging =
        'https://fcm.googleapis.com/v1/projects/metropol-8aa1b/messages:send';
    final Map<String, dynamic> message = {
      'message': {
        'token': deviceToken,
        'notification': {
          'title': title,
          'body': body,
          // 'image': image,

          // 'sound': soundName.toString(),
          // 'content_available': true,
          // 'mutable_content': true,
        },
        // 'click_action': 'FLUTTER_NOTIFICATION_CLICK',
        'data': {
          'type': type,
          // 'fcm': UserPreferences().fcmToken ?? '',
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',


        },
        'android': {
// Required for background/terminated app state messages on Android
          'priority': "high",
          'notification': {
            'sound': "default",
            'click_action': "FLUTTER_NOTIFICATION_CLICK",
            // 'channel_id': 'high_importance_channel'
            'channel_id': channelId,
            // 'image': image,
          },
        },
        'apns': {
          "headers": {
            "apns-priority": "10",
          },
          'payload': {
            'aps': {
// Required for background/terminated app state messages on iOS
              'contentAvailable': true,
//               'contentAvailable': 1,
//               'mutable-content': 1,
              'badge': 1,
            },
          },
          'fcm_options': {'image': ''},
        },
      }
    };
    final http.Response response = await http.post(
      Uri.parse(endpointFirebasecloudMessaging),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $serverAccessToken'
      },
      body: jsonEncode(message),
    );
    if (response.statusCode == 200) {
      debugPrint("Successfully sent:${response.body}");
    } else {
      debugPrint("Failed with code:${response.body}");
    }
  }

  // static Future<void> saveDeviceToken(String uid) async {
  //   // final FirebaseFirestore db = FirebaseFirestore.instance;
  //   // final FirebaseMessaging fcm = FirebaseMessaging.instance;
  //   try {
  //     String? currentFcmToken = UserPreferences().fcmToken;
  //     //get device token
  //     String? fcmToken = await firebaseMessaging.getToken();
  //
  //     print('currentFcmToken is $currentFcmToken');
  //     print('fcmToken is $fcmToken');
  //
  //     //if fcmToken is not already saved
  //     if (currentFcmToken != fcmToken) {
  //       //Save new token to database
  //       if (fcmToken != null) {
  //         DocumentSnapshot userDocRef =
  //             await firestore.collection('users_test').doc(uid).get();
  //         var data = userDocRef.data() as Map<String, dynamic>;
  //         print("userDocRef phone: ${data['phone']}");
  //
  //         print('userDocRef id is ${userDocRef}');
  //         await firestore.collection('users_test').doc(uid).update({
  //           'fcmTokens': FieldValue.arrayUnion([fcmToken]),
  //         }).whenComplete(() {
  //           //save token locally
  //           UserPreferences().setFcmToken(fcmToken);
  //         });
  //       }
  //     } else if (currentFcmToken == null) {
  //       DocumentSnapshot userDocRef =
  //           await firestore.collection('users_test').doc(uid).get();
  //       var data = userDocRef.data() as Map<String, dynamic>;
  //       print("userDocRef phone: ${data['phone']}");
  //
  //       await firestore.collection('users_test').doc(uid).update({
  //         'fcmTokens': FieldValue.arrayUnion([fcmToken]),
  //       }).whenComplete(() {
  //         //save token locally
  //         UserPreferences().setFcmToken(fcmToken.toString());
  //       });
  //     } else {
  //       DocumentSnapshot userDocRef =
  //           await firestore.collection('users_test').doc(uid).get();
  //       var data = userDocRef.data() as Map<String, dynamic>;
  //       print("userDocRef phone: ${data['phone']}");
  //
  //       await firestore.collection('users_test').doc(uid).update({
  //         'fcmTokens': FieldValue.arrayUnion([fcmToken]),
  //       }).whenComplete(() {
  //         //save token locally
  //         UserPreferences().setFcmToken(fcmToken.toString());
  //       });
  //     }
  //   } catch (e) {}
  // }

}
