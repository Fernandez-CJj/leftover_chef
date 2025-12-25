import 'package:etr_project/helpers/dbhelper.dart';
import 'package:etr_project/screens/all_recipe/recipe_card.dart';
import 'package:flutter/material.dart';

class RecipesScreen extends StatefulWidget {
  final List<String> ingredientsList;
  const RecipesScreen({super.key, required this.ingredientsList});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        title: Text('Matched Recipes'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FutureBuilder(
          future: Dbhelper.fetchAllRecipe(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            final recipes = snapshot.data!;
            // Filter recipes: only those where ALL recipe ingredients are in the user's list
            final filteredRecipes = recipes.where((recipe) {
              final recipeIngredients = recipe['matching_ingredients'].split(
                '|',
              );
              return recipeIngredients.every(
                (ingredient) => widget.ingredientsList.contains(ingredient),
              );
            }).toList();

            if (filteredRecipes.isEmpty) {
              return Center(
                child: Text(
                  'No recipes found matching all your ingredients.',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              );
            }
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 4 / 5.7,
              ),
              itemBuilder: (_, index) {
                final recipe = filteredRecipes[index];
                return RecipeCard(recipe: recipe);
              },
              itemCount: filteredRecipes.length,
            );
          },
        ),
      ),
    );
  }
}
