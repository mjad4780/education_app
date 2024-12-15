import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/language/lang_keys.dart';
import 'package:flutter/material.dart';

List<String> listCategoriesCouse(BuildContext context) {
  // ignore: unused_local_variable
  List<String> categoriesCouse = [];
  return categoriesCouse = [
    context.translate(LangKeys.design3D),
    context.translate(LangKeys.graphicDesign),
    context.translate(LangKeys.webDevelopment),
    context.translate(LangKeys.seoMarketing),
    context.translate(LangKeys.financeAccounting),
    context.translate(LangKeys.officeProductivity),
    context.translate(LangKeys.personalDevelopment),
    context.translate(LangKeys.hrManagement)
  ];
}
