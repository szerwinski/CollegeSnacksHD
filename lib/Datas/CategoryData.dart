class CategoryData {
  String id;
  String nome;
  String estabelecimentoId;

  CategoryData({
    this.id,
    this.nome,
    this.estabelecimentoId,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
    CategoryData(
      id: json["id"],
      nome: json["nome"],
      estabelecimentoId: json["estabelecimentoId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nome": nome,
    "estabelecimentoId": estabelecimentoId,
  };
}
