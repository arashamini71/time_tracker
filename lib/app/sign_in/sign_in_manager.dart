import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:time_tracker_project/services/auth.dart';

class SignInManager {
  final AuthBase auth;
  SignInManager({@required this.isLoading, @required this.auth});

  final ValueNotifier<bool> isLoading;
  Future<AuthUser> _signIn(Future<AuthUser> Function() signInMethod) async {
    try {
      isLoading.value = true;
      return await signInMethod();
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  Future<AuthUser> signInAnonymously() async =>
      await _signIn(auth.signInAnonymously);

  Future<AuthUser> signInWithGoogle() async =>
      await _signIn(auth.signInWithGoogle);
}
