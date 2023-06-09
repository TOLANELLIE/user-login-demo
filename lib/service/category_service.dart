import 'package:user_login_design/model/category.dart';

final jsonMockData = [
  {
    "name": "Fruits",
    "imagePath": "https://picsum.photos/400/400?random=1",
    "numberOfItems": 20,
    "description": "A category for all kinds of fruits"
  },
  {
    "name": "Vegetables",
    "imagePath": "https://picsum.photos/400/400?random=2",
    "numberOfItems": 15,
    "description": "A category for all kinds of vegetables"
  },
  {
    "name": "Meat",
    "imagePath": "https://picsum.photos/400/400?random=3",
    "numberOfItems": 10,
    "description": "A category for all kinds of meat"
  },
  {
    "name": "Dairy",
    "imagePath": "https://picsum.photos/400/400?random=4",
    "numberOfItems": 5,
    "description": "A category for all kinds of dairy products"
  },
  {
    "name": "Bakery",
    "imagePath": "https://picsum.photos/400/400?random=5",
    "numberOfItems": 25,
    "description": "A category for all kinds of bakery products"
  },
  {
    "name": "Snacks",
    "imagePath": "https://picsum.photos/400/400?random=6",
    "numberOfItems": 30,
    "description": "A category for all kinds of snacks"
  },
  {
    "name": "Beverages",
    "imagePath": "https://picsum.photos/400/400?random=7",
    "numberOfItems": 40,
    "description": "A category for all kinds of beverages"
  },
  {
    "name": "Frozen Foods",
    "imagePath": "https://picsum.photos/400/400?random=8",
    "numberOfItems": 12,
    "description": "A category for all kinds of frozen foods"
  },
  {
    "name": "Canned Foods",
    "imagePath": "https://picsum.photos/400/400?random=9",
    "numberOfItems": 8,
    "description": "A category for all kinds of canned foods"
  },
  {
    "name": "Personal Care",
    "imagePath": "https://picsum.photos/400/400?random=10",
    "numberOfItems": 18,
    "description": "A category for all kinds of personal care products"
  }
];

class CategoryService {
  Future<List<Category>> getCategories() async {
    try {
      //simulate a delay while fetching data
      await Future.delayed(const Duration(seconds: 1), () {});

      //Convert JSON Data to Category Objects
      List<Category> categories = [];
      for (var categoey in jsonMockData) {
        categories.add(Category.fromJson(categoey));
      }
      return categories;
    } catch (e) {
      throw "Error fetching categories";
    }
  }
}
