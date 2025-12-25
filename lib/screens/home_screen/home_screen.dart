import 'package:etr_project/helpers/dbhelper.dart';
import 'package:etr_project/screens/home_screen/recipes_screen.dart';
import 'package:etr_project/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> allIngredients = [];
  var ingredientInputCtrl = TextEditingController();
  List<String> allInputIngredients = [];
  String input = '';

  @override
  void initState() {
    super.initState();
    Dbhelper.fetchAllRecipe().then((recipes) {
      final tempIngredients = <String>[];
      for (var recipe in recipes) {
        tempIngredients.addAll(recipe['matching_ingredients'].split('|'));
      }
      setState(() {
        allIngredients = tempIngredients.toSet().toList(); // Remove duplicates
      });
    });
    ingredientInputCtrl.addListener(() {
      setState(() {
        input = ingredientInputCtrl.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> suggestions = [];
    if (input.isNotEmpty) {
      suggestions = allIngredients
          .where(
            (ingredient) =>
                ingredient.toLowerCase().contains(input.toLowerCase()),
          )
          .toSet()
          .toList(); // Remove duplicates from suggestions
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        title: Text('Leftover Chef'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Center(
                child: Text(
                  'What ingredients do you have?',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange.shade800,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextField(
                          controller: ingredientInputCtrl,
                          style: TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Input ingredient',
                            labelStyle: TextStyle(
                              color: Colors.orange.shade700,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange.shade700,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 14,
                          ),
                        ),
                        onPressed: addIngredient,
                        icon: Icon(Icons.add),
                        label: Text('Add'),
                      ),
                    ],
                  ),
                ),
              ),
              if (suggestions.isNotEmpty)
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.orange.shade200),
                  ),
                  height: 120,
                  child: ListView.builder(
                    itemCount: suggestions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(suggestions[index]),
                        leading: Icon(Icons.fastfood, color: Colors.orange),
                        onTap: () {
                          ingredientInputCtrl.text = suggestions[index];
                          FocusScope.of(context).unfocus();
                        },
                      );
                    },
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      'Your Ingredients:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.orange.shade700,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '(swipe to remove)',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.orange.shade400,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: allInputIngredients.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_basket_outlined,
                              size: 60,
                              color: Colors.orange.shade200,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'No ingredients added yet.',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (_, index) {
                          final inputIngredient = allInputIngredients[index];
                          return Dismissible(
                            key: UniqueKey(),
                            background: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 24),
                              decoration: BoxDecoration(
                                color: Colors.red.shade300,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.delete, color: Colors.white),
                                  SizedBox(width: 8),
                                  Text(
                                    'Delete',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            secondaryBackground: Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right: 24),
                              decoration: BoxDecoration(
                                color: Colors.red.shade300,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Delete',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(Icons.delete, color: Colors.white),
                                ],
                              ),
                            ),
                            confirmDismiss: (direction) {
                              var result = showDialog<bool>(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    title: Text('Confirm Delete'),
                                    content: Text(
                                      'Remove "$inputIngredient" from your list?',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                        child: Text('No'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(true),
                                        child: Text('Yes'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              return result;
                            },
                            onDismissed: (direction) {
                              setState(() {
                                allInputIngredients.removeAt(index);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('$inputIngredient removed'),
                                  ),
                                );
                              });
                            },
                            child: Card(
                              color: Colors.orange.shade50,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                title: Text(
                                  inputIngredient,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: allInputIngredients.length,
                      ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade800,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => RecipesScreen(
                              ingredientsList: allInputIngredients,
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.restaurant_menu, size: 24),
                          SizedBox(width: 10),
                          Text(
                            'Match Ingredients!!!',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  void addIngredient() {
    setState(() {
      if (ingredientInputCtrl.text == '') {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Invalid input')));
        return;
      } else {
        allInputIngredients.add(ingredientInputCtrl.text);
        ingredientInputCtrl.clear();
      }
    });
  }
}
