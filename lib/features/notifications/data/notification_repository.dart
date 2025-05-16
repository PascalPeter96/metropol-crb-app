

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:metropol_mawanda_peter/features/credit_inquiries/model/credit_inquiry_model.dart';
import 'package:metropol_mawanda_peter/features/notifications/model/notification_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'notification_repository.g.dart';


@Riverpod(keepAlive: true)
NotificationRepository notificationRepository(NotificationRepositoryRef ref) {
  return NotificationRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<List<NotificationsModel>> getNotifications(GetNotificationsRef ref, String userId) {
  final firebaseRepository = ref.watch(notificationRepositoryProvider);
  return firebaseRepository.getNotifications(userId);
}



class NotificationRepository {

  NotificationRepository(this._firestore);

  final FirebaseFirestore _firestore;

  Future<void> addCreditInquiry(
      NotificationsModel notificationsModel, String userId) async {
    final docRef = await _firestore
        .collection('users')
        .doc(userId)
        .collection('notifications')
        .add(notificationsModel.toMap());
    await docRef.update({'id': docRef.id});
  }


  Stream<List<NotificationsModel>> getNotifications(String userId) {
    return FirebaseFirestore.instance.collection('users')
        .doc(userId)
        .collection('notifications')
        .orderBy('date', descending: true)
        .snapshots()
        .map((querySnap) =>
        querySnap.docs.map((doc) => NotificationsModel.fromMap(doc.data())).toList()
    );
  }



}