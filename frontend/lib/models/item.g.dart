// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      address: json['address'] as String,
      landlord: json['landlord'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      price: (json['price'] as num).toDouble(),
      location: json['location'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'address': instance.address,
      'landlord': instance.landlord,
      'images': instance.images,
      'price': instance.price,
      'location': instance.location,
      'description': instance.description,
    };
