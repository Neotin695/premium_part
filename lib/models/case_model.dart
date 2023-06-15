import 'package:permium_parts/models/component_model.dart';

class CaseModel extends ComponentModel {
  String sidePanel;
  int vgaMaxLength;

  
  CaseModel({
    required super.id,
    required super.title,
    required super.slug,
    required this.sidePanel,
    required this.vgaMaxLength,
    required super.image,
    required super.link,
  });

  factory CaseModel.fromMap(Map<String, dynamic> json) => CaseModel(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        sidePanel: json["side_panel"],
        vgaMaxLength: json["vga_max_length"],
        image: json["image"],
        link: json["link"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "slug": slug,
        "side_panel": sidePanel,
        "vga_max_length": vgaMaxLength,
        "image": image,
        "link": link,
      };
}
