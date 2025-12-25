import 'package:etr_project/helpers/dbhelper.dart';
import 'package:etr_project/screens/all_recipe/recipe_card.dart';
import 'package:etr_project/widgets/recipe_filter_button.dart';
import 'package:etr_project/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AllRecipes extends StatefulWidget {
  const AllRecipes({super.key});

  @override
  State<AllRecipes> createState() => _AllRecipesState();
}

class _AllRecipesState extends State<AllRecipes> {
  Future<List<Map<String, dynamic>>> category = Dbhelper.fetchAllRecipe();
  String currentFilter = 'all';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        title: Text('All Recipes'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  RecipeFilterButton(
                    label: 'All',
                    isActive: currentFilter == 'all',
                    onPressed: () {
                      setState(() {
                        category = Dbhelper.fetchAllRecipe();
                        currentFilter = 'all';
                      });
                    },
                  ),
                  RecipeFilterButton(
                    label: 'Breakfast',
                    isActive: currentFilter == 'breakfast',
                    onPressed: () {
                      setState(() {
                        category = Dbhelper.fetchBreakfastRecipes();
                        currentFilter = 'breakfast';
                      });
                    },
                  ),
                  RecipeFilterButton(
                    label: 'Lunch/Dinner',
                    isActive: currentFilter == 'lunch',
                    onPressed: () {
                      setState(() {
                        category = Dbhelper.fetchLunchDinnerRecipes();
                        currentFilter = 'lunch';
                      });
                    },
                  ),
                  RecipeFilterButton(
                    label: 'Snacks',
                    isActive: currentFilter == 'snacks',
                    onPressed: () {
                      setState(() {
                        category = Dbhelper.fetchSnacksRecipes();
                        currentFilter = 'snacks';
                      });
                    },
                  ),
                ],
              ),
            ),
            Gap(16),
            Expanded(
              child: FutureBuilder(
                future: category,
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final recipes = snapshot.data!;
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 4 / 5.7,
                    ),
                    itemBuilder: (_, index) {
                      final recipe = recipes[index];
                      return RecipeCard(recipe: recipe);
                    },
                    itemCount: recipes.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
