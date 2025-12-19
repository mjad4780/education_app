class ResponseService<T> {
  final bool result;
  final String messege;
  final T? data;

  ResponseService(this.result, this.messege, [this.data]);
}
