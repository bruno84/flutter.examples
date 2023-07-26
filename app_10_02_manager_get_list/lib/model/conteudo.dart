class Conteudo
{
  // Atributos (privados: pois possuem _)
  String _nome;
  String _foto;

  // Construtor
  Conteudo(this._nome, this._foto);

  //----------------------------------------------------------------------------
  // Getters e Setters
  //----------------------------------------------------------------------------
  String get foto => _foto;

  set foto(String value) {
    _foto = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }
}