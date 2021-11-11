
// OBS: classe criada com: https://javiercbk.github.io/json_to_dart/
// OBS: classe baseada na API de teste: https://reqres.in/
// Só adicionei as mudanças do null safety.

class Conteudo
{
  late int _page;
  late int _per_page;
  late int _total;
  late int _total_pages;

  late int _id;
  late String _name;
  late int _year;
  late String _color;
  late String _pantoneValue;

  Conteudo(this._id, this._name, this._year, this._color, this._pantoneValue);

  // Getters
  int get id => _id;
  String get name => _name;
  int get year => _year;
  String get color => _color;
  String get pantoneValue => _pantoneValue;

  // Json -> Objeto
  Conteudo.fromJson(Map<String, dynamic> json)
  {
    _id = json['id'];
    _name = json['name'];
    _year = json['year'];
    _color = json['color'];
    _pantoneValue = json['pantone_value'];
  }

  // Objeto -> Json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['year'] = this._year;
    data['color'] = this._color;
    data['pantone_value'] = this._pantoneValue;
    return data;
  }

  @override
  String toString() {
    return 'Conteudo{_id: $_id, _name: $_name, _year: $_year, _color: $_color, _pantoneValue: $_pantoneValue} \n';
  }
}