class Post {
  late String _id;
  late String _title;
  late String _body;
  late String _userId;

  Post(String id, String title, String body, String userId) {
    this._id = id;
    this._title = title;
    this._body = body;
    this._userId = userId;
  }

  String get id => _id;
  set id(String id) => _id = id;

  String get title => _title;
  set title(String title) => _title = title;

  String get body => _body;
  set body(String body) => _body = body;

  String get userId => _userId;
  set userId(String userId) => _userId = userId;


  Post.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _body = json['body'];
    _userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this._title;
    data['body'] = this._body;
    data['userId'] = this._userId;
    return data;
  }

  @override
  String toString() {
    return 'Post{_id: $_id, _title: $_title, _body: $_body, _userId: $_userId}\n';
  }
}