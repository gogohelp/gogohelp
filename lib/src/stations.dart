import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'stations.g.dart';

@JsonSerializable()
class Station {
  Station({
    this.Id,
    this.LocName,
    this.Latitude,
    this.Longitude,
    this.Address,
    this.City,
  });

  factory Station.fromJson(Map<String, dynamic> json) =>
      _$StationFromJson(json);
  Map<String, dynamic> toJson() => _$StationToJson(this);

  final String Id;
  final String LocName;
  final double Latitude;
  final double Longitude;
  final String Address;
  final String City;
}

Future<List<Station>> getStations() async {
  const url = 'https://webapi.gogoro.com/api/vm/list';

  final response = await http.get(url);
  if (response.statusCode != 200) {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
        ' ${response.reasonPhrase}',
        uri: Uri.parse(url));
  }

  var stations = <Station>[];
  for (final record in json.decode(response.body)) {
    stations.add(Station.fromJson(record));
  }
  return stations;
}
