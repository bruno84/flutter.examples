
class ResponseGeneric
{
  late int _page;
  late int _per_page;
  late int _total;
  late int _total_pages;
  late List<dynamic> _data;

  ResponseGeneric.fromJson(Map<String, dynamic> parsedJson)
  {
    _page = parsedJson['page'];
    _per_page = parsedJson['per_page'];
    _total = parsedJson['total'];
    _total_pages = parsedJson['total_pages'];
    _data = parsedJson['data'];
  }

  int get page => _page;
  int get per_page => _per_page;
  int get total => _total;
  int get total_pages => _total_pages;
  List<dynamic> get data => _data;

  @override
  String toString() {
    return 'ResponseGeneric{_page: $_page, _per_page: $_per_page, _total: $_total, _total_pages: $_total_pages, _data: $_data}';
  }
}
