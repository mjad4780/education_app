class Resource {
  final String uri;
  final String name;
  Resource({required this.uri, required this.name});

  factory Resource.fromJson(Map<String, dynamic> json) => Resource(
      uri: json['url'] as String, name: json['name'] as String

      // throw UnimplementedError('Resource.fromJson($json) is not implemented');
      );
}
