import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class UploadApi {
  static Future<String> uploadImage(File imageFile, String token) async {
    print(imageFile.path + "FILE PATH");
    try {
      var apiUrl = 'http://146.190.173.92:3002/driver/api/uploadImage';

      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          imageFile.path,
        ),
      );

      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        print(response.body.toString());
        return responseData['data'];
      } else {
        return 'Failed to upload image: ${response.statusCode}';
      }
    } catch (e, stacktrace) {
      print(stacktrace.toString());

      return 'Exception occurred while uploading image: $e';
    }
  }
}
