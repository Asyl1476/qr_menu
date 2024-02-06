import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR_menu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedCategory = 'Завтраки';

  List<String> categories = [
    'Завтраки',
    'Салаты',
    'Основное',
  ];

  List<Map<String, dynamic>> breakfasts = [
    {'name': 'Семга с овощами', 'price': 'c1200'},
    {'name': 'Рис с огурцом', 'price': 'c590'},
    {'name': 'Жаренная курица', 'price': 'c570'},
    {'name': 'Крылышки с рисом', 'price': 'c430'},
  ];

  List<Map<String, dynamic>> salads = [
    {'name': 'Какое то блюдо', 'price': 's570'},
    {'name': 'Какое то блюдо', 'price': 's570'},
    {'name': 'Какое то блюдо', 'price': 's570'},
    {'name': 'Какое то блюдо', 'price': 's570'},
  ];

  List<Map<String, dynamic>> mains = [
    {'name': 'Какое то блюдо', 'price': 'c800'},
    {'name': 'Какое то блюдо', 'price': 'c900'},
    {'name': 'Какое то блюдо', 'price': 's570'},
    {'name': 'Какое то блюдо', 'price': 's570'},
  ];

  List<Map<String, dynamic>> getSelectedCategoryItems() {
    switch (selectedCategory) {
      case 'Завтраки':
        return breakfasts;
      case 'Салаты':
        return salads;
      case 'Основное':
        return mains;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        centerTitle: true, // Центрировать заголовок
        flexibleSpace: Center(
          child: Image.network(
            'https://zernoresto.kg/wp-content/uploads/2022/11/zerno-474747.png',
            width: 180.0,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = categories[index];
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      categories[index],
                      style: const TextStyle(fontSize: 23),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.grey[200], // Серый цвет для поисковика
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Поиск',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: getSelectedCategoryItems().map((item) {
                Color squareColor;
                
                switch (selectedCategory) {
                  case 'Завтраки':
                    squareColor = Colors.blue;
                    break;
                  case 'Салаты':
                    squareColor = Colors.red;
                    break;
                  case 'Основное':
                    squareColor = Colors.green;
                    break;
                  default:
                    squareColor = Colors.grey; // Цвет для неопределенных категорий
                }

                return Container(
                  height: 400,
                  width: 200,
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        width: 140,
                        height: 135,
                        color: squareColor,
                      ),
                      Text(
                        item['name'],
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        item['price'],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
