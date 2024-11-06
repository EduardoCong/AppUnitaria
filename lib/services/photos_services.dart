import 'dart:convert';
import 'package:appunificada/models/photos_model.dart';
import 'package:http/http.dart' as http;

class PhotoService {
  final String accessKey = '2XV3-C3I5VD306VHDOFqUMSqAW9ZN8zsm4ARCg6uCWM';

  Future<List<Photo>> searchPhotos(String query) async {
    final url = Uri.parse('https://api.unsplash.com/search/photos?query=$query&client_id=$accessKey');
    
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> photosJson = data['results'];
      return photosJson.map((json) => Photo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
