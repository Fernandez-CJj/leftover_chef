import 'package:etr_project/models/recipe.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Dbhelper {
  static const String dbName = 'locDb';
  static const int version = 1;

  static const String recipeTb = 'recipetb';
  static const String myRecipeTb = 'myrecipetb';

  static const String recipeColId = 'id';
  static const String recipeColImage = 'image';
  static const String recipeColName = 'name';
  static const String recipeColDescription = 'description';
  static const String recipeColCategory = 'category';
  static const String recipeColPrep = 'prep';
  static const String recipeColCook = 'cook';
  static const String recipeColIngredients = 'ingredients';
  static const String recipeColMatchingIngredients = 'matching_ingredients';
  static const String recipeColSteps = 'steps';
  static const String recipeColFavorite = 'favorite';

  static Future<Database> openDb() async {
    var path = join(await getDatabasesPath(), dbName);

    var sql =
        '''CREATE TABLE IF NOT EXISTS $recipeTb(
      $recipeColId INTEGER PRIMARY KEY AUTOINCREMENT,
      $recipeColImage TEXT,
      $recipeColName TEXT,
      $recipeColDescription TEXT,
      $recipeColPrep TEXT,
      $recipeColCook TEXT,
      $recipeColCategory TEXT,
      $recipeColIngredients TEXT,
      $recipeColMatchingIngredients TEXT,
      $recipeColSteps TEXT,
      $recipeColFavorite INT DEFAULT 0
    );''';

    var sql2 =
        '''CREATE TABLE IF NOT EXISTS $myRecipeTb(
      $recipeColId INTEGER PRIMARY KEY AUTOINCREMENT,
      $recipeColImage TEXT,
      $recipeColName TEXT,
      $recipeColDescription TEXT,
      $recipeColPrep TEXT,
      $recipeColCook TEXT,
      $recipeColCategory TEXT,
      $recipeColIngredients TEXT,
      $recipeColSteps TEXT
    );''';

    var db = await openDatabase(
      path,
      version: version,
      onCreate: (db, version) async {
        await db.execute(sql);
        await db.execute(sql2);
        print('table created');
      },
    );

    print('db opened');
    return db;
  }

  static Future<void> insertRecipe(Recipe recipe) async {
    var db = await openDb();
    await db.insert(recipeTb, recipe.toMap());
  }

  static Future<void> printAllRecipes() async {
    var db = await openDb();
    print('all recipes');
    var items = await db.query(recipeTb);
    for (var item in items) {
      _printLongString(item.toString());
    }
  }

  static void _printLongString(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is chunk size
    for (final match in pattern.allMatches(text)) {
      print(match.group(0));
    }
  }

  static Future<void> deleteAllRecipe() async {
    var db = await openDb();
    await db.delete(recipeTb);
  }

  //get all the recipe
  static Future<List<Map<String, dynamic>>> fetchAllRecipe() async {
    var db = await openDb();
    var recipes = await db.query(recipeTb);
    await db.close();
    return recipes;
  }

  //get all the recipe for breakfast
  static Future<List<Map<String, dynamic>>> fetchBreakfastRecipes() async {
    var db = await openDb();
    var recipes = await db.query(
      recipeTb,
      where: '$recipeColCategory = ?',
      whereArgs: ['breakfast'],
    );
    await db.close();
    return recipes;
  }

  //get all the recipe for lunch/dinner
  static Future<List<Map<String, dynamic>>> fetchLunchDinnerRecipes() async {
    var db = await openDb();
    var recipes = await db.query(
      recipeTb,
      where: '$recipeColCategory = ?',
      whereArgs: ['lunch'],
    );
    await db.close();
    return recipes;
  }

  //get all the recipe for snacks
  static Future<List<Map<String, dynamic>>> fetchSnacksRecipes() async {
    var db = await openDb();
    var recipes = await db.query(
      recipeTb,
      where: '$recipeColCategory = ?',
      whereArgs: ['snacks'],
    );
    await db.close();
    return recipes;
  }

  static Future<void> toggleFavorite(int recipeId, int currentFavorite) async {
    var db = await openDb();
    int newFavorite = currentFavorite == 1 ? 0 : 1;
    await db.update(
      recipeTb,
      {recipeColFavorite: newFavorite},
      where: '$recipeColId = ?',
      whereArgs: [recipeId],
    );

    await db.close();
  }

  //get all the favorite recipes
  static Future<List<Map<String, dynamic>>> fetchAllFavRecipe() async {
    var db = await openDb();
    var recipes = await db.query(
      recipeTb,
      where: '$recipeColFavorite = ?',
      whereArgs: [1],
    );
    await db.close();
    return recipes;
  }

  //get all the recipe for breakfast
  static Future<List<Map<String, dynamic>>> fetchBreakfastFavRecipes() async {
    var db = await openDb();
    var recipes = await db.query(
      recipeTb,
      where: '$recipeColCategory = ? AND $recipeColFavorite = ?',
      whereArgs: ['breakfast', 1],
    );
    await db.close();
    return recipes;
  }

  //get all the recipe for lunch/dinner
  static Future<List<Map<String, dynamic>>> fetchLunchDinnerFavRecipes() async {
    var db = await openDb();
    var recipes = await db.query(
      recipeTb,
      where: '$recipeColCategory = ? AND $recipeColFavorite = ?',
      whereArgs: ['lunch', 1],
    );
    await db.close();
    return recipes;
  }

  //get all the recipe for snacks
  static Future<List<Map<String, dynamic>>> fetchSnacksFavRecipes() async {
    var db = await openDb();
    var recipes = await db.query(
      recipeTb,
      where: '$recipeColCategory = ? AND $recipeColFavorite = ?',
      whereArgs: ['snacks', 1],
    );
    await db.close();
    return recipes;
  }

  //the functions below are for MyRecipes

  //fetch all the recipes
  static Future<List<Map<String, dynamic>>> fetchAllOwnRecipes() async {
    var db = await openDb();
    var result = await db.query(myRecipeTb);
    await db.close();
    return result;
  }

  static Future<List<Map<String, dynamic>>> fetchMyBreakfastRecipes() async {
    var db = await openDb();
    var recipes = await db.query(
      myRecipeTb,
      where: '$recipeColCategory = ?',
      whereArgs: ['breakfast'],
    );
    await db.close();
    return recipes;
  }

  //get all the recipe for lunch/dinner
  static Future<List<Map<String, dynamic>>> fetchMyLunchDinnerRecipes() async {
    var db = await openDb();
    var recipes = await db.query(
      myRecipeTb,
      where: '$recipeColCategory = ?',
      whereArgs: ['lunch'],
    );
    await db.close();
    return recipes;
  }

  //get all the recipe for snacks
  static Future<List<Map<String, dynamic>>> fetchMySnacksRecipes() async {
    var db = await openDb();
    var recipes = await db.query(
      myRecipeTb,
      where: '$recipeColCategory = ?',
      whereArgs: ['snacks'],
    );
    await db.close();
    return recipes;
  }
}
