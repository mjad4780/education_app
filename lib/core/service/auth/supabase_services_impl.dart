import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../future/auth/sign up/data/model/sign_up_reqest_body.dart';
import '../../function/re_name_path_image.dart';
import 'supabase_services.dart';

class SupabaseService implements ISupabaseService {
  final SupabaseClient _client;
  SupabaseService(this._client);

  @override
  Future<AuthResponse> signInWithGoogle(String idToken, String? accessToken) {
    return _client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  @override
  Future<AuthResponse> signUp(SignUpReqestBody body) {
    return _client.auth.signUp(
      email: body.email.toLowerCase().trim(),
      password: body.password,
      data: body.data.toJson(),
    );
  }

  @override
  Future<AuthResponse> signInWithEmail(String email, String password) {
    return _client.auth.signInWithPassword(
      email: email.toLowerCase().trim(),
      password: password,
    );
  }

  @override
  Future<void> signOut() {
    return _client.auth.signOut();
  }

  @override
  User? getCurrentUser() {
    return _client.auth.currentSession?.user;
  }

  @override
  Future<String> signedUploadImage(File file) {
    return _client.storage.from('education_profile').upload(
          reNamePathImage(file.path),
          file,
        );
  }
}
