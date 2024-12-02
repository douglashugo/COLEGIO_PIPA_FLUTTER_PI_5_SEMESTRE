import 'dart:convert';

class CreateOcorrenciaDomain {
  String? data;
  String? titulo;
  int? alunoId;
  String? lanche;
  String? almoco;
  String? lanchetarde;
  String? jantar;
  String? mamadeira;
  String? mamadeira2;
  String? mamadeira3;
  String? evacuacao;
  bool? xixi;
  bool? dormiu;
  bool? banho;
  String? horario;
  String? dose;
  double? febre;
  String? nome_responsavel;

  CreateOcorrenciaDomain({
    this.data,
    this.titulo,
    this.alunoId,
    this.lanche,
    this.almoco,
    this.lanchetarde,
    this.jantar,
    this.mamadeira,
    this.mamadeira2,
    this.mamadeira3,
    this.evacuacao,
    this.xixi,
    this.dormiu,
    this.banho,
    this.horario,
    this.dose,
    this.febre,
    this.nome_responsavel,
  });

  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'aluno_id': alunoId,
      'lanche': lanche,
      'almoco': almoco,
      'lanchetarde': lanchetarde,
      'jantar': jantar,
      'mamadeira': mamadeira,
      'mamadeira2': mamadeira2,
      'mamadeira3': mamadeira3,
      'evacuacao': evacuacao,
      'xixi': xixi,
      'dormiu': dormiu,
      'banho': banho,
      'horario': horario,
      'dose': dose,
      'febre': febre,
      'nome_responsavel': nome_responsavel,
      'titulo': titulo,
    };
  }

  factory CreateOcorrenciaDomain.fromMap(Map<String, dynamic> map) {
    return CreateOcorrenciaDomain(
      data: map['data'] != null ? map['data'] as String : null,
      alunoId: map['alunoId'] != null ? map['alunoId'] as int : null,
      lanche: map['lanche'] != null ? map['lanche'] as String : null,
      almoco: map['almoco'] != null ? map['almoco'] as String : null,
      lanchetarde: map['lanchetarde'] != null ? map['lanchetarde'] as String : null,
      jantar: map['jantar'] != null ? map['jantar'] as String : null,
      mamadeira: map['mamadeira'] != null ? map['mamadeira'] as String : null,
      mamadeira2: map['mamadeira2'] != null ? map['mamadeira2'] as String : null,
      mamadeira3: map['mamadeira3'] != null ? map['mamadeira3'] as String : null,
      evacuacao: map['evacuacao'] != null ? map['evacuacao'] as String : null,
      xixi: map['xixi'] != null ? map['xixi'] as bool : null,
      dormiu: map['dormiu'] != null ? map['dormiu'] as bool : null,
      banho: map['banho'] != null ? map['banho'] as bool : null,
      horario: map['horario'] != null ? map['horario'] as String : null,
      dose: map['dose'] != null ? map['dose'] as String : null,
      febre: map['febre'] != null ? map['febre'] as double : null,
      nome_responsavel: map['nome_responsavel'] != null ? map['nome_responsavel'] as String : null,
      titulo: map['titulo'] != null ? map['titulo'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateOcorrenciaDomain.fromJson(String source) => CreateOcorrenciaDomain.fromMap(json.decode(source));
}
