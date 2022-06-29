import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/get_data_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isInit = true;
  void didChangeDependencies() {
    if (isInit) {
      //  Provider.of<GetDataProvider>(context, listen: false).getDataProvider();
    }
    isInit = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final double screenHight = MediaQuery.of(context).size.height;
    final double screenWidht = MediaQuery.of(context).size.width;
    return SafeArea(
      //   child: DefaultTabController(
      // length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: SizedBox(
            height: screenHight * 0.5,
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/person.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(360),
              ),
              height: screenHight * 0.12,
              width: screenWidht * 0.12,
            ),
          ),

          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello Tsania",
                style: TextStyle(color: Color.fromARGB(52, 52, 52, 1)),
              ),
              Text(
                "Baton Rouge (LA)",
                style: TextStyle(color: Color.fromARGB(123, 179, 198, 1)),
              ),
            ],
          ),
          // centerTitle: true,
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Color.fromRGBO(41, 52, 91, 1),
              ),
            )
          ],
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: screenHight,
            width: screenWidht,
            color: Color.fromRGBO(255, 255, 255, 1),
            child: Container(
              margin: EdgeInsets.all(10),
              height: screenHight,
              width: screenWidht,
              color: Color.fromRGBO(255, 255, 255, 1),
              child: Column(
                children: [
                  SizedBox(
                    height: screenWidht * 0.13,
                    child: Row(
                      children: [
                        Expanded(
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: "Search Here.....",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(170, 173, 181, 1)),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Color.fromRGBO(170, 173, 181, 1),
                              ),
                              fillColor: Color.fromRGBO(243, 245, 249, 1),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidht * 0.02,
                        ),
                        Container(
                          height: screenWidht * 0.18,
                          width: screenWidht * 0.15,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(93, 66, 41, 1),
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHight * 0.038,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomContainer(
                        screenWidht: screenWidht,
                        image: 'assets/house.png',
                        text: 'House',
                        color: Color.fromRGBO(255, 255, 255, 1),
                        textColor: Color.fromRGBO(52, 52, 52, 1),
                      ),
                      CustomContainer(
                        screenWidht: screenWidht,
                        image: 'assets/apartment.png',
                        text: 'Apartment',
                        color: Color.fromRGBO(248, 249, 253, 1),
                        textColor: Color.fromRGBO(174, 177, 185, 1),
                      ),
                      CustomContainer(
                        screenWidht: screenWidht,
                        image: 'assets/hotel.png',
                        text: 'Hotel',
                        color: Color.fromRGBO(248, 249, 253, 1),
                        textColor: Color.fromRGBO(174, 177, 185, 1),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenWidht * 0.033,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Nearby Place",
                        style: TextStyle(color: Color.fromRGBO(52, 52, 52, 1)),
                      ),
                      Text(
                        "View All",
                        style:
                            TextStyle(color: Color.fromRGBO(123, 179, 198, 1)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenWidht * 0.033,
                  ),
                  Consumer<GetDataProvider>(
                      builder: (BuildContext context, value, Widget? child) =>
                          Center(
                            child: CarouselSlider.builder(
                                itemCount: value.imageurl.length,
                                itemBuilder: (context, index, realIndex) {
                                  final urlImage = value.imageurl[index];
                                  return Container(
                                    height: screenHight * 0.48,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    color: Colors.grey,
                                    child: Image.network(
                                      value.imageurl[index],
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                                options: CarouselOptions(height: 400)),
                          )),

                  //////////////////////////////////
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: Color.fromRGBO(41, 41, 41, 1),
          unselectedItemColor: Colors.grey,
          iconSize: 25,

          // selectedLabelStyle:
          //     TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorite"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), label: "Message"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
      // )
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    required this.screenWidht,
    required this.image,
    required this.text,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  final double screenWidht;
  final String image;
  final String text;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenWidht * 0.13,
      width: screenWidht * 0.26,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
