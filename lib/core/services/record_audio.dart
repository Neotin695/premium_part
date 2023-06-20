import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class RecordSearch {
  FlutterSoundRecorder? _audioRecord;
  bool _isInitialised = false;

  bool get isRecording => _audioRecord!.isRecording;
  late Directory _local;
  String get path => '${_local.absolute.path}/search.aac';

  Future init() async {
    _audioRecord = FlutterSoundRecorder();
    _local = (await getExternalStorageDirectory())!;
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException(
          'please give permission to record audio');
    }
    await _audioRecord!.openAudioSession();
    _isInitialised = true;
  }

  Future dispose() async {
    if (!_isInitialised) return;
    await _audioRecord!.closeAudioSession();
    _audioRecord = null;
    _isInitialised = false;
  }

  Future record() async {
    if (!_isInitialised) return;

    await _audioRecord!.startRecorder(
      toFile: '${_local.absolute.path}/search.aac',
    );
  }

  Future stop() async {
    if (!_isInitialised) return;
    await _audioRecord!.stopRecorder();
  }

  Future toggle() async {
    if (!_isInitialised) return;
    if (_audioRecord!.isStopped) {
      await record();
    } else {
      await stop();
    }
  }
}
