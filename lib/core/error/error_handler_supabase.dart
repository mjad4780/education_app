import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ErrorHandlerSupabase {
// hundle erorr supabase and all exceotion
  static String getErrorMessage(dynamic error) {
    if (error is SocketException) {
      return "No internet connection. Please check your network.";
    } else if (error is TimeoutException) {
      return "Connection timed out. Please try again.";
    } else if (error is AuthException) {
      return error.message;
    } else if (error is HandshakeException) {
      return error.message;
    } else if (error is PostgrestException) {
      return "Server error: ${error.message}";
    } else if (error is HttpException) {
      return "HTTP request failed: ${error.message}";
    } else if (error is FormatException) {
      return "Data format error. Please contact support.";
    } else if (error is PlatformException) {
      return "Platform error: ${error.message}";
    } else if (error is Exception) {
      // Handle general exceptions
      return "An unexpected error occurred: ${error.toString()}";
    } else {
      return "An unexpected error occurred. Please try again.";
    }
  }
}
