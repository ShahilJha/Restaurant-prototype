import 'dart:convert';

const TableNumberList = [1, 2, 3, 4, 5, 6, 7, 8, 9];

class Menu {
  Menu._privateConstructor();
  static final Menu instance = Menu._privateConstructor();

  final Map _menuData = {
    "Categories": [
      {
        "CategoryName": "Soup",
        "CategoryItems": [
          {"ID": 0, "name": "Cream of Tomato soup", "price": 200},
          {"ID": 1, "name": "Cream of Mushroom", "price": 205},
          {"ID": 2, "name": "Cream of Chicken", "price": 225},
          {"ID": 3, "name": "Hot & Sour Soup Veg", "price": 225},
          {"ID": 4, "name": "Hot & Sour Soup Chicken", "price": 250}
        ]
      },
      {
        "CategoryName": "Salad",
        "CategoryItems": [
          {"ID": 5, "name": "Greek Salad", "price": 280},
          {"ID": 6, "name": "Caesar Salad (Veg)", "price": 280},
          {"ID": 7, "name": "Caesar Salad (Chicken)", "price": 380},
          {"ID": 8, "name": "Fitness Salad (Chicken)", "price": 370},
          {"ID": 9, "name": "Green Salad Nepali Style", "price": 210}
        ]
      },
      {
        "CategoryName": "Breakfast Specials",
        "CategoryItems": [
          {"ID": 10, "name": "Croque Mademoiselle", "price": 330},
          {"ID": 11, "name": "Bella Benedict", "price": 430},
          {"ID": 12, "name": "Classic Breakfast", "price": 330},
          {"ID": 13, "name": "Farmer's Breakfast", "price": 420},
          {"ID": 14, "name": "Pancakes (Plain)", "price": 270},
          {"ID": 15, "name": "Pancakes (Banana)", "price": 270}
        ]
      },
      {
        "CategoryName": "Omelets",
        "CategoryItems": [
          {"ID": 16, "name": "Cheese & Tomato", "price": 270},
          {"ID": 17, "name": "Ham & Cheese", "price": 335},
          {"ID": 18, "name": "Spinach, Mushroom & Cheese", "price": 315},
          {"ID": 19, "name": "Bell Pepper and Cheese", "price": 365},
          {"ID": 20, "name": "Margarita Omelet", "price": 335}
        ]
      },
      {
        "CategoryName": "CRAZY BURGERS",
        "CategoryItems": [
          {"ID": 21, "name": "Veg Burger", "price": 170},
          {"ID": 22, "name": "Chicken Burger", "price": 200},
          {"ID": 23, "name": "Chicken Tikka Burger", "price": 200},
          {"ID": 24, "name": "Grilled Chicken Burger", "price": 210},
          {"ID": 25, "name": "Spicy Chicken Burger", "price": 225},
          {"ID": 26, "name": "Ham with Cheese Burger", "price": 210},
          {"ID": 27, "name": "Maxi Ham Burger", "price": 215},
          {"ID": 28, "name": "Beef Burger", "price": 280}
        ]
      },
      {
        "CategoryName": "Combo Meal",
        "CategoryItems": [
          {"ID": 29, "name": "Veg Combo Meal", "price": 380},
          {"ID": 30, "name": "Chicken Combo Meal", "price": 400},
          {"ID": 31, "name": "Ham Combo Meal", "price": 405},
          {"ID": 32, "name": "Spicy Chicken Combo Meal", "price": 425}
        ]
      },
      {
        "CategoryName": "Sandwich",
        "CategoryItems": [
          {"ID": 33, "name": "Veg Sandwich", "price": 170},
          {"ID": 34, "name": "Egg Sandwich", "price": 185},
          {"ID": 35, "name": "Cheese Sandwich", "price": 185},
          {"ID": 36, "name": "Chicken Sandwich", "price": 225},
          {"ID": 37, "name": "Ham & Cheese Sandwich", "price": 240},
          {"ID": 38, "name": "Grilled Tuna Sandwich", "price": 250},
          {"ID": 39, "name": "Bacon Sandwich", "price": 250},
          {"ID": 40, "name": "Beef Sandwich", "price": 260},
          {"ID": 41, "name": "Hot Dog", "price": 180}
        ]
      },
      {
        "CategoryName": "Continental Favorites",
        "CategoryItems": [
          {"ID": 42, "name": "Chicken/ Stroganoff", "price": 530},
          {"ID": 43, "name": "Chicken in the Nest", "price": 520},
          {"ID": 44, "name": "Grilled Chicken", "price": 570},
          {"ID": 45, "name": "Grilled Herbed Fish", "price": 550},
          {"ID": 46, "name": "Cajun Spices Grilled Fish", "price": 550},
          {"ID": 47, "name": "Garlic Steak", "price": 600}
        ]
      },
      {
        "CategoryName": "PIZZA",
        "CategoryItems": [
          {"ID": 48, "name": "Margarita", "price": 380},
          {"ID": 50, "name": "Fungi", "price": 450},
          {"ID": 51, "name": "Chicken", "price": 470},
          {"ID": 52, "name": "BBQ", "price": 480},
          {"ID": 53, "name": "Salami/Ham", "price": 480},
          {"ID": 54, "name": "Ham and Mushroom", "price": 460},
          {"ID": 55, "name": "Mixed Vegetable", "price": 470},
          {"ID": 56, "name": "Crazy Special", "price": 510}
        ]
      },
      {
        "CategoryName": "Extra Topping",
        "CategoryItems": [
          {"ID": 57, "name": "Garlic/ Tomato/ Onion", "price": 50},
          {"ID": 58, "name": "Pineapple/ Capsicum/ Grilled Veg", "price": 60},
          {"ID": 59, "name": "Mushroom/Mozzarella/ Black Olive", "price": 60},
          {
            "ID": 60,
            "name": "Salami/ Bacon/ Ham/ Tuna Fish/ Smoked Chicken",
            "price": 110
          }
        ]
      },
      {
        "CategoryName": "PASTA",
        "CategoryItems": [
          {"ID": 61, "name": "Napolitana", "price": 370},
          {"ID": 62, "name": "Arrabiata", "price": 340},
          {"ID": 63, "name": "Fungi", "price": 390},
          {"ID": 64, "name": "Bolognara", "price": 425},
          {"ID": 65, "name": "Carbonara", "price": 430},
          {"ID": 66, "name": "Crazy Special", "price": 490}
        ]
      },
      {
        "CategoryName": "Vegetable Snacks",
        "CategoryItems": [
          {"ID": 67, "name": "Tomato Brochette", "price": 280},
          {"ID": 68, "name": "French Fries", "price": 170},
          {"ID": 69, "name": "Mustang Aloo", "price": 230},
          {"ID": 70, "name": "Aloo Jeera", "price": 210},
          {"ID": 71, "name": "Chips Chilly", "price": 250},
          {"ID": 72, "name": "Masala Papad", "price": 200},
          {"ID": 73, "name": "Crispy Paneer", "price": 350},
          {"ID": 74, "name": "Onion Rings", "price": 240}
        ]
      },
      {
        "CategoryName": "Non-Vegetarian Snacks",
        "CategoryItems": [
          {"ID": 75, "name": "Chicken Chilly Boneless", "price": 350},
          {"ID": 76, "name": "Chicken Sadheko", "price": 330},
          {"ID": 77, "name": "Chicken Wings", "price": 330},
          {"ID": 78, "name": "Chicken Drumstick", "price": 350},
          {"ID": 79, "name": "Crispy Chicken", "price": 400},
          {"ID": 80, "name": "Chicken Popcorn", "price": 350},
          {"ID": 81, "name": "Dragon Chicken", "price": 360},
          {"ID": 82, "name": "Fish Finger", "price": 370},
          {"ID": 83, "name": "Fish Amrit Sarry", "price": 380}
        ]
      },
      {
        "CategoryName": "Fried Rice",
        "CategoryItems": [
          {"ID": 84, "name": "Veg", "price": 190},
          {"ID": 85, "name": "Egg", "price": 220},
          {"ID": 86, "name": "Chicken", "price": 240},
          {"ID": 87, "name": "Mix", "price": 300}
        ]
      },
      {
        "CategoryName": "Biryani",
        "CategoryItems": [
          {"ID": 88, "name": "Veg", "price": 380},
          {"ID": 89, "name": "Chicken", "price": 450}
        ]
      },
      {
        "CategoryName": "MO:MO",
        "CategoryItems": [
          {"ID": 90, "name": "Veg", "price": 170},
          {"ID": 91, "name": "Chicken", "price": 195},
          {"ID": 92, "name": "Buff", "price": 165}
        ]
      },
      {
        "CategoryName": "SOUP MO:MO",
        "CategoryItems": [
          {"ID": 93, "name": "Veg Soup Mo:Mo", "price": 225},
          {"ID": 94, "name": "Chicken Soup Mo:Mo", "price": 250}
        ]
      },
      {
        "CategoryName": "C MO:MO",
        "CategoryItems": [
          {"ID": 95, "name": "Veg C Mo:Mo", "price": 230},
          {"ID": 96, "name": "Chicken C Mo:Mo", "price": 260}
        ]
      },
      {
        "CategoryName": "Thukpa",
        "CategoryItems": [
          {"ID": 97, "name": "Veg Thukpa", "price": 190},
          {"ID": 98, "name": "Chicken Thukpa", "price": 230},
          {"ID": 99, "name": "Mixed Thukpa", "price": 280}
        ]
      },
      {
        "CategoryName": "Chowmein",
        "CategoryItems": [
          {"ID": 100, "name": "Veg", "price": 190},
          {"ID": 101, "name": "Chicken", "price": 240},
          {"ID": 102, "name": "Mixed", "price": 300}
        ]
      },
      {
        "CategoryName": "Chopsy",
        "CategoryItems": [
          {"ID": 103, "name": "American Chopsy", "price": 450},
          {"ID": 104, "name": "Chinese Chopsy", "price": 400}
        ]
      },
      {
        "CategoryName": "Café Specialty (Hot)",
        "CategoryItems": [
          {"ID": 105, "name": "Espresso", "price": 120},
          {"ID": 106, "name": "Double Espresso", "price": 180},
          {"ID": 107, "name": "Espresso Conpanna", "price": 130},
          {"ID": 108, "name": "Espresso Macchiato", "price": 130},
          {"ID": 109, "name": "Latte Macchiato", "price": 140},
          {"ID": 110, "name": "Café Latte", "price": 150},
          {"ID": 112, "name": "Caramel Latte", "price": 150},
          {"ID": 113, "name": "Honey Latte", "price": 150},
          {"ID": 114, "name": "Café Mocha", "price": 160},
          {"ID": 115, "name": "Cappuccino", "price": 150},
          {"ID": 116, "name": "Americano", "price": 130}
        ]
      },
      {
        "CategoryName": "Café (Cold)",
        "CategoryItems": [
          {"ID": 117, "name": "Iced Americano", "price": 155},
          {"ID": 118, "name": "Iced cappuccino", "price": 175},
          {"ID": 119, "name": "Iced Latte", "price": 175},
          {"ID": 120, "name": "Iced Mocha", "price": 180},
          {"ID": 121, "name": "Blended Mocha", "price": 190},
          {
            "ID": 122,
            "name": "Blended Orange/ pineapple/Lemonade",
            "price": 150
          }
        ]
      },
      {
        "CategoryName": "Shakes",
        "CategoryItems": [
          {"ID": 123, "name": "Milk Shake", "price": 185},
          {"ID": 124, "name": "Oreo Shake", "price": 180}
        ]
      },
      {
        "CategoryName": "Smoothie",
        "CategoryItems": [
          {"ID": 125, "name": "Banana", "price": 165},
          {"ID": 126, "name": "Papaya", "price": 165},
          {"ID": 127, "name": "Mango", "price": 170},
          {"ID": 128, "name": "Mixed", "price": 190}
        ]
      },
      {
        "CategoryName": "Lassie",
        "CategoryItems": [
          {"ID": 129, "name": "Sweet", "price": 135},
          {"ID": 130, "name": "Banana", "price": 150},
          {"ID": 131, "name": "Papaya", "price": 160},
          {"ID": 132, "name": "Mixed", "price": 190}
        ]
      },
      {
        "CategoryName": "Beverage",
        "CategoryItems": [
          {"ID": 133, "name": "Plain Soda", "price": 60},
          {"ID": 134, "name": "Mineral Water", "price": 50},
          {"ID": 135, "name": "Fresh Lemon Soda", "price": 70},
          {"ID": 136, "name": "Coke/Fanta/Sprite (250ml)", "price": 70},
          {"ID": 137, "name": "Coke/Fanta/Sprite (500ml)", "price": 130},
          {"ID": 138, "name": "Diet Coke", "price": 140},
          {"ID": 139, "name": "Red Bull ", "price": 140},
          {"ID": 140, "name": "Chilled Can Juice", "price": 150},
          {"ID": 141, "name": "Iced Tea", "price": 160},
          {"ID": 142, "name": "Hot Lemon with Honey", "price": 130},
          {"ID": 143, "name": "Milk Tea", "price": 60},
          {"ID": 144, "name": "Flavor Tea", "price": 40},
          {"ID": 145, "name": "Hot Chocolate", "price": 150}
        ]
      },
      {
        "CategoryName": "Ice Cream Specialties",
        "CategoryItems": [
          {"ID": 146, "name": "Ice Cream (Two Scoops)", "price": 120},
          {"ID": 147, "name": "Regular Sundae", "price": 195},
          {"ID": 148, "name": "Strawberry Sundae", "price": 265},
          {"ID": 149, "name": "Cold Chocolate Sundae", "price": 265},
          {"ID": 150, "name": "Banana Split Sundae", "price": 295},
          {"ID": 151, "name": "Crazy Special Sundae", "price": 395}
        ]
      },
      {
        "CategoryName": "Beers (Can)",
        "CategoryItems": [
          {"ID": 152, "name": "Tuborg", "price": 350},
          {"ID": 153, "name": "Carlsberg", "price": 380},
          {"ID": 154, "name": "Sherpa", "price": 400},
          {"ID": 155, "name": "Nepal Ice", "price": 330}
        ]
      },
      {
        "CategoryName": "Beers Bottle",
        "CategoryItems": [
          {"ID": 156, "name": "Tuborg", "price": 470},
          {"ID": 157, "name": "Carlsberg", "price": 500},
          {"ID": 158, "name": "Everest", "price": 450},
          {"ID": 159, "name": "Gorkha", "price": 450},
          {"ID": 160, "name": "Nepal Ice", "price": 450}
        ]
      },
      {
        "CategoryName": "House Wine",
        "CategoryItems": [
          {"ID": 161, "name": "Red or White Wine Per Glass", "price": 400},
          {"ID": 162, "name": "Red or White Wine Per Btl", "price": 1500}
        ]
      },
      {
        "CategoryName": "Domestic Spirits (60ml)",
        "CategoryItems": [
          {"ID": 163, "name": "Old Durbar regular", "price": 445},
          {"ID": 164, "name": "Old Durbar Black Chimney", "price": 485},
          {"ID": 165, "name": "Whiskey/ Vodka/Gin/ Rum/Brandy", "price": 375}
        ]
      },
      {
        "CategoryName": "Imported Spirits (60 ml)",
        "CategoryItems": [
          {"ID": 166, "name": "Grey Goose", "price": 895},
          {
            "ID": 167,
            "name": "Gordon’s/ Smirnoff/ Vodka/Beefeater/Absolute",
            "price": 695
          },
          {
            "ID": 168,
            "name": "Bacardi Rum/ Malibu Rum/ Captain Morgan (Jamaican Rum)",
            "price": 605
          },
          {"ID": 169, "name": "Tequila Shot (Gold/ Silver)", "price": 465}
        ]
      },
      {
        "CategoryName": "Regular Scotch Whisky (60ml)",
        "CategoryItems": [
          {
            "ID": 170,
            "name": "J&B/ Vat 69/ Ballantines/ Jim Beam",
            "price": 695
          }
        ]
      },
      {
        "CategoryName": "PREMIUM SCOTCH WHISKY (12 years old) (60ml)",
        "CategoryItems": [
          {"ID": 171, "name": "Chivas Regal (18 years)", "price": 1465},
          {
            "ID": 172,
            "name": "Jack Daniels/Singleton (12 years)",
            "price": 685
          },
          {"ID": 173, "name": "Red Label", "price": 700}
        ]
      }
    ]
  };

  static final menuCategories = instance._menuData.keys.toList();
  static final categoriesLength = menuCategories.length;

  get menu => json.encode(_menuData);

  List getCategoryItems(String category) {
    return instance._menuData[category];
  }

  int getCategoryLength(String category) {
    return instance._menuData[category].length;
  }
}
