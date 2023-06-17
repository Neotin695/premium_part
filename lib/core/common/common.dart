import 'package:shared_preferences/shared_preferences.dart';

import '../../models/selected_part_model.dart';

class Common {
  static late SharedPreferences prefs;
  static const String host = '192.168.1.2';
  static SelectedPartModel selectedPart = SelectedPartModel(
    memory: [],
    storage: [],
    cpu: null,
    gpu: null,
    motherboard: null,
    powersupply: null,
    cases: null,
    cooler: null,
  );
}
