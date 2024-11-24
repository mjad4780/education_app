import 'dart:developer';
import 'dart:io';

import 'package:education/core/get_it/get_it.dart';
import 'package:education/core/helpers/cache_helper.dart';
import 'package:education/core/success/return_response_service.dart';
import 'package:education/future/auth/sign%20up/data/model/sign_up_reqest_body.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../utility/constant.dart';
import 'supabase_services_impl.dart';

class AuthService {
  final SupabaseService _supabaseService;
  final GoogleSignIn _googleSignIn;

  AuthService(
    this._supabaseService,
    this._googleSignIn,
  );

  Future<ResponseService> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return ResponseService(false, 'Google sign-in canceled by user');
      }

      final googleAuth = await googleUser.authentication;
      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        return ResponseService(false, 'Google authentication failed');
      }

      final response = await _supabaseService.signInWithGoogle(
        googleAuth.idToken!,
        googleAuth.accessToken,
      );

      getIt<CacheHelper>().saveData(key: Keys.isLoggedIn, value: true);
      getIt<CacheHelper>().saveData(key: Keys.loginMethod, value: "Google");
      getIt<CacheHelper>()
          .saveData(key: Keys.loginEmail, value: response.user?.email);
      getIt<CacheHelper>().saveData(key: Keys.userId, value: response.user?.id);

      return ResponseService(true, 'Signed in successfully');
    } catch (e) {
      if (e is AuthException) {
        return ResponseService(false, e.message);
      } else {
        return ResponseService(false, e.toString());
      }
    }
  }

  Future<ResponseService> register(SignUpReqestBody body) async {
    try {
      await _supabaseService.signUp(body);
      return ResponseService(
          true, 'Account created successfully please confirm your signUp');
    } catch (e) {
      if (e is AuthException) {
        return ResponseService(false, e.message);
      } else {
        return ResponseService(false, e.toString());
      }
    }
  }

  Future<ResponseService> login(String email, String password) async {
    try {
      final response = await _supabaseService.signInWithEmail(email, password);

      getIt<CacheHelper>().saveData(key: Keys.isLoggedIn, value: true);
      getIt<CacheHelper>().saveData(key: Keys.loginMethod, value: "Email");
      getIt<CacheHelper>().saveData(key: Keys.loginEmail, value: email);
      getIt<CacheHelper>().saveData(key: Keys.password, value: password);
      getIt<CacheHelper>().saveData(key: Keys.userId, value: response.user?.id);

      return ResponseService(true,
          'Logged in successfully'); //  {"result": true, "message": "Logged in successfully"};
    } catch (e) {
      if (e is AuthException) {
        return ResponseService(false, e.message);
      } else {
        return ResponseService(false, e.toString());
      }
    }
  }

  Future<void> logout() async {
    try {
      await _supabaseService.signOut();
      await _googleSignIn.signOut();
      getIt<CacheHelper>().removeData(key: Keys.isLoggedIn);
      getIt<CacheHelper>().removeData(key: Keys.loginMethod);
      getIt<CacheHelper>().removeData(key: Keys.loginEmail);
      getIt<CacheHelper>().removeData(key: Keys.userId);
      getIt<CacheHelper>().removeData(key: Keys.password);
    } catch (e) {
      log(e.toString());
    }
  }

  bool isLoggedIn() {
    return getIt<CacheHelper>().getData(key: Keys.isLoggedIn) ?? false;
  }

  Future<ResponseService> signedUploadImage(File file) async {
    try {
      String response = await _supabaseService.signedUploadImage(file);
      return ResponseService(true, response);
    } catch (e) {
      if (e is StorageException) {
        return ResponseService(false, e.message);
      } else {
        return ResponseService(false, e.toString());
      }
    }
  }
}
