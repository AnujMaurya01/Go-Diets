import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.paused) {
      // The app is going into the background or is being closed.
      /*todo----write here lastseen code*/
      onlinOffline(DateTime.now().millisecondsSinceEpoch.toString());
    } else if (state == AppLifecycleState.resumed) {
      onlinOffline("Online");
    } else if (state == AppLifecycleState.inactive) {
      onlinOffline(DateTime.now().millisecondsSinceEpoch.toString());
    } else if (state == AppLifecycleState.detached) {
      onlinOffline(DateTime.now().millisecondsSinceEpoch.toString());
    }
  }

  void onlinOffline(status) async {
    String? doctorId;
    String? userNumber;
    if (doctorId == null) {
      print("SDsmDLmlsDMLMSLDM");
      Map<String, dynamic> userData = {
        'lastseen': status,
      };
      await FBCollections.tokens.doc(userNumber).update(userData);
    } else {
      print("MAYBAJNANN");
      Map<String, dynamic> userData = {
        'lastseen': status,
      };
      await FBCollections.tokens.doc(doctorId).update(userData);
    }
  }
}

class FBCollections {
  static FirebaseFirestore fb = FirebaseFirestore.instance;
  static CollectionReference tokens = fb.collection('Tokens');
  static CollectionReference chat = fb.collection('chats');
  static CollectionReference userTalkAccess = fb.collection('userTalkAccess');
}
