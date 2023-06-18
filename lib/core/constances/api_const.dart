import 'package:permium_parts/core/common/common.dart';

class ApiConst {
  static const String baseUrl = 'http://${Common.host}:8000/api';
  static const String baseUrlImage = 'http://${Common.host}:8000';
  static const String partSelectorPath = '/part-selector';
  static const String selectedPartPath = '/selected-parts';
  static const String removePartPath = '/remove-part';
  static const String addPartPath = '/add-part';
  static const String specialPcPath = '/special';
  static const String signinPath = '/login';
  static const String signupPath = '/register';
  static const String userPath = '/user';
}
