
// OBS: classe criada com:
// https://javiercbk.github.io/json_to_dart/
// (só adicionei as mudanças do null safety).

// OBS: classe baseada na API de teste:
// https://jsonplaceholder.typicode.com/todos/

class Post
{
  late int _id;
  late String _title;
  late String _body;
  late int _userId;

  Post(int id, String title, String body, int userId) {
    this._id = id;
    this._title = title;
    this._body = body;
    this._userId = userId;
  }

  int get userId => _userId;
  set userId(int userId) => _userId = userId;

  int get id => _id;
  set id(int id) => _id = id;

  String get title => _title;
  set title(String title) => _title = title;

  String get body => _body;
  set body(String body) => _body = body;

  Post.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _body = json['body'];
    _userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['body'] = this._body;
    data['userId'] = this._userId;
    return data;
  }

  @override
  String toString() {
    return 'Post{_userId: $_userId, _id: $_id, _title: $_title, _body: $_body}\n';
  }
}