import 'package:etr_project/helpers/dbhelper.dart';
import 'package:etr_project/screens/favorite/fav_recipe_card.dart';
import 'package:etr_project/screens/favorite/view_fav_recipe.dart';
import 'package:etr_project/widgets/app_drawer.dart';
import 'package:etr_project/widgets/recipe_filter_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FavoriteRecipe extends StatefulWidget {
  const FavoriteRecipe({super.key});

  @override
  State<FavoriteRecipe> createState() => _FavoriteRecipeState();
}

class _FavoriteRecipeState extends State<FavoriteRecipe> {
  Future<List<Map<String, dynamic>>> category = Dbhelper.fetchAllFavRecipe();
  String currentFilter = 'all';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        title: Text('Favorites'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsetsGeometry.all(12),
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
                        category = Dbhelper.fetchAllFavRecipe();
                        currentFilter = 'all';
                      });
                    },
                  ),
                  RecipeFilterButton(
                    label: 'Breakfast',
                    isActive: currentFilter == 'breakfast',
                    onPressed: () {
                      setState(() {
                        category = Dbhelper.fetchBreakfastFavRecipes();
                        currentFilter = 'breakfast';
                      });
                    },
                  ),
                  RecipeFilterButton(
                    label: 'Lunch/Dinner',
                    isActive: currentFilter == 'lunch',
                    onPressed: () {
                      setState(() {
                        category = Dbhelper.fetchLunchDinnerFavRecipes();
                        currentFilter = 'lunch';
                      });
                    },
                  ),
                  RecipeFilterButton(
                    label: 'Snacks',
                    isActive: currentFilter == 'snacks',
                    onPressed: () {
                      setState(() {
                        category = Dbhelper.fetchSnacksFavRecipes();
                        currentFilter = 'snacks';
                      });
                    },
                  ),
                ],
              ),
            ),
            Gap(16),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
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
                    itemCount: recipes.length,
                    itemBuilder: (_, index) {
                      final recipe = recipes[index];
                      return RecipeFavCard(
                        recipe: recipe,
                        currentFilter: currentFilter,
                        refreshParent: () {
                          setState(() {
                            switch (currentFilter) {
                              case 'all':
                                category = Dbhelper.fetchAllFavRecipe();
                                break;
                              case 'breakfast':
                                category = Dbhelper.fetchBreakfastFavRecipes();
                                break;
                              case 'lunch':
                                category =
                                    Dbhelper.fetchLunchDinnerFavRecipes();
                                break;
                              case 'snacks':
                                category = Dbhelper.fetchSnacksFavRecipes();
                                break;
                            }
                          });
                        },
                        onView: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ViewFavRecipe(recipe: recipe),
                            ),
                          );
                          setState(() {
                            switch (currentFilter) {
                              case 'all':
                                category = Dbhelper.fetchAllFavRecipe();
                                break;
                              case 'breakfast':
                                category = Dbhelper.fetchBreakfastFavRecipes();
                                break;
                              case 'lunch':
                                category =
                                    Dbhelper.fetchLunchDinnerFavRecipes();
                                break;
                              case 'snacks':
                                category = Dbhelper.fetchSnacksFavRecipes();
                                break;
                            }
                          });
                        },
                      );
                    },
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
