// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "signinscreen": "Welcome User",
  "signingooglebutton": "Login with Google",
  "signinfacebookbutton": "Login with Facebook",
  "splashmessage": "where the journey begins"
};
static const Map<String,dynamic> hi = {
  "signinscreen": "उपयोगकर्ता का स्वागत है",
  "signingooglebutton": "गूगल से लॉगिन करें",
  "signinfacebookbutton": "फ़ेसबुक से लॉगिन करें",
  "splashmessage": "जहां से यात्रा शुरू होती है"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "hi": hi};
}
