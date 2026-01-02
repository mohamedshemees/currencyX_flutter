import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ApiService.g.dart';

@RestApi(baseUrl: "")
abstract class ApiService {
  factory ApiService(Dio dio,{ String? baseUrl}) = _ApiService;

@GET('historical')
Future<Response> getCurrencyExchangeRate({
  @Query("base_currency") String baseCurrency,
  @Query("date") String date = "2025-01-01",
});
}
@JsonSerializable()
class Response{
  final Map<String, Map<String,double>> data;
  Response(this.data);
  factory Response.fromJson(Map<String, dynamic> json) => _$ResponseFromJson(json);
}
