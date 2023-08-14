import 'package:json_annotation/json_annotation.dart';
part 'pais.g.dart';

/*
  1. Dependencias:

  dependencies:
    ...
    # https://pub.dev/packages/sqflite/
    sqflite: ^2.0.0+4

  dev_dependencies:
  ...
    # Geracao dos parsers
    # https://pub.dev/packages/json_serializable/
    json_serializable: ^5.0.2

    # Dependencia do json_serializable para gerar os arquivos ".g"
    # https://pub.dev/packages/build_runner/
    build_runner: ^2.1.4

  2. Preparação do cadigo-fonte:
  import 'package:json_annotation/json_annotation.dart';
  part 'pais.g.dart';
  ...
  @JsonSerializable()
  ...
  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);
  Map<String, dynamic> toJson() => _$EntityToJson(this);

  OBS: ignore os avisos de erro, pois eles sumirão quando o json_serializable
  gerar os arquivos "entity.g.dart" ("entity" = nome da sua classe-entidade).

  3. Comando:
  No terminal, na pasta do projeto, execute:
  flutter packages pub run build_runner build --delete-conflicting-outputs

  OBS: Este comando vai gerar um arquivo "entity.g.dart" para cada
  classe-entidade do modelo, que seguiu o padrao aqui definido.

 */

@JsonSerializable()
class Pais
{
  int id;
  String nome;

  Pais({
    this.id=0,
    required this.nome,
  });

  @override
  String toString() {
    return 'Pais{id: $id, nome: $nome}';
  }

  factory Pais.fromJson(Map<String, dynamic> json) => _$PaisFromJson(json);
  Map<String, dynamic> toJson() => _$PaisToJson(this);
}
