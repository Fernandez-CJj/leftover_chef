import 'package:etr_project/helpers/dbhelper.dart';
import 'package:etr_project/models/recipe.dart';
import 'package:sqflite/sqflite.dart';

Future<void> seedRecipes() async {
  var db = await Dbhelper.openDb();
  var count = Sqflite.firstIntValue(
    await db.rawQuery('SELECT COUNT(*) FROM ${Dbhelper.recipeTb}'),
  );
  if (count == 0) {
    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/arrozcaldo.jpg',
        name: 'Arroz Caldo',
        description: 'Filipino Chicken congee with boiled eggs.',
        prep: '10 minutes',
        cook: '30-50 minutes',
        category: 'breakfast',
        ingredients:
            '1 lbs chicken cut into serving pieces|0.38 cup Jasmine rice|0.38 cup sweet rice|1 Maggi Magic Chicken Cube|17 ounces water|4 cloves garlic chopped|1.5 onions chopped|4 eggs hard boiled|0.5 cup green onions chopped|1.5 thumbs ginger julienne|0.5 tablespoon safflower kasubha|0.5 teaspoon turmeric powder|Fish sauce and ground black pepper to taste|2.5 tablespoons cooking oil',
        matchingIngredients:
            'chicken|jasmine rice|sweet rice|maggi magic chicken cube|garlic|onion|eggs|green onions|ginger|safflower kasubha|turmeric powder|fish sauce',
        steps:
            'Heat around 5 tablespoons of cooking oil in a wok. Add the garlic immediately. Slow fry it while occasionally stirring until golden brown. Remove the garlic from the wok. Set aside.|Saute the onion in the remaining oil until it softens. Add ginger. Saute for 1 minute|Add the chicken and continue sautéing until the color of the exterior turns light brown. Pour 2 tablespoons of fish sauce. Stir.|Add the jasmine and sweet rice. Saute for 30 seconds.|Pour the water into the wok. Cover and let it boil.|Add Maggi Magic Chicken Cube. Adjust the heat to the lowest setting. Simmer the chicken while occasionally stirring until the rice breaks down with a thick consistency. (note: this usually takes more than 35 minutes to achieve).|Add turmeric powder and safflower. Stir.|Season with ground black pepper and fish sauce as needed.|Add the boiled eggs, toasted garlic, and chopped green onions.|Transfer to a serving bowl and top with more toasted garlic and chopped green onions. Serve with a condiment of calamansi and fish sauce.|Share and enjoy!',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/talongommelete.jpg',
        name: 'Eggplant Omelette',
        description: 'This is a recipe for Eggplant Omelette',
        prep: '10 minutes',
        cook: '8 minutes',
        category: 'breakfast',
        ingredients:
            '4 pieces eggs|2 eggplant|0.38 teaspoon garlic powder|0.38 teaspoon salt|A dash of ground black pepper|6 tablespoons olive oil',
        matchingIngredients: 'eggs|eggplant|garlic powder|',
        steps:
            'Beat the eggs in a large bowl. Add salt, ground black pepper, and garlic powder. Continue to beat until all ingredients are well blended. Set aside.|Use a fork to create tiny holes all over the eggplant. Cook the eggplant by either baking it in the oven at 400F for 20 to 25 minutes, or exposing it in fire over a stove top until the skin gets burnt and turns black.|Let the eggplant cool down. Peel the skin then cut the stalk off. Arrange the eggplant flat in a plate. Gently mash using a fork.|Transfer the mashed eggplant to the bowl with beaten egg. Beat until the eggplant is well incorporated with all the ingredients.|Meanwhile, heat olive oil in a pan. Once the oil gets hot, pour the mixture into the pan. Continue to cook in low to medium heat for 3 to 5 minutes.|Flip the eggplant omellette using a plate. Do this by lifting the pan and tilt it towards the plate until the content slides into the plate (you can also use a spatula). Make sure that the cooked part is facing down. Now, hold the plate with one hand and the pan with the other. Cover the plate with pan and then quickly flip it over in a way that the top part of the omellete (which is still uncooked) touches the base of the pan. Continue to cook for 3 minutes.|Transfer to a serving plate. Serve with your favorite condiment.|Share and enjoy!',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/tapsilog.jpg',
        name: 'Tapsilog',
        description:
            'A delicious meal composed of fried marinated beef, garlic fried rice, and fried egg. This is best eaten with a saucer of vinegar as dipping sauce for the beef.',
        prep: '10 minutes',
        cook: '30 minutes',
        category: 'breakfast',
        ingredients:
            '1 lb. beef sirloin sliced thinly|3 pieces eggs|6 tablespoons cooking oil|3 tablespoons Knorr Liquid Seasoning|6 cloves crushed garlic|¾ cups pineapple juice|2 tablespoons brown sugar|¼ teaspoon ground white pepper|5 cups leftover rice|1 teaspoon salt|5 cloves garlic crushed',
        matchingIngredients:
            'beef sirloin|eggs|knorr liquid seasoning|pineapple juice|brown sugar|rice|garlic',
        steps:
            'Prepare the tapa by placing the beef in a large bowl. Combine with all the tapa marinade ingredients. Mix well and cover the bowl. Place inside the fridge and marinate overnight.|Cook the garlic fried rice (sinangag na kanin) by heating 3 tablespoons cooking oil in a pan. Add crushed garlic. Cook until garlic turns light brown. Add the leftover rice. Stir-fry for 3 minutes.|Season with salt. Continue to stir-fry for 3 to 5 minutes. Set aside.|Start to cook the tapa. Heat a pan and pour the marinated beef into it, including the marinade. Add ¾ cups water. Let the mixture boil. Cover the pan and continue to cook until the liquid reduces to half. Add 3 tablespoons cooking oil into the mixture. Continue to cook until the liquid completely evaporates. Fry the beef tapa in remaining oil until medium brown. Set aside.|Fry the egg by pouring 1 tablespoon oil on a pan. Crack a piece of egg and sprinkle enough salt on top. Cook for 30 seconds. Pour 2 tablespoons water on the side of the pan. Cover and let the water boil. Continue to cook until the egg yolks gets completely cooked by the steam.|Arrange the beef tapa, sinangag, and fried egg on a large plate to form Tapsilog. Serve with vinegar as dipping sauce for tapa.',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/tuyo.jpg',
        name: 'Tuyo with Rice and Tomato',
        description:
            'Tuyo fish is a type of Filipino sun dried fish. This is usually fried quickly and eaten with spicy vinegar dip and rice.',
        prep: '5 minutes',
        cook: '10 minutes',
        category: 'breakfast',
        ingredients:
            '10 pieces tuyo salted dried fish|3 cups cooked white rice|3 plum tomatoes wedged|Cooking oil spray|1/2 cup spiced vinegar|',
        matchingIngredients: 'tuyo|rice|tomatoes|vinegar',
        steps:
            'Preheat oven to 400F.|Arrange the tuyo fish in an aluminum foil sheet. Spray both sides of the fish with cooking oil. Secure the fish inside the sheet by covering with another aluminum sheet and secure the sides.|Open your vent (this is important). Bake for 6 to 10 minutes.|Remove the fish from the sealed sheet and arrange in individual plates with a cup of white rice and wedged tomato.|Serve with spiced vinegar.|Share and enjoy!',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/longanisafriedrice.jpg',
        name: 'Tuyo with Rice and Tomato',
        description:
            'Longganissa Fried Rice is a fried rice version using Longganisa (Filipino Sausage). This is best eaten during breakfast. Making Longganisa Fried rice is quick and easy, as long as you have longganisa around.',
        prep: '5 minutes',
        cook: '20 minutes',
        category: 'breakfast',
        ingredients:
            '3.75 cups leftover steamed white rice|2.25 pieces longganisa removed from the casing and the chopped|1.5 raw eggs|1.5 teaspoons sea salt|0.75 teaspoon garlic powder|1.5 teaspoons soy sauce|2.25 tablespoons cooking oil',
        matchingIngredients: 'rice|longganisa|eggs|garlic powder|soy sauce|',
        steps:
            'Combine the rice, salt, and garlic powder. Gently mash the mixture until the rice breaks apart and all the ingredients are well distributed.|Heat the oil in a wide frying pan.|When the oil becomes hot, put-in the chopped longganisa. Cook for 2 minutes.|Put-in the mashed rice. Cook for 5 minutes in medium heat while stirring once in awhile.|Make a space in the pan by putting the rice on one side.|Crack the eggs and then put in the open space of the pan. Let the eggs cook and then chop using the tip of your spatula.|Gently mix the eggs with the rest of the Ingredients.|Pour-in the soy sauce. Stir and then cook for one minute.|Transfer to a serving plate.|Serve. Share and enjoy!',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/lechon_paksiw.jpg',
        name: 'Paksiw na Lechon',
        description: 'Leftover lechon cooked in a sour and savory sauce.',
        prep: '10 minutes',
        cook: '20 minutes',
        category: 'lunch',
        ingredients:
            '3 cups leftover lechon (chopped)|½ cup vinegar|¼ cup soy sauce|5 cloves garlic (crushed)|2 bay leaves|½ teaspoon pepper',
        matchingIngredients: 'lechon|vinegar|soy sause|garlic|bay leaves',
        steps:
            'Combine all ingredients in a pot.|Simmer on low heat.|Cook until sauce thickens.',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/adobong_kangkong.jpg',
        name: 'Adobong Kangkong (from Adobo Sauce)',
        description: 'Vegetables cooked using leftover adobo sauce.',
        prep: '5 minutes',
        cook: '10 minutes',
        category: 'lunch',
        ingredients:
            '2 bunches kangkong|½ cup leftover adobo sauce|5 cloves garlic (minced)|2 tablespoons oil',
        matchingIngredients: 'kangkong|adobo sauce|garlic',
        steps:
            'Heat oil in a pan.|Sauté garlic.|Add kangkong and adobo sauce.|Cook until vegetables are tender.',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/pork_menudo.jpg',
        name: 'Menudong Baboy (from Leftover Pork Adobo)',
        description: 'Leftover pork adobo turned into a tomato-based stew.',
        prep: '10 minutes',
        cook: '20 minutes',
        category: 'lunch',
        ingredients:
            '3 cups leftover pork adobo (chopped)|1 cup tomato sauce|1 medium potato (cubed)|½ cup carrots (sliced)|1 medium onion (chopped)|2 tablespoons oil',
        matchingIngredients: 'pork adobo|tomato sauce|potato|carrots|onion',
        steps:
            'Heat oil and sauté onion.|Add pork adobo.|Pour tomato sauce and add vegetables.|Simmer until vegetables are cooked.',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/afritadong_manok.jpg',
        name: 'Afritadang Manok (from Fried Chicken)',
        description: 'Leftover fried chicken cooked in tomato sauce.',
        prep: '10 minutes',
        cook: '20 minutes',
        category: 'lunch',
        ingredients:
            '3 cups leftover fried chicken (chopped)|1 cup tomato sauce|1 medium potato (cubed)|½ cup carrots (sliced)|1 medium onion (chopped)|2 cloves garlic (minced)',
        matchingIngredients: 'pork adobo|tomato sauce|potato|carrots|onion',
        steps:
            'Sauté garlic and onion.|Add fried chicken.|Pour tomato sauce and add vegetables.|Simmer until soft.',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/bicol_express.jpg',
        name: 'Bicol Express (from Leftover Pork Adobo)',
        description: 'Leftover pork adobo cooked in coconut milk and chili.',
        prep: '10 minutes',
        cook: '20 minutes',
        category: 'lunch',
        ingredients:
            '2½ cups leftover pork adobo (chopped)|1½ cups coconut milk|3 tablespoons bagoong|5 pieces chili (sliced)|1 small onion (chopped)',
        matchingIngredients: 'pork adobo|coconut milk|bagoong|chili|onion',
        steps:
            'Sauté onion.|Add pork adobo and bagoong.|Pour coconut milk and add chili.|Simmer until sauce thickens.',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/calderetang_baboy.jpg',
        name: 'Calderetang Baboy (from Leftover Roast Pork)',
        description: 'Leftover roast pork turned into a rich tomato stew.',
        prep: '10 minutes',
        cook: '25 minutes',
        category: 'lunch',
        ingredients:
            '3 cups leftover roast pork (cubed)|1 cup tomato sauce|½ cup liver spread|1 medium potato (cubed)|½ cup carrots (sliced)|1 medium onion (chopped)',
        matchingIngredients:
            'roast pork|tomato sauce|liver spread|potato|carrots|onion',
        steps:
            'Sauté onion.|Add pork.|Add tomato sauce, liver spread, and vegetables.|Simmer until thick.',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/ginataang_manok.jpg',
        name: 'Ginataang Manok (from Leftover Roast Chicken)',
        description: 'Leftover roast chicken cooked in coconut milk.',
        prep: '10 minutes',
        cook: '20 minutes',
        category: 'lunch',
        ingredients:
            '3 cups leftover roast chicken (chopped)|1½ cups coconut milk|1 cup sayote or papaya (sliced)|1 small onion (chopped)|2 cloves garlic (minced)',
        matchingIngredients: 'roast chicken|coconut milk|sayote|onion|garlic',
        steps:
            'Sauté garlic and onion.|Add chicken and vegetables.|Pour coconut milk.|Simmer until cooked.',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/pork_sisig.jpg',
        name: 'Sisig Style Pork (from Leftover Lechon Kawali)',
        description:
            'Leftover lechon kawali turned into a sizzling-style dish.',
        prep: '10 minutes',
        cook: '15 minutes',
        category: 'lunch',
        ingredients:
            '3 cups leftover lechon kawali (chopped)|1 medium onion (chopped)|3 tablespoons calamansi juice|2 tablespoons soy sauce|½ teaspoon pepper',
        matchingIngredients: 'lechon kawali|onion|calamansi juice|soy sauce',
        steps:
            'Heat pan and add pork.|Add onion, calamansi, soy sauce, and pepper.|Cook until sizzling.',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/sinigang_baboy.jpg',
        name: 'Sinigang na Baboy (from Leftover Grilled Pork)',
        description: 'Leftover grilled pork cooked in a sour soup.',
        prep: '10 minutes',
        cook: '25 minutes',
        category: 'lunch',
        ingredients:
            '3 cups leftover grilled pork|5 cups water|1 packet sinigang mix|2 cups mixed vegetables|1 medium onion (quartered)',
        matchingIngredients: 'grilled pork|sinigang mix|vegetables|onion',
        steps:
            'Boil water and add onion.|Add pork and vegetables.|Add sinigang mix.|Simmer until vegetables are cooked.',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/pinanyahang_manok.jpg',
        name: 'Pininyahang Manok (from Leftover Fried Chicken)',
        description: 'Leftover fried chicken cooked in milk and pineapple.',
        prep: '10 minutes',
        cook: '20 minutes',
        category: 'lunch',
        ingredients:
            '3 cups leftover fried chicken (chopped)|1 cup pineapple chunks|1 cup pineapple juice|½ cup evaporated milk|1 small onion (chopped)',
        matchingIngredients:
            'fried chicken|pineapple chunks|pineapple juice|enaporated milk|onion',
        steps:
            'Sauté onion.|Add chicken and pineapple.|Pour pineapple juice and milk.|Simmer until thick.',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/tortang-giniling.jpg',
        name: 'Tortang Giniling',
        description:
            'Leftover ground meat turned into a savory omelette, perfect for breakfast.',
        prep: '5 minutes',
        cook: '10 minutes',
        category: 'breakfast',
        ingredients:
            '1½ cups leftover giniling (cooked ground pork or beef)|4 eggs|½ cup onion (chopped)|2 cloves garlic (minced)|2 tablespoons cooking oil|¼ teaspoon salt|¼ teaspoon pepper',
        matchingIngredients: 'giniling|eggs|onion|garlic',
        steps:
            'Crack eggs into a bowl and beat well.|Add leftover giniling, chopped onion, garlic, salt, and pepper. Mix evenly.|Heat cooking oil in a medium pan over medium heat.|Pour the egg-meat mixture into the pan and spread evenly.|Cook for 4–5 minutes until the bottom is golden brown.|Carefully flip using a spatula and cook the other side for another 3–4 minutes.|Serve hot with rice or pandesal.',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/cornedbeef_omelette.jpg',
        name: 'Corned Beef Hash Omelette',
        description:
            'Leftover corned beef cooked with onions and potatoes, then turned into a savory omelette.',
        prep: '5 minutes',
        cook: '10 minutes',
        category: 'breakfast',
        ingredients:
            '1½ cups leftover cooked corned beef|1 small potato (cubed, leftover or cooked)|4 eggs|½ cup onion (chopped)|2 tablespoons cooking oil|¼ teaspoon pepper',
        matchingIngredients: 'corned beef|potato|eggs|onion',
        steps:
            'Heat oil in a pan over medium heat.|Sauté onion until soft, about 2 minutes.|Add cubed potatoes and corned beef. Stir for 3–4 minutes until evenly heated.|Beat eggs in a bowl and season with pepper.|Pour eggs over the corned beef and potato mixture, spreading evenly.|Cook for 4–5 minutes until the bottom is set.|Carefully flip and cook another 3–4 minutes until cooked through.|Serve hot with rice, pandesal, or toast.',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/ginisang_sardinas.jpg',
        name: 'Ginisang Sardinas',
        description:
            'Leftover canned sardines cooked with onion and garlic for a quick breakfast.',
        prep: '5 minutes',
        cook: '10 minutes',
        category: 'breakfast',
        ingredients:
            '2 cups leftover sardines (drained and chopped)|1 medium onion (sliced)|2 cloves garlic (minced)|2 tablespoons cooking oil|½ teaspoon pepper|1 small tomato (optional, chopped)',
        matchingIngredients: 'sardines|onion|garlic|tomato',
        steps:
            'Heat oil in a pan over medium heat.|Sauté garlic until fragrant, about 30 seconds.|Add onion and tomato, cook until soft, about 2–3 minutes.|Add chopped sardines and gently stir to combine.|Season with pepper.|Cook for 3–4 minutes until heated through.|Serve hot with rice or pandesal.',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/friedrice-omelette.jpg',
        name: 'Fried Rice Omelette',
        description:
            'Leftover rice mixed with eggs and vegetables, turned into a breakfast omelette.',
        prep: '5 minutes',
        cook: '10 minutes',
        category: 'breakfast',
        ingredients:
            '2 cups leftover rice|3 eggs|½ cup leftover cooked vegetables (carrots, peas, etc.)|1 small onion (chopped)|2 tablespoons cooking oil|¼ teaspoon salt|¼ teaspoon pepper',
        matchingIngredients: 'rice|eggs|onion',
        steps:
            'Beat eggs in a bowl and season with salt and pepper.|Heat oil in a pan over medium heat.|Sauté onion until soft, about 2 minutes.|Add leftover rice and vegetables, stir for 2–3 minutes.|Pour beaten eggs over rice and mix gently.|Press the mixture into a flat layer and cook 4–5 minutes until bottom is golden.|Flip carefully and cook another 3–4 minutes.|Serve hot with ketchup or hot sauce.',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/tocino-omelette.jpg',
        name: 'Leftover Tocino Stir-Fry Omelette',
        description: 'Leftover tocino cooked into a sweet and savory omelette.',
        prep: '5 minutes',
        cook: '10 minutes',
        category: 'breakfast',
        ingredients:
            '1½ cups leftover cooked tocino (chopped)|4 eggs|1 small onion (chopped)|2 tablespoons cooking oil|¼ teaspoon pepper',
        matchingIngredients: 'tocino|eggs|onion',
        steps:
            'Heat oil in a pan over medium heat.|Sauté onion for 2 minutes until soft.|Add chopped tocino and cook for 2–3 minutes until slightly caramelized.|Beat eggs in a bowl and season with pepper.|Pour eggs over tocino mixture, spreading evenly.|Cook for 4–5 minutes until bottom is set.|Flip carefully and cook 3–4 minutes on the other side.|Serve hot with rice or pandesal.',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/lumpia-gulay.jpg',
        name: 'Lumpiang Gulay (from Leftover Vegetables)',
        description:
            'Leftover cooked vegetables wrapped and fried into crispy spring rolls.',
        prep: '15 minutes',
        cook: '10 minutes',
        category: 'snacks',
        ingredients:
            '2 cups leftover cooked vegetables (cabbage, carrots, beans)|10 lumpia wrappers|2 tablespoons cooking oil (for sautéing)|Cooking oil (for frying)',
        matchingIngredients: 'vegetables|lumpia wrappers',
        steps:
            'Chop leftover vegetables into small pieces.|Heat 2 tablespoons oil in a pan over medium heat.|Sauté vegetables for 2–3 minutes to remove excess moisture.|Let vegetables cool, then place 2 tablespoons on a wrapper.|Roll tightly and seal with water.|Heat oil over medium heat and fry for 3–4 minutes per side.|Remove when golden brown and drain excess oil.',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/turon.jpg',
        name: 'Turon (from Leftover Saging na Saba)',
        description:
            'Leftover cooked saba bananas wrapped in lumpia wrapper and fried until crispy.',
        prep: '10 minutes',
        cook: '10 minutes',
        category: 'snacks',
        ingredients:
            '5 leftover cooked saba bananas (halved)|10 lumpia wrappers|¼ cup brown sugar|Cooking oil (for frying).',
        matchingIngredients: 'saba|lumpia wrappers|brown sugar',
        steps:
            'Place banana on wrapper and sprinkle with brown sugar.|Roll wrapper tightly and seal with water.|Heat oil over medium heat.|Fry for 3–4 minutes per side until crispy and golden.|Drain excess oil and serve warm.',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/ukoy.jpg',
        name: 'Ukoy (from Leftover Shrimp and Vegetables)',
        description:
            'Leftover shrimp and vegetables mixed into batter and fried into crispy fritters.',
        prep: '10 minutes',
        cook: '10 minutes',
        category: 'snacks',
        ingredients:
            '1½ cups leftover cooked shrimp|1 cup leftover vegetables|½ cup flour|½ cup water|Cooking oil (for frying)',
        matchingIngredients: 'shrimp|vegetables|flour',
        steps:
            'Chop shrimp and vegetables into small pieces.|Mix flour and water until smooth.|Add shrimp and vegetables and mix well.|Heat oil over medium heat.|Spoon batter into oil and fry 3–4 minutes per side.|Drain excess oil before serving.',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/banana-que.jpg',
        name: 'Banana Cue (from Leftover Fried Bananas)',
        description:
            'Leftover fried bananas reheated and coated with caramelized sugar',
        prep: '5 minutes',
        cook: '8 minutes',
        category: 'snacks',
        ingredients:
            '6 leftover fried bananas|¼ cup brown sugar|1 tablespoon cooking oil',
        matchingIngredients: 'banana|brown sugar',
        steps:
            'Heat oil over low to medium heat.|Add brown sugar and let melt.|Add bananas and gently turn to coat.|Cook until sugar sticks well to bananas.|Remove and let cool slightly.',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/lumpia-saging.jpg',
        name: 'Lumpiang Saging (from Leftover Boiled Saba)',
        description:
            'Leftover boiled saba bananas wrapped and fried into a sweet Filipino snack.',
        prep: '10 minutes',
        cook: '10 minutes',
        category: 'snacks',
        ingredients:
            '5 leftover boiled saba bananas (halved lengthwise)|10 lumpia wrappers|¼ cup brown sugar|Cooking oil (for frying)',
        matchingIngredients: 'banana|lumpia wrappers|brown sugar',
        steps:
            'Place banana on wrapper and sprinkle with brown sugar.|Roll tightly and seal with water.|Heat oil over medium heat.|Fry for 3–4 minutes per side until golden brown.|Drain excess oil before serving.',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/fried-tokwa.jpg',
        name: 'Fried Tokwa Bites (from Leftover Tofu)',
        description:
            'Leftover tofu fried until crispy on the outside and soft inside.',
        prep: '5 minutes',
        cook: '8 minutes',
        category: 'snacks',
        ingredients:
            '2 cups leftover cooked tofu (cubed)|Cooking oil (for frying)|Salt (optional)',
        matchingIngredients: 'tofu',
        steps:
            'Cut tofu into bite-sized cubes.|Heat oil over medium heat.|Fry tofu for 3–4 minutes, turning occasionally.|Remove once golden brown and drain excess oil.',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/fish-nuggets.jpg',
        name: 'Breaded Fish Nuggets (from Leftover Cooked Fish)',
        description:
            'Leftover cooked fish coated and fried into crispy snack pieces.',
        prep: '10 minutes',
        cook: '10 minutes',
        category: 'snacks',
        ingredients:
            '2 cups leftover cooked fish (cut into chunks)|1 egg (beaten)|½ cup breadcrumbs|Cooking oil (for frying)',
        matchingIngredients: 'fish|eggs|breadcrumbs',
        steps:
            'Cut fish into bite-sized pieces.|Dip fish into beaten egg.|Coat with breadcrumbs evenly.|Heat oil over medium heat.|Fry for 3–4 minutes per side until golden brown.|Drain excess oil and serve warm.',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/fishcake-patties.jpg',
        name: 'Fish Cake Patties (from Leftover Fish)',
        description: 'Leftover fish mixed and pan-fried into small patties.',
        prep: '10 minutes',
        cook: '10 minutes',
        category: 'snacks',
        ingredients:
            '2 cups leftover cooked fish (flaked)|1 egg|½ cup breadcrumbs|Cooking oil (for frying)',
        matchingIngredients: 'fish|eggs|breadcrumbs',
        steps:
            'Remove bones and flake fish.|Mix fish, egg, and breadcrumbs.|Shape into small patties.|Heat oil over medium heat.|Fry patties 3–4 minutes per side until golden brown.|Drain excess oil before serving.',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/bread-pizza.jpg',
        name: 'Bread Pizza (from Leftover Bread)',
        description:
            'Leftover bread topped and cooked like mini Filipino-style pizza.',
        prep: '10 minutes',
        cook: '8 minutes',
        category: 'snacks',
        ingredients:
            '6 slices leftover bread|½ cup leftover sauce|½ cup grated cheese',
        matchingIngredients: 'bread|sauce|cheese',
        steps:
            'Spread sauce evenly on bread slices.|Sprinkle cheese on top.|Cook on a covered pan over low heat.|Heat for 5–8 minutes until cheese melts.|Serve hot.',
        favorite: 0,
      ),
    );

    await Dbhelper.insertRecipe(
      Recipe(
        image: 'assets/images/komote-fries.jpg',
        name: 'Camote Fries (from Leftover Boiled Camote)',
        description:
            'Leftover boiled sweet potato sliced and fried into merienda fries.',
        prep: '5 minutes',
        cook: '10 minutes',
        category: 'snacks',
        ingredients:
            '3 cups leftover boiled camote|Cooking oil (for frying)|Sugar or salt (optional)',
        matchingIngredients: 'kamote',
        steps:
            'Slice camote into sticks.|Heat oil over medium heat.|Fry camote for 4–5 minutes, turning occasionally.|Remove once lightly crispy.|Drain excess oil and season if desired.',
        favorite: 0,
      ),
    );
  }
}
