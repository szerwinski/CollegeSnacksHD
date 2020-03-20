import 'package:collegesnacks/Datas/EstablishmentData.dart';
import 'package:dio/dio.dart';

Future<List<EstablishmentData>> getEstablishments() async {
  Response response;
  List<EstablishmentData> listaDeEstabelecimentos;
  Dio dio = new Dio();

  response = await dio.get("http://cs-api-br.herokuapp.com/estabelecimento");

  listaDeEstabelecimentos = List<EstablishmentData>.from(
      response.data.map((i) => EstablishmentData.fromJson(i))
  );

  return listaDeEstabelecimentos;
}
