import 'package:intl/intl.dart';

String _dateFormat(DateTime date) {
  return DateFormat("yyyy-MM-dd HH:mm:ss").format(date);
}

class TreinamentoFase {
  int id;
  String respostasDadas;
  DateTime dataExecucao;

  TreinamentoFase({this.id, this.respostasDadas, this.dataExecucao});

  TreinamentoFase.fromJson(Map<String, dynamic> obj)
      : id = obj["faseIdFase"],
        respostasDadas = obj["respostaTreino"],
        dataExecucao = DateTime.parse(
          obj["dataExecucao"],
        );

  Map<String, dynamic> get toJson => <String, dynamic>{
        "faseIdFase": id,
        "respostaTreino": respostasDadas,
        "dataExecucao": _dateFormat(dataExecucao),
      };
}

class Usuario {
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
      : id = obj["Id"],
        tipoUsuario = obj["Tipo Usuário"],
        nome = obj["Nome"],
        cpf = obj["CPF"],
        dataNascimento = obj["Data Nascimento"];

  Map<String, dynamic> get toJson => <String, dynamic>{
        "Id": id,
        "Tipo Usuário": tipoUsuario,
        "Nome": nome,
        "CPF": cpf,
        "Data Nascimento": _dateFormat(dataNascimento),
      };
}
