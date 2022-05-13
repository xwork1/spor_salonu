class Meal {
  final String mealTime;
  final String name;
  final String imagePath;
  final String kiloCaloriesBurnt;
  final String timeTaken;
  final List ingredients;
  final String preparation;

  Meal({
    required this.mealTime,
    required this.name,
    required this.imagePath,
    required this.kiloCaloriesBurnt,
    required this.timeTaken,
    required this.ingredients,
    required this.preparation,
  });
}

final meals = [
  Meal(
      mealTime: "KAHVALTI",
      name: "Kahvaltılık",
      kiloCaloriesBurnt: "271",
      timeTaken: "10",
      imagePath: "images/kahvalti.jpeg",
      ingredients: [
        "1 tam yumurta",
        "2 yumurta beyazı ile yapılmış mantarlı/lorlu omlet",
        "2-3 dilim tam buğday ekmeği",
        "50 gr az yağlı beyaz peynir",
        "5-6 adet zeytin",
      ],
      preparation: ''' yorum satırı '''),
  Meal(
      mealTime: "AKŞAM YEMEĞİ",
      name: "Izgara",
      kiloCaloriesBurnt: "612",
      timeTaken: "15",
      imagePath: "images/aksam.jpg",
      ingredients: [
        "150 gr ızgara yağsız dana eti veya köfte",
        "Izgara sebze veya 1 porsiyon zeytinyağlı sebze yemeği",
        "1 porsiyon kepekli makarna veya bulgur pilavı",
      ],
      preparation: ''' yorum satırı '''),
  Meal(
      mealTime: "ATIŞTIRMALIK",
      name: "Sebze ve Meyve",
      kiloCaloriesBurnt: "414",
      timeTaken: "16",
      imagePath: "images/ara_ogun.jpg",
      ingredients: [
        "1 porsiyon meyve",
        "15 adet çiğ badem veya fındık",
      ],
      preparation: ''' yorum satırı '''),
];
