// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

class OcorrenciaDomain {
  int? id;
  String? data;
  String? titulo;
  int? alunoId;

  OcorrenciaDomain({this.id, this.data, this.alunoId, this.titulo});

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'data': data,
      'titulo': titulo,
      'alunoId': alunoId,
    };
  }

  factory OcorrenciaDomain.fromMap(Map<String, dynamic> map) {
    return OcorrenciaDomain(
      id: map['id'] != null ? map['id'] as int : null,
      data: map['data'] != null ? map['data'] as String : null,
      titulo: map['titulo'] != null ? map['titulo'] as String : null,
      alunoId: map['alunoId'] != null ? map['alunoId'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OcorrenciaDomain.fromJson(String source) => OcorrenciaDomain.fromMap(json.decode(source) as Map<String, dynamic>);
}
