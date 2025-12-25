import 'package:etr_project/helpers/dbhelper.dart';
import 'package:etr_project/screens/view_recipe/view_recipe_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RecipeCard extends StatefulWidget {
  const RecipeCard({super.key, required this.recipe});

  final Map<String, dynamic> recipe;

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.recipe['favorite'] == 1;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final updatedRecipe = Map<String, dynamic>.from(widget.recipe);
        updatedRecipe['favorite'] = isFavorite ? 1 : 0;
        await Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => ViewRecipe(recipe: updatedRecipe)),
        );
        // After returning, reload the latest favorite value from the database
        final recipes = await Dbhelper.fetchAllRecipe();
        final refreshed = recipes.firstWhere(
          (r) => r['id'] == widget.recipe['id'],
          orElse: () => widget.recipe,
        );
        setState(() {
          isFavorite = refreshed['favorite'] == 1;
        });
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child:
                  widget.recipe['image'] != null &&
                      widget.recipe['image'].toString().isNotEmpty
                  ? Image.asset(
                      widget.recipe['image'],
                      height: 110,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      height: 110,
                      width: double.infinity,
                      color: Colors.orange.shade100,
                      child: Icon(
                        Icons.fastfood,
                        color: Colors.orange,
                        size: 40,
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.recipe['name'] ?? '',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.orange.shade800,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gap(4),
                  Text(
                    widget.recipe['description'] ?? '',
                    style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Icon(Icons.timer, size: 16, color: Colors.orange),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          'Prep: ${widget.recipe['prep'] ?? '-'}',
                          style: TextStyle(fontSize: 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await Dbhelper.toggleFavorite(
                            widget.recipe['id'],
                            isFavorite ? 1 : 0,
                          );
                          setState(() {
                            isFavorite = !isFavorite;
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: isFavorite
                                    ? Text(
                                        '${widget.recipe["name"]} added to favorites',
                                      )
                                    : Text(
                                        '${widget.recipe["name"]} removed from favorites',
                                      ),
                              ),
                            );
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          size: 35,
                          color: isFavorite ? Colors.orange : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.restaurant_menu,
                        size: 16,
                        color: Colors.orange,
                      ),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          'Cook: ${widget.recipe['cook'] ?? '-'}',
                          style: TextStyle(fontSize: 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
