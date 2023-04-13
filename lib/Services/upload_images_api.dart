import 'package:http/http.dart' as http;
import 'package:zakira/Services/config.dart';

class ImageServices {
  static var client = http.Client();

  static Future<bool> uploadImages (
    String singleImagesFile,
    List<String> multipleImages,
  )async{
    var url = Uri.parse(Config.baseapiUrl+Config.S3Api);
    var request = http.MultipartRequest("POST",url);
    if(singleImagesFile.isNotEmpty){
      http.MultipartFile singleFile = await http.MultipartFile.fromPath("singlefile", singleImagesFile);
      request.files.add(singleFile);
    }
    if(multipleImages.isNotEmpty){
      multipleImages.forEach((file) async{
         http.MultipartFile multiFile = await http.MultipartFile.fromPath("multiplefile",file);
         request.files.add(multiFile);
      });
    }
    var response = await request.send();
    if(response.statusCode==200){
      print(response);
      print("success");
   return true;
    }else{
return false;
    }

  }
}