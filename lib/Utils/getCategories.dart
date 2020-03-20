import 'package:collegesnacks/Datas/CategoryData.dart';
import 'package:dio/dio.dart';

Future<List<CategoryData>> getCategoriesList() async {
  Response response;
  List<CategoryData> listaDeCategorias;
  Dio dio = new Dio();

  response = await dio.get("http://cs-api-br.herokuapp.com/categoria"); // Return categories list

  listaDeCategorias = List<CategoryData>.from(
      response.data.map((i) => CategoryData.fromJson(i))
  );

  return listaDeCategorias;
}
