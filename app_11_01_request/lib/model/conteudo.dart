
class Conteudo
{
  late int _userId;
  late int _id;
  late String _title;
  late bool _completed;

  Conteudo(this._userId, this._id, this._title, this._completed);

  // Json -> Objeto
  Conteudo.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _id = json['id'];
    _title = json['title'];
    _completed = json['completed'];
  }

  // Objeto -> Json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this._userId;
    data['id'] = this._id;
    data['title'] = this._title;
    data['completed'] = this._completed;
    return data;
  }

  @override
  String toString() {
    return "Conteudo{userId: $_userId, id: $_id, title: $_title, completed: $_completed}\n";
  }
}