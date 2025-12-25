import 'package:etr_project/screens/all_recipe/all_recipes_screen.dart';
import 'package:etr_project/screens/favorite/favorite_screen.dart';
import 'package:etr_project/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade100, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange, Colors.deepOrange.shade400],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.3),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.restaurant_menu,
                      color: Colors.orange,
                      size: 38,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Leftover Chef',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      shadows: [
                        Shadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 1, color: Colors.orange.shade200),
            _buildDrawerItem(
              context,
              icon: Icons.home,
              text: 'Home',
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => HomeScreen())),
            ),
            _buildDrawerItem(
              context,
              icon: Icons.list,
              text: 'All Recipes',
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => AllRecipes())),
            ),
            _buildDrawerItem(
              context,
              icon: Icons.favorite,
              text: 'Favorites',
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => FavoriteRecipe())),
            ),

            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Version 1.0.0',
                style: TextStyle(
                  color: Colors.orange.shade300,
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildDrawerItem(
  BuildContext context, {
  required IconData icon,
  required String text,
  required VoidCallback onTap,
}) {
  return ListTile(
    leading: Container(
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(6),
      child: Icon(icon, color: Colors.orange, size: 24),
    ),
    title: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Colors.orange.shade900,
        letterSpacing: 0.5,
      ),
    ),
    onTap: onTap,
    hoverColor: Colors.orange.shade50,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );
}
