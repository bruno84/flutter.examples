
class Response<T>
{
  late bool ok;
  late String msg;
  late T? result;

  Response.ok({this.result, this.msg=""}) {
    ok = true;
  }

  Response.error({this.result,this.msg=""}) {
    ok = false;
  }
}