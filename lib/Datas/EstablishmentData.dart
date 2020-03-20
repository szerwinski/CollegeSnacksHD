class EstablishmentData{
  String id;
  String nome;
  String description;
  String CNPJ;
  String razaoSocial;
  String telefone;
  String status;
  String bloqueio;
  String dataAdesao;
  String dataUltimaVenda;

  EstablishmentData({this.id, this.nome, this.description, this.CNPJ,
    this.razaoSocial, this.telefone, this.status, this.bloqueio,
    this.dataAdesao, this.dataUltimaVenda});

  factory EstablishmentData.fromJson(Map<String, dynamic> json) =>
    EstablishmentData(
      id: json["id"],
      nome: json["nomeRestaurante"],
      description: json["description"],
      CNPJ: json["cnpj"],
      razaoSocial: json["razaoSocial"],
      telefone: json["telefoneRestaurante"],
      status: json["status"],
      bloqueio: json["bloqueio"],
      dataAdesao: json["dataAdesao"],
      dataUltimaVenda: json["dataUltimaVenda"]
  );
}