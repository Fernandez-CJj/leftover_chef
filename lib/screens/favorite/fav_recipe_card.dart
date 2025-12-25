import 'package:etr_project/helpers/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RecipeFavCard extends StatelessWidget {
  final Map<String, dynamic> recipe;
  final String currentFilter;
  final VoidCallback refreshParent;
  final VoidCallback onView;

  const RecipeFavCard({
    super.key,
    required this.recipe,
    required this.currentFilter,
    required this.refreshParent,
    required this.onView,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onView,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child:
                  recipe['image'] != null &&
                      recipe['image'].toString().isNotEmpty
                  ? Image.asset(
                      recipe['image'],
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
                    recipe['name'] ?? '',
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
                    recipe['description'] ?? '',
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
                          'Prep: ${recipe['prep'] ?? '-'}',
                          style: TextStyle(fontSize: 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          final shouldRemove = await showDialog<bool>(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text('Remove Favorite'),
                              content: Text(
                                'Do you want to remove ${recipe['name']} from your favorites?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(ctx).pop(false),
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.of(ctx).pop(true),
                                  child: Text('Remove'),
                                ),
                              ],
                            ),
                          );
                          if (shouldRemove == true) {
                            await Dbhelper.toggleFavorite(
                              recipe['id'],
                              recipe['favorite'],
                            );
                            refreshParent();
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  recipe['favorite'] == 0
                                      ? '${recipe["name"]} added to favorites'
                                      : '${recipe["name"]} removed from favorites',
                                ),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  textColor: Colors.orange,
                                  onPressed: () async {
                                    await Dbhelper.toggleFavorite(
                                      recipe['id'],
                                      recipe['favorite'] == 1 ? 0 : 1,
                                    );
                                    refreshParent();
                                  },
                                ),
                              ),
                            );
                          }
                        },
                        icon: Icon(
                          Icons.favorite,
                          size: 35,
                          color: recipe['favorite'] == 1
                              ? Colors.orange
                              : Colors.grey,
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
                          'Cook: ${recipe['cook'] ?? '-'}',
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
