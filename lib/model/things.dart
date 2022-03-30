
enum Category { friends, rooms, market, }

class Thing {
  const Thing({
    required this.category,
    required this.id,
    required this.isFeatured,
    required this.name,
  });

  final Category category;
  final int id;
  final bool isFeatured;
  final String name;

  String get assetName => '$category/$id.jpg';
  String get assetPackage => 'shrine_images';

  @override
  String toString() => "$name (id=$id)";
}
