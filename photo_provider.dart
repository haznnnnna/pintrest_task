

import 'package:flutter/material.dart';
import '../models/photo.dart';

class PhotoProvider extends ChangeNotifier {
  final PexelsService _service = PexelsService();
  List<dynamic> _photos = [];
  int _page = 1;
  bool _isLoading = false;

  List<dynamic> get photos => _photos;

  Future<void> fetchPhotos() async {
    if (_isLoading) return;
    _isLoading = true;

    final newPhotos = await _service.fetchPhotos(_page);
    _photos.addAll(newPhotos);
    notifyListeners();
    _page++;
    _isLoading = false;


  }
}
