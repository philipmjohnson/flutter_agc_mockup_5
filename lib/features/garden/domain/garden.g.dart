// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'garden.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GardenImpl _$$GardenImplFromJson(Map<String, dynamic> json) => _$GardenImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imagePath: json['imagePath'] as String,
      ownerID: json['ownerID'] as String,
      chapterID: json['chapterID'] as String,
      lastUpdate: json['lastUpdate'] as String,
      editorIDs: (json['editorIDs'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      viewerIDs: (json['viewerIDs'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$GardenImplToJson(_$GardenImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imagePath': instance.imagePath,
      'ownerID': instance.ownerID,
      'chapterID': instance.chapterID,
      'lastUpdate': instance.lastUpdate,
      'editorIDs': instance.editorIDs,
      'viewerIDs': instance.viewerIDs,
    };
