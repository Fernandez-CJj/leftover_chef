import 'package:etr_project/helpers/dbhelper.dart';
import 'package:etr_project/screens/view_recipe/ingredient_card.dart';
import 'package:etr_project/screens/view_recipe/steps_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ViewRecipe extends StatefulWidget {
  const ViewRecipe({super.key, required this.recipe});
  final Map<String, dynamic> recipe;

  @override
  State<ViewRecipe> createState() => _ViewRecipeState();
}

class _ViewRecipeState extends State<ViewRecipe> {
  late Map<String, dynamic> recipe;

  @override
  void initState() {
    super.initState();
    recipe = Map<String, dynamic>.from(widget.recipe);
  }

  bool isIngredients = true;
  var ingredientsList = [];
  var stepsList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe['name']),
        centerTitle: true,
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recipe Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.recipe['image'],
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.recipe['name'] ?? '',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    (recipe['favorite'] ?? 0) == 1
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.orange,
                    size: 32,
                  ),
                  onPressed: () async {
                    await Dbhelper.toggleFavorite(
                      recipe['id'],
                      recipe['favorite'],
                    );
                    setState(() {
                      recipe['favorite'] = recipe['favorite'] == 1 ? 0 : 1;
                    });
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: recipe['favorite'] == 1
                            ? Text('${recipe['name']} added to favorites')
                            : Text('${recipe['name']} removed from favorites'),
                      ),
                    );
                  },
                ),
              ],
            ),
            // Description
            Text(
              widget.recipe['description'] ?? '',
              style: TextStyle(
                fontSize: 16,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            Gap(8),
            Card(
              color: const Color(0xFFFFF3E0),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Colors.orange[700],
                      size: 22,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'This recipe is portioned for 3 people. Adjust the ingredient amounts as needed to suit your group size or preference.',
                        style: TextStyle(
                          color: Color.fromARGB(255, 91, 91, 91),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.timer, color: Colors.orange),
                const SizedBox(width: 6),
                Text(
                  'Prep: ${widget.recipe['prep'] ?? ''}',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(width: 20),
                Icon(Icons.restaurant, color: Colors.orange),
                const SizedBox(width: 6),
                Text(
                  'Cook: ${widget.recipe['cook'] ?? ''}',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: getIngredients,
                    icon: Icon(Icons.list_alt, color: Colors.orange),
                    label: Text(
                      'Ingredients',
                      style: TextStyle(color: Colors.orange),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      side: BorderSide(color: Colors.orange, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
                Gap(12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: getSteps,
                    icon: Icon(Icons.menu_book, color: Colors.orange),
                    label: Text(
                      'Steps',
                      style: TextStyle(color: Colors.orange),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      side: BorderSide(color: Colors.orange, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ],
            ),
            Gap(16),
            ...(isIngredients
                ? ingredientsList
                      .map(
                        (ingredient) => IngredientCard(ingredient: ingredient),
                      )
                      .toList()
                : stepsList
                      .asMap()
                      .entries
                      .map(
                        (entry) =>
                            StepsCard(step: entry.value, index: entry.key),
                      )
                      .toList()),
          ],
        ),
      ),
    );
  }

  void getIngredients() {
    setState(() {
      isIngredients = true;
      var ingredientsRaw = recipe['ingredients'];
      ingredientsList = ingredientsRaw.split('|');
    });
  }

  void getSteps() {
    setState(() {
      isIngredients = false;
      var stepsRaw = recipe['steps'];
      stepsList = stepsRaw.split('|');
    });
  }
}
