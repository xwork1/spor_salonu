class UpperBodyWorkout {
  final String imagePath, name, instruction;

  UpperBodyWorkout({required this.imagePath, required this.name, required this.instruction});
}

final upperBody = [
  [
    UpperBodyWorkout(
      imagePath: "images/chest.png",
      name: "Göğüs Press",
      instruction: "3 set - 6 tekrar",
    ),
    UpperBodyWorkout(
      imagePath: "images/chest.png",
      name: "Düz Sehbada",
      instruction: "4 set - 6 tekrar",
    ),
    UpperBodyWorkout(
      imagePath: "images/chest.png",
      name: "Göğüs Sıkıştırma (Dips)",
      instruction: "2 set - 10 tekrar",
    ),
  ],
  [
    UpperBodyWorkout(
      imagePath: "images/back.png",
      name: "Pull ups",
      instruction: "2 set - 8 tekrar",
    ),
    UpperBodyWorkout(
      imagePath: "images/back.png",
      name: "Deadlift",
      instruction: "2 set - 4 tekrar",
    ),
    UpperBodyWorkout(
      imagePath: "images/back.png",
      name: "Lat pulldown",
      instruction: "4 set - 6 tekrar",
    ),
  ],
  [
    UpperBodyWorkout(
      imagePath: "images/bicepss.png",
      name: "Barbel Curl (Ayak ön kol)",
      instruction: "3 set - 6 tekrar",
    ),
    UpperBodyWorkout(
      imagePath: "images/bicepss.png",
      name: "Hummer Curi",
      instruction: "4 set - 6 tekrar",
    ),
    UpperBodyWorkout(
      imagePath: "images/bicepss.png",
      name: "Alternative Curl (Ayakta Tek Tek)",
      instruction: "2 set - 10 tekrar",
    ),
  ],
  [
    UpperBodyWorkout(
      imagePath: "images/back.png",
      name: "Pull ups",
      instruction: "2 set - 8 tekrar",
    ),
    UpperBodyWorkout(
      imagePath: "images/back.png",
      name: "Deadlift",
      instruction: "2 set - 4 tekrar",
    ),
    UpperBodyWorkout(
      imagePath: "images/back.png",
      name: "Lat pulldown",
      instruction: "4 set - 6 tekrar",
    ),
  ],
];