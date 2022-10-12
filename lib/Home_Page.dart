import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> list = [
    {
      'image': 'assets/images/bakery.png',
      'name': 'Bakery',
      'color': Colors.black
    },
    {
      'image': 'assets/images/grape.png',
      'name': 'Fruits',
      'color': Colors.black
    },
    {
      'image': 'assets/images/vegetables.png',
      'name': 'Vegetables',
      'color': Colors.black
    },
    {'image': 'assets/images/milk.png', 'name': 'Milk', 'color': Colors.black},
    {
      'image': 'assets/images/medicine.png',
      'name': 'Medicines',
      'color': Colors.black
    },
  ];
  List<Map<String, dynamic>> list2 = [
    {
      'image': 'assets/images/lemon.png',
      'name': 'Lemon',
      'detail': 'Bergamo Italy',
      'price': '€1.10',
      'max': '€2'
    },
    {
      'image': 'assets/images/banan.png',
      'name': 'Banana',
      'detail': 'Cattier Italiano',
      'price': '€2.05',
      'max': '€3'
    },
    {
      'image': 'assets/images/grapes.png',
      'name': 'Grape',
      'detail': 'Cattier Italiano',
      'price': '€3.15',
      'max': '€4'
    },
    {
      'image': 'assets/images/orange.png',
      'name': 'Orange',
      'detail': 'Cattier Italiano',
      'price': '€2',
      'max': '€3.10'
    },
    {
      'image': 'assets/images/apple.png',
      'name': 'Apple',
      'detail': 'Bergamo Italy',
      'price': '€2.10',
      'max': '€3'
    },
    {
      'image': 'assets/images/strawberry.png',
      'name': 'Strawberry',
      'detail': 'Cattier Italiano',
      'price': '€3.10',
      'max': '€4'
    },
  ];
  List<Map<String, dynamic>> list3 = [
    {'text': '25% off'},
    {'text': ''},
    {'text': ''},
    {'text': '15% off'},
  ];
  int x = 0;
  int y = 0;
  int z = 0;
  int selected = 0;

  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            appheader(),
            SizedBox(
              height: 10,
            ),
            searchBar(),
            SizedBox(
              height: 20,
            ),
            listview(),
            GridviewList(),
            bottomnavigation(),
          ],
        ),
      ),
    );
  }

  Padding appheader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Icon(
            Icons.menu,
            size: 30,
          ),
          SizedBox(
            width: 95,
          ),
          Text(
            'EDEKA',
            style: TextStyle(
                color: Colors.indigoAccent,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 50,
          ),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                '➦',
                style: TextStyle(color: Colors.indigoAccent, fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(5),
            ),
            child: InkResponse(
              onTap: () {
                setState(
                  () {
                    isSelected = !isSelected;
                  },
                );
              },
              child: isSelected == true
                  ? Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : Icon(Icons.favorite_outline, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Padding searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: Colors.indigoAccent,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 16),
                fillColor: Colors.grey.shade300,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black54,
                ),
                hintText: 'Search product here',
                hintStyle: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              Icons.tune,
              color: Colors.grey.shade600,
              size: 27,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox listview() {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      x = index;
                    },
                  );
                },
                child: Container(
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    color: x == index ? Colors.green : Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Image.asset(
                      list[index]['image'],
                      height: 40,
                      width: 40,
                      color: x == index ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                list[index]['name'],
              ),
            ],
          );
        },
      ),
    );
  }

  Expanded GridviewList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          itemCount: 6,
          physics: const BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3.2,
              crossAxisSpacing: 10),
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 250,
                  width: 180,
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, right: 10),
                          child: GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  y = index;
                                },
                              );
                            },
                            child: Icon(
                              y == index
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: y == index ? Colors.red : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Image.asset(
                          list2[index]['image'],
                          height: 100,
                          width: 100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          list2[index]['name'],
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          list2[index]['detail'],
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Text(
                              list2[index]['price'],
                              style:
                                  TextStyle(color: Colors.green, fontSize: 17),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              list2[index]['max'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  decoration: TextDecoration.lineThrough,
                                  decorationThickness: 2),
                            ),
                            Spacer(),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Icon(Icons.add,
                                  color: Colors.white, size: 23),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                index == 0 || index == 3
                    ? Positioned(
                        left: 0,
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              list3[index]['text'],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox()
              ],
            );
          },
        ),
      ),
    );
  }

  Container bottomnavigation() {
    return Container(
      height: 50,
      width: 340,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Text(
            'Total :',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Text(
            '3x €49.5',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          Spacer(),
          Container(
            height: 50,
            width: 110,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Cart',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
