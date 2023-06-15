// ignore_for_file: public_member_api_docs, sort_constructors_first
class ComponentModel {
  int id;
  String title;
  String image;
  String slug;
  String link;

  ComponentModel({
    required this.id,
    required this.title,
    required this.image,
    required this.slug,
    required this.link,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'image': image,
      'slug': slug,
      'link': slug,
    };
  }

  factory ComponentModel.fromMap(Map<String, dynamic> map) {
    return ComponentModel(
      id: map['id'] as int,
      title: map['title'] as String,
      image: map['image'] as String,
      slug: map['slug'] as String,
      link: map['link'] as String,
    );
  }
}
