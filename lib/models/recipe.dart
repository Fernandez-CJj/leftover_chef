class Recipe {
  final String image;
  final String name;
  final String description;
  final String prep;
  final String cook;
  final String category;
  final String ingredients;
  final String matchingIngredients;
  final String steps;
  final int favorite;

  Recipe({
    required this.image,
    required this.name,
    required this.description,
    required this.prep,
    required this.cook,
    required this.category,
    required this.ingredients,
    required this.matchingIngredients,
    required this.steps,
    this.favorite = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'description': description,
      'prep': prep,
      'cook': cook,
      'category': category,
      'ingredients': ingredients,
      'matching_ingredients': matchingIngredients,
      'steps': steps,
      'favorite': favorite,
    };
  }

  Map<String, dynamic> toOwnMap() {
    return {
      'image': image,
      'name': name,
      'description': description,
      'prep': prep,
      'cook': cook,
      'category': category,
      'ingredients': ingredients,
      'matching_ingredients': matchingIngredients,
      'steps': steps,
    };
  }
}
