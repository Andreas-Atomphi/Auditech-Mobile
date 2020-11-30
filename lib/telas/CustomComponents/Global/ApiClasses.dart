import 'package:intl/intl.dart';

abstract class ApiClass {
  String _dateFormat(DateTime date) {
    return DateFormat("yyyy-MM-dd HH:mm:ss").format(date);
  }

  String _bDayFormat(DateTime date) {
    return DateFormat("yyyy-MM-dd").format(date);
  }
}

class TreinamentoFase extends ApiClass {
  Fase fase;
  Exercicio exercicio;
  String respostasDadas;
  DateTime dataExecucao;

  TreinamentoFase({
    this.fase,
    this.exercicio,
    this.respostasDadas,
    this.dataExecucao,
  });

  TreinamentoFase.fromJson(Map<String, dynamic> obj)
      : fase = Fase(idFase: obj["faseIdFase"]),
        exercicio = Exercicio(idExercicio: obj["exercicioIdExercicio"]),
        respostasDadas = obj["respostaTreino"],
        dataExecucao = DateTime.parse(
          obj["dataExecucao"],
        );

  Map<String, dynamic> get toJson => <String, dynamic>{
        "faseIdFase": fase.idFase,
        "exercicioIdExercicio": exercicio.idExercicio,
        "respostaTreino": respostasDadas,
        "dataExecucao": _dateFormat(dataExecucao),
      };
}

class Usuario extends ApiClass {
  int id, tipoUsuario;
  String nome, cpf;
  DateTime dataNascimento;

  Usuario(
    this.id,
    this.tipoUsuario,
    this.nome,
    this.cpf,
    this.dataNascimento,
  );

  Usuario.fromJson(Map<String, dynamic> obj)
      : id = obj["idUsuario"],
        tipoUsuario = obj["idTipoUsuario"],
        nome = obj["nome"],
        cpf = obj["cpf"],
        dataNascimento = DateFormat.yMd().parse(obj["dataNascimento"]);

  Map<String, dynamic> get toJson => <String, dynamic>{
        "idUsuario": id,
        "idTipoUsuario": tipoUsuario,
        "nome": nome,
        "cpf": cpf,
        "dataNascimento": _bDayFormat(dataNascimento),
      };
}

class Fase extends ApiClass {
  int idFase,
      numDias,
      qtdeTreinoDia,
      intervaloTreinoHora,
      tratamentoIdTratamento;
  Exercicio exercicio;
  double pesoTreino, pesoDesafio;
  DateTime dataInicio, dataFinal;

  Fase({
    this.idFase,
    this.numDias,
    this.qtdeTreinoDia,
    this.intervaloTreinoHora,
    this.exercicio,
    this.tratamentoIdTratamento,
    this.pesoDesafio,
    this.pesoTreino,
    this.dataInicio,
    this.dataFinal,
  });

  Fase.fromJson(Map<String, dynamic> json)
      : idFase = json["idFase"],
        numDias = json["numDias"],
        qtdeTreinoDia = json["qtdeTreinoDia"],
        intervaloTreinoHora = json["intervaloTreinoHora"],
        exercicio = Exercicio(idExercicio: json["exercicioIdExercicio"]),
        tratamentoIdTratamento = json["tratamentoIdTratamento"],
        pesoDesafio = json["pesoDesafio"],
        pesoTreino = json["pesoTreino"],
        dataInicio =
            DateFormat("MM/dd/yyyy HH:mm:ss").parse(json["dataInicio"]),
        dataFinal = DateFormat("MM/dd/yyyy HH:mm:ss").parse(json["dataFinal"]);

  Map<String, dynamic> get toJson => <String, dynamic>{
        "idFase": idFase,
        "numDias": numDias,
        "qtdeTreinoDia": qtdeTreinoDia,
        "intervaloTreinoHora": intervaloTreinoHora,
        "exercicioIdExercicio": exercicio.idExercicio,
        "tratamentoIdTratamento": tratamentoIdTratamento,
        "pesoDesafio": pesoDesafio,
        "pesoTreino": pesoTreino,
        "dataInicio": _dateFormat(dataInicio),
        "dataFinal": _dateFormat(dataInicio),
      };
}

class Exercicio extends ApiClass {
  int idExercicio, midiaIdMidia;
  String descricaoExercicio, padraoRespExercicio, nomeExercicio;
  Exercicio({
    this.idExercicio,
    this.midiaIdMidia,
    this.nomeExercicio,
    this.descricaoExercicio,
    this.padraoRespExercicio,
  });

  Exercicio.fromJson(Map<String, dynamic> json)
      : idExercicio = json["idExercicio"],
        midiaIdMidia = json["midiaIdmidia"],
        nomeExercicio = json["nomeExercicio"],
        descricaoExercicio = json["descricaoExercicio"],
        padraoRespExercicio = json["padraoRespExercicio"];

  Map<String, dynamic> get toJson => <String, dynamic>{
        "idExercicio": idExercicio,
        "midiaIdmidia": midiaIdMidia,
        "nomeExercicio": nomeExercicio,
        "descricaoExercicio": descricaoExercicio,
        "padraoRespExercicio": padraoRespExercicio,
      };
}
