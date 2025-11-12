import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../features/auth/sign up/data/model/sign_up_reqest_body.dart';

abstract class ISupabaseService {
  Future<AuthResponse> signInWithGoogle(String idToken, String? accessToken);
  Future<AuthResponse> signUp(SignUpReqestBody body);
  Future<AuthResponse> signInWithEmail(String email, String password);
  Future<void> signOut();
  User? getCurrentUser();
  Future<String> signedUploadImage(File file);
}
