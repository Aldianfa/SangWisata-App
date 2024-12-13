import 'package:dio/dio.dart';
import '../model/wisata.dart';

class WisataController {
  static Future<List<Wisata>> fetchWisata() async {
    final response = await Dio().get('https://www.jsonkeeper.com/b/ZES7');
    List<Wisata> wisata = (response.data as List)
        .map((data) => Wisata.fromJson(data))
        .toList();
    return wisata;
  }
}