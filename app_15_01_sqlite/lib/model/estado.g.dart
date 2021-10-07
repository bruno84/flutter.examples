// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estado.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Estado _$EstadoFromJson(Map<String, dynamic> json) => Estado(
      id: json['id'] as int,
      nome: json['nome'] as String,
      sigla: json['sigla'] as String,
      pais: Pais.fromJson(json['pais'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EstadoToJson(Estado instance) => <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'sigla': instance.sigla,
      'pais': instance.pais,
    };
