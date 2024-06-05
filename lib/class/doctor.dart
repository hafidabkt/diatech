
class Doctor {
  int? id;
  final String name;
  final String imageUrl;

  Doctor({this.id, required this.name, required this.imageUrl});

}

final List<Category> doctors = [
  Category(name: 'Karim Mohandi', imageUrl: 'images/doctor01.png'),
  Category(name: 'Jamila Taybi', imageUrl: 'images/doctor02.png'),
  Category(name: 'Souad Khedam', imageUrl: 'images/doctor03.png'),
  Category(name: 'Nedjmeddine Rihane', imageUrl: 'images/doctor04.png'),
];
