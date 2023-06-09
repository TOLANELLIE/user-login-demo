class Category {
  final String name;
  final String imagePath;
  final int numberOfItems;
  final String description;

  Category({
    required this.name,
    required this.imagePath,
    required this.numberOfItems,
    required this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      imagePath: json['imagePath'],
      numberOfItems: json['numberOfItems'],
      description: json['description'],
    );
  }
}
