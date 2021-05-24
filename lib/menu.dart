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
          {"id": 0, "name": "Cream of Tomato soup", "price": 200},
          {"id": 1, "name": "Cream of Mushroom", "price": 205},
          {"id": 2, "name": "Cream of Chicken", "price": 225},
          {"id": 3, "name": "Hot & Sour Soup Veg", "price": 225},
          {"id": 4, "name": "Hot & Sour Soup Chicken", "price": 250}
        ]
      },
      {
        "CategoryName": "Salad",
        "CategoryItems": [
          {"id": 5, "name": "Greek Salad", "price": 280},
          {"id": 6, "name": "Caesar Salad (Veg)", "price": 280},
          {"id": 7, "name": "Caesar Salad (Chicken)", "price": 380},
          {"id": 8, "name": "Fitness Salad (Chicken)", "price": 370},
          {"id": 9, "name": "Green Salad Nepali Style", "price": 210}
        ]
      },
      {
        "CategoryName": "Breakfast Specials",
        "CategoryItems": [
          {"id": 10, "name": "Croque Mademoiselle", "price": 330},
          {"id": 11, "name": "Bella Benedict", "price": 430},
          {"id": 12, "name": "Classic Breakfast", "price": 330},
          {"id": 13, "name": "Farmer's Breakfast", "price": 420},
          {"id": 14, "name": "Pancakes (Plain)", "price": 270},
          {"id": 15, "name": "Pancakes (Banana)", "price": 270}
        ]
      },
      {
        "CategoryName": "Omelets",
        "CategoryItems": [
          {"id": 16, "name": "Cheese & Tomato", "price": 270},
          {"id": 17, "name": "Ham & Cheese", "price": 335},
          {"id": 18, "name": "Spinach, Mushroom & Cheese", "price": 315},
          {"id": 19, "name": "Bell Pepper and Cheese", "price": 365},
          {"id": 20, "name": "Margarita Omelet", "price": 335}
        ]
      },
      {
        "CategoryName": "CRAZY BURGERS",
        "CategoryItems": [
          {"id": 21, "name": "Veg Burger", "price": 170},
          {"id": 22, "name": "Chicken Burger", "price": 200},
          {"id": 23, "name": "Chicken Tikka Burger", "price": 200},
          {"id": 24, "name": "Grilled Chicken Burger", "price": 210},
          {"id": 25, "name": "Spicy Chicken Burger", "price": 225},
          {"id": 26, "name": "Ham with Cheese Burger", "price": 210},
          {"id": 27, "name": "Maxi Ham Burger", "price": 215},
          {"id": 28, "name": "Beef Burger", "price": 280}
        ]
      },
      {
        "CategoryName": "Combo Meal",
        "CategoryItems": [
          {"id": 29, "name": "Veg Combo Meal", "price": 380},
          {"id": 30, "name": "Chicken Combo Meal", "price": 400},
          {"id": 31, "name": "Ham Combo Meal", "price": 405},
          {"id": 32, "name": "Spicy Chicken Combo Meal", "price": 425}
        ]
      },
      {
        "CategoryName": "Sandwich",
        "CategoryItems": [
          {"id": 33, "name": "Veg Sandwich", "price": 170},
          {"id": 34, "name": "Egg Sandwich", "price": 185},
          {"id": 35, "name": "Cheese Sandwich", "price": 185},
          {"id": 36, "name": "Chicken Sandwich", "price": 225},
          {"id": 37, "name": "Ham & Cheese Sandwich", "price": 240},
          {"id": 38, "name": "Grilled Tuna Sandwich", "price": 250},
          {"id": 39, "name": "Bacon Sandwich", "price": 250},
          {"id": 40, "name": "Beef Sandwich", "price": 260},
          {"id": 41, "name": "Hot Dog", "price": 180}
        ]
      },
      {
        "CategoryName": "Continental Favorites",
        "CategoryItems": [
          {"id": 42, "name": "Chicken/ Stroganoff", "price": 530},
          {"id": 43, "name": "Chicken in the Nest", "price": 520},
          {"id": 44, "name": "Grilled Chicken", "price": 570},
          {"id": 45, "name": "Grilled Herbed Fish", "price": 550},
          {"id": 46, "name": "Cajun Spices Grilled Fish", "price": 550},
          {"id": 47, "name": "Garlic Steak", "price": 600}
        ]
      },
      {
        "CategoryName": "PIZZA",
        "CategoryItems": [
          {"id": 48, "name": "Margarita", "price": 380},
          {"id": 50, "name": "Fungi", "price": 450},
          {"id": 51, "name": "Chicken", "price": 470},
          {"id": 52, "name": "BBQ", "price": 480},
          {"id": 53, "name": "Salami/Ham", "price": 480},
          {"id": 54, "name": "Ham and Mushroom", "price": 460},
          {"id": 55, "name": "Mixed Vegetable", "price": 470},
          {"id": 56, "name": "Crazy Special", "price": 510}
        ]
      },
      {
        "CategoryName": "Extra Topping",
        "CategoryItems": [
          {"id": 57, "name": "Garlic/ Tomato/ Onion", "price": 50},
          {"id": 58, "name": "Pineapple/ Capsicum/ Grilled Veg", "price": 60},
          {"id": 59, "name": "Mushroom/Mozzarella/ Black Olive", "price": 60},
          {
            "id": 60,
            "name": "Salami/ Bacon/ Ham/ Tuna Fish/ Smoked Chicken",
            "price": 110
          }
        ]
      },
      {
        "CategoryName": "PASTA",
        "CategoryItems": [
          {"id": 61, "name": "Napolitana", "price": 370},
          {"id": 62, "name": "Arrabiata", "price": 340},
          {"id": 63, "name": "Fungi", "price": 390},
          {"id": 64, "name": "Bolognara", "price": 425},
          {"id": 65, "name": "Carbonara", "price": 430},
          {"id": 66, "name": "Crazy Special", "price": 490}
        ]
      },
      {
        "CategoryName": "Vegetable Snacks",
        "CategoryItems": [
          {"id": 67, "name": "Tomato Brochette", "price": 280},
          {"id": 68, "name": "French Fries", "price": 170},
          {"id": 69, "name": "Mustang Aloo", "price": 230},
          {"id": 70, "name": "Aloo Jeera", "price": 210},
          {"id": 71, "name": "Chips Chilly", "price": 250},
          {"id": 72, "name": "Masala Papad", "price": 200},
          {"id": 73, "name": "Crispy Paneer", "price": 350},
          {"id": 74, "name": "Onion Rings", "price": 240}
        ]
      },
      {
        "CategoryName": "Non-Vegetarian Snacks",
        "CategoryItems": [
          {"id": 75, "name": "Chicken Chilly Boneless", "price": 350},
          {"id": 76, "name": "Chicken Sadheko", "price": 330},
          {"id": 77, "name": "Chicken Wings", "price": 330},
          {"id": 78, "name": "Chicken Drumstick", "price": 350},
          {"id": 79, "name": "Crispy Chicken", "price": 400},
          {"id": 80, "name": "Chicken Popcorn", "price": 350},
          {"id": 81, "name": "Dragon Chicken", "price": 360},
          {"id": 82, "name": "Fish Finger", "price": 370},
          {"id": 83, "name": "Fish Amrit Sarry", "price": 380}
        ]
      },
      {
        "CategoryName": "Fried Rice",
        "CategoryItems": [
          {"id": 84, "name": "Veg", "price": 190},
          {"id": 85, "name": "Egg", "price": 220},
          {"id": 86, "name": "Chicken", "price": 240},
          {"id": 87, "name": "Mix", "price": 300}
        ]
      },
      {
        "CategoryName": "Biryani",
        "CategoryItems": [
          {"id": 88, "name": "Veg", "price": 380},
          {"id": 89, "name": "Chicken", "price": 450}
        ]
      },
      {
        "CategoryName": "MO:MO",
        "CategoryItems": [
          {"id": 90, "name": "Veg", "price": 170},
          {"id": 91, "name": "Chicken", "price": 195},
          {"id": 92, "name": "Buff", "price": 165}
        ]
      },
      {
        "CategoryName": "SOUP MO:MO",
        "CategoryItems": [
          {"id": 93, "name": "Veg Soup Mo:Mo", "price": 225},
          {"id": 94, "name": "Chicken Soup Mo:Mo", "price": 250}
        ]
      },
      {
        "CategoryName": "C MO:MO",
        "CategoryItems": [
          {"id": 95, "name": "Veg C Mo:Mo", "price": 230},
          {"id": 96, "name": "Chicken C Mo:Mo", "price": 260}
        ]
      },
      {
        "CategoryName": "Thukpa",
        "CategoryItems": [
          {"id": 97, "name": "Veg Thukpa", "price": 190},
          {"id": 98, "name": "Chicken Thukpa", "price": 230},
          {"id": 99, "name": "Mixed Thukpa", "price": 280}
        ]
      },
      {
        "CategoryName": "Chowmein",
        "CategoryItems": [
          {"id": 100, "name": "Veg", "price": 190},
          {"id": 101, "name": "Chicken", "price": 240},
          {"id": 102, "name": "Mixed", "price": 300}
        ]
      },
      {
        "CategoryName": "Chopsy",
        "CategoryItems": [
          {"id": 103, "name": "American Chopsy", "price": 450},
          {"id": 104, "name": "Chinese Chopsy", "price": 400}
        ]
      },
      {
        "CategoryName": "Café Specialty (Hot)",
        "CategoryItems": [
          {"id": 105, "name": "Espresso", "price": 120},
          {"id": 106, "name": "Double Espresso", "price": 180},
          {"id": 107, "name": "Espresso Conpanna", "price": 130},
          {"id": 108, "name": "Espresso Macchiato", "price": 130},
          {"id": 109, "name": "Latte Macchiato", "price": 140},
          {"id": 110, "name": "Café Latte", "price": 150},
          {"id": 112, "name": "Caramel Latte", "price": 150},
          {"id": 113, "name": "Honey Latte", "price": 150},
          {"id": 114, "name": "Café Mocha", "price": 160},
          {"id": 115, "name": "Cappuccino", "price": 150},
          {"id": 116, "name": "Americano", "price": 130}
        ]
      },
      {
        "CategoryName": "Café (Cold)",
        "CategoryItems": [
          {"id": 117, "name": "Iced Americano", "price": 155},
          {"id": 118, "name": "Iced cappuccino", "price": 175},
          {"id": 119, "name": "Iced Latte", "price": 175},
          {"id": 120, "name": "Iced Mocha", "price": 180},
          {"id": 121, "name": "Blended Mocha", "price": 190},
          {
            "id": 122,
            "name": "Blended Orange/ pineapple/Lemonade",
            "price": 150
          }
        ]
      },
      {
        "CategoryName": "Shakes",
        "CategoryItems": [
          {"id": 123, "name": "Milk Shake", "price": 185},
          {"id": 124, "name": "Oreo Shake", "price": 180}
        ]
      },
      {
        "CategoryName": "Smoothie",
        "CategoryItems": [
          {"id": 125, "name": "Banana", "price": 165},
          {"id": 126, "name": "Papaya", "price": 165},
          {"id": 127, "name": "Mango", "price": 170},
          {"id": 128, "name": "Mixed", "price": 190}
        ]
      },
      {
        "CategoryName": "Lassie",
        "CategoryItems": [
          {"id": 129, "name": "Sweet", "price": 135},
          {"id": 130, "name": "Banana", "price": 150},
          {"id": 131, "name": "Papaya", "price": 160},
          {"id": 132, "name": "Mixed", "price": 190}
        ]
      },
      {
        "CategoryName": "Beverage",
        "CategoryItems": [
          {"id": 133, "name": "Plain Soda", "price": 60},
          {"id": 134, "name": "Mineral Water", "price": 50},
          {"id": 135, "name": "Fresh Lemon Soda", "price": 70},
          {"id": 136, "name": "Coke/Fanta/Sprite (250ml)", "price": 70},
          {"id": 137, "name": "Coke/Fanta/Sprite (500ml)", "price": 130},
          {"id": 138, "name": "Diet Coke", "price": 140},
          {"id": 139, "name": "Red Bull ", "price": 140},
          {"id": 140, "name": "Chilled Can Juice", "price": 150},
          {"id": 141, "name": "Iced Tea", "price": 160},
          {"id": 142, "name": "Hot Lemon with Honey", "price": 130},
          {"id": 143, "name": "Milk Tea", "price": 60},
          {"id": 144, "name": "Flavor Tea", "price": 40},
          {"id": 145, "name": "Hot Chocolate", "price": 150}
        ]
      },
      {
        "CategoryName": "Ice Cream Specialties",
        "CategoryItems": [
          {"id": 146, "name": "Ice Cream (Two Scoops)", "price": 120},
          {"id": 147, "name": "Regular Sundae", "price": 195},
          {"id": 148, "name": "Strawberry Sundae", "price": 265},
          {"id": 149, "name": "Cold Chocolate Sundae", "price": 265},
          {"id": 150, "name": "Banana Split Sundae", "price": 295},
          {"id": 151, "name": "Crazy Special Sundae", "price": 395}
        ]
      },
      {
        "CategoryName": "Beers (Can)",
        "CategoryItems": [
          {"id": 152, "name": "Tuborg", "price": 350},
          {"id": 153, "name": "Carlsberg", "price": 380},
          {"id": 154, "name": "Sherpa", "price": 400},
          {"id": 155, "name": "Nepal Ice", "price": 330}
        ]
      },
      {
        "CategoryName": "Beers Bottle",
        "CategoryItems": [
          {"id": 156, "name": "Tuborg", "price": 470},
          {"id": 157, "name": "Carlsberg", "price": 500},
          {"id": 158, "name": "Everest", "price": 450},
          {"id": 159, "name": "Gorkha", "price": 450},
          {"id": 160, "name": "Nepal Ice", "price": 450}
        ]
      },
      {
        "CategoryName": "House Wine",
        "CategoryItems": [
          {"id": 161, "name": "Red or White Wine Per Glass", "price": 400},
          {"id": 162, "name": "Red or White Wine Per Btl", "price": 1500}
        ]
      },
      {
        "CategoryName": "Domestic Spirits (60ml)",
        "CategoryItems": [
          {"id": 163, "name": "Old Durbar regular", "price": 445},
          {"id": 164, "name": "Old Durbar Black Chimney", "price": 485},
          {"id": 165, "name": "Whiskey/ Vodka/Gin/ Rum/Brandy", "price": 375}
        ]
      },
      {
        "CategoryName": "Imported Spirits (60 ml)",
        "CategoryItems": [
          {"id": 166, "name": "Grey Goose", "price": 895},
          {
            "id": 167,
            "name": "Gordon’s/ Smirnoff/ Vodka/Beefeater/Absolute",
            "price": 695
          },
          {
            "id": 168,
            "name": "Bacardi Rum/ Malibu Rum/ Captain Morgan (Jamaican Rum)",
            "price": 605
          },
          {"id": 169, "name": "Tequila Shot (Gold/ Silver)", "price": 465}
        ]
      },
      {
        "CategoryName": "Regular Scotch Whisky (60ml)",
        "CategoryItems": [
          {
            "id": 170,
            "name": "J&B/ Vat 69/ Ballantines/ Jim Beam",
            "price": 695
          }
        ]
      },
      {
        "CategoryName": "PREMIUM SCOTCH WHISKY (12 years old) (60ml)",
        "CategoryItems": [
          {"id": 171, "name": "Chivas Regal (18 years)", "price": 1465},
          {
            "id": 172,
            "name": "Jack Daniels/Singleton (12 years)",
            "price": 685
          },
          {"id": 173, "name": "Red Label", "price": 700}
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
