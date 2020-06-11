// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Station _$StationFromJson(Map<String, dynamic> json) {
  return Station(
      Id: json['Id'] as String,
      LocName: json['LocName'] as String,
      Latitude: (json['Latitude'] as num)?.toDouble(),
      Longitude: (json['Longitude'] as num)?.toDouble(),
      Address: json['Address'] as String,
      City: json['City'] as String);
}

Map<String, dynamic> _$StationToJson(Station instance) => <String, dynamic>{
      'Id': instance.Id,
      'LocName': instance.LocName,
      'Latitude': instance.Latitude,
      'Longitude': instance.Longitude,
      'Address': instance.Address,
      'City': instance.City
    };
