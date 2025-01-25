import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;





class PexelsService {
  final String _apiKey = 'TRt1iMUvZ1cZ7BTIRLzMlbHuCNzwNDZNSqYYk4TOnyhDfxhcE1lOwslw';

  Future<List<dynamic>> fetchPhotos(int page) async {
    try {
      final response = await http.get(
        Uri.parse('https://api.pexels.com/v1/curated?page=$page&per_page=10'),
        headers: {'Authorization': _apiKey},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['photos'];
      } else {
        throw Exception('Failed to load photos');
      }
    } catch (e) {
      print('Error fetching photos: $e');
      rethrow;
    }
  }
}








