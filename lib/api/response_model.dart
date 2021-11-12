class ResponseModel {
  ResponseModel({required this.slug, required this.key});

  final String slug;
  final String key;

  ResponseModel.fromJson(Map<String, dynamic> json)
      : slug = json['slug'],
        key = json['key'];

  Map<String, dynamic> toJson() => {'slug': slug, 'key': key};
}
