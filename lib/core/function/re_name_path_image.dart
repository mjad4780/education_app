// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;

String reNamePathImage(String path) {
  return "${DateTime.now().toIso8601String().replaceAll(".", "").replaceAll(":", "").replaceAll(" ", "")}_${p.basename(path).replaceAll(' ', '')}";
}
