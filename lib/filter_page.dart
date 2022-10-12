import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<Map<String, dynamic>> filterItems = [
    {"icon": Icons.delivery_dining_rounded, 'title': "Fast Delivery"},
    {"icon": Icons.location_on_outlined, 'title': "Stores in my area"},
    {"icon": Icons.book_outlined, 'title': "Previous Orders"},
    {"icon": Icons.star_border, 'title': "Popular Orders"},
  ];
  List list = ['Delivery', 'Pick up'];
  double slidervalue = 10;
  double x = 10;
  int selected = 0;
  int a = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottumNav(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            pageHeader(),
            SizedBox(
              height: 20,
            ),
            listTile(),
            SizedBox(
              height: 30,
            ),
            sliderOne(),
            SizedBox(
              height: 30,
            ),
            sliderTwo(),
            SizedBox(
              height: 30,
            ),
            // bottumNav(),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'ORDER TYPE',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Column listTile() {
    return Column(
      children: List.generate(
        filterItems.length,
        (index) => Column(
          children: [
            ListTile(
              onTap: () {
                setState(
                  () {
                    selected = index;
                  },
                );
              },
              leading: CircleAvatar(
                radius: 23,
                backgroundColor: Colors.green.shade100,
                child: Icon(
                  filterItems[index]['icon'],
                  color: Colors.green,
                ),
              ),
              title: Text(filterItems[index]['title']),
              trailing: Container(
                height: 23,
                width: 23,
                decoration: BoxDecoration(
                  border: Border.all(
                      color:
                          selected == index ? Colors.transparent : Colors.grey,
                      width: 1.5),
                  color: selected == index ? Colors.green : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  size: 10,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                thickness: 1,
                color: Colors.grey.shade300,
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding pageHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios_new_outlined,
          ),
          SizedBox(
            width: 120,
          ),
          Text(
            'Filter',
            style: TextStyle(
                fontSize: 22, color: Colors.grey, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget sliderOne() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'MIN ORDER AMOUNT',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SliderTheme(
          data: SliderThemeData(
            inactiveTrackColor: Colors.grey,
            activeTrackColor: Colors.green,
            thumbColor: Colors.white,
            trackHeight: 3,
            valueIndicatorColor: Colors.green,
            valueIndicatorTextStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          child: Slider.adaptive(
            value: slidervalue,
            min: 0,
            max: 100,
            divisions: 100,
            label: '€${slidervalue.toStringAsFixed(0)}',
            onChanged: (double value) {
              setState(
                () {
                  slidervalue = value;
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget sliderTwo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'MIN ORDER AMOUNT',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SliderTheme(
          data: SliderThemeData(
            inactiveTrackColor: Colors.grey,
            activeTrackColor: Colors.green,
            thumbColor: Colors.white,
            trackHeight: 3,
          ),
          child: Slider.adaptive(
            value: x,
            min: 0,
            max: 10,
            label: x.toStringAsFixed(0),
            divisions: 5,
            onChanged: (double value) {
              setState(
                () {
                  x = value;
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 25,
              ),
              Text(
                '0.5-2km',
                style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                '3-5km',
                style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                '6-8km',
                style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                '9-10km',
                style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget bottumNav() {
    return Container(
      height: 50,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            2,
            (index) => GestureDetector(
              onTap: () {
                setState(
                  () {
                    a = index;
                  },
                );
              },
              child: Container(
                height: 45,
                width: 150,
                decoration: BoxDecoration(
                  color: a == index ? Colors.green : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      list[index],
                      style: TextStyle(
                          color: a == index ? Colors.white : Colors.black),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color:
                                a == index ? Colors.transparent : Colors.grey,
                            width: 1.5),
                        shape: BoxShape.circle,
                        color: a == index ? Colors.white : Colors.transparent,
                      ),
                      child: Icon(
                        Icons.check,
                        color: a == index ? Colors.green : Colors.transparent,
                        size: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
