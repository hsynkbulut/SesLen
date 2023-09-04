import 'dart:convert';
import 'package:flutter/services.dart';

class VideoDataManager {
  static Map<String, List<String>>? _videoUrls;

  static Future<Map<String, List<String>>?> get videoUrls async {
    _videoUrls ??= await _loadVideoUrls();
    return _videoUrls;
  }

  static Future<Map<String, List<String>>> _loadVideoUrls() async {
    String jsonContent = await rootBundle.loadString('assets/video_data.json');
    Map<String, dynamic> jsonData = json.decode(jsonContent);

    Map<String, List<String>> videoUrls = {};

    jsonData.forEach((key, value) {
      videoUrls[key] = List<String>.from(value);
    });

    return videoUrls;
  }
}
