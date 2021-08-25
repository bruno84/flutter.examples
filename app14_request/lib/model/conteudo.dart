
// OBS: classe criada com: https://javiercbk.github.io/json_to_dart/
// OBS: classe baseada na API de teste: https://jsonplaceholder.typicode.com/todos/
// Só adicionei as mudanças do null safety.

class Conteudo
{
  late int userId;
  late int id;
  late String title;
  late bool completed;

  Conteudo({required this.userId, required this.id, required this.title, required this.completed});

  // Json -> Objeto
  Conteudo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  // Objeto -> Json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.completed;
    return data;
  }

  @override
  String toString() {
    return 'Conteudo{userId: $userId, id: $id, title: $title, completed: $completed}';
  }
}