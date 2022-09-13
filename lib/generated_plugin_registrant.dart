//
// Generated file. Do not edit.
//

// ignore_for_file: directives_ordering
// ignore_for_file: lines_longer_than_80_chars

import 'package:cloud_firestore_web/cloud_firestore_web.dart';
import 'package:firebase_analytics_web/firebase_analytics_web.dart';
import 'package:firebase_auth_web/firebase_auth_web.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:firebase_messaging_web/firebase_messaging_web.dart';
import 'package:firebase_performance_web/firebase_performance_web.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';
import 'package:location_web/location_web.dart';
import 'package:sign_in_with_apple_web/sign_in_with_apple_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  FirebaseFirestoreWeb.registerWith(registrar);
  FirebaseAnalyticsWeb.registerWith(registrar);
  FirebaseAuthWeb.registerWith(registrar);
  FirebaseCoreWeb.registerWith(registrar);
  FirebaseMessagingWeb.registerWith(registrar);
  FirebasePerformanceWeb.registerWith(registrar);
  GoogleSignInPlugin.registerWith(registrar);
  LocationWebPlugin.registerWith(registrar);
  SignInWithApplePlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
