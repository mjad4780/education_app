import 'package:path/path.dart';

String reNamePathImage(String path) {
  return "${DateTime.now().toIso8601String().replaceAll(".", "").replaceAll(":", "").replaceAll(" ", "")}_${basename(path).replaceAll(' ', '')}";
}
