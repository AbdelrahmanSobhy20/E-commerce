import 'package:e_commerce/view/cart_screen.dart';
import 'package:e_commerce/view/product/products.dart';
import 'package:e_commerce/view/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import '../customs/bottom_appbar_buttons.dart';
import '../customs/category_button.dart';
import '../customs/most_popular.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _selectedIndexBottomAppBar = 0;

  bool _selectOn = false;

  bool isAfterNoon() {
    DateTime now = DateTime.now();
    print(now.hour);
    return now.hour >= 12;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ListTile(
                contentPadding: const EdgeInsets.all(8),
                leading: const CircleAvatar(
                  radius: 22,
                  // backgroundImage: NetworkImage("${Provider.of<UserProvider>(context, listen: false).imageURL}"),
                  backgroundImage: NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png"),
                ),
                title: Text(
                    isAfterNoon() ? "Good Evening 😊" : "Good Morning 😊",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        letterSpacing: .3)),
                subtitle: const Text("Menna Hisham",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        letterSpacing: .2)),
                trailing: Wrap(
                  spacing: 0,
                  children: [
                    // we can remove the notification button as it is not used
                    IconButton(
                        icon: Icon(Icons.notifications_outlined,
                            color: Colors.grey[700]),
                        onPressed: () {}),
                    IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: _selectOn ? Colors.red : Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            _selectOn = !_selectOn;
                          });
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .002,
              ),
              SearchAnchor(
                  builder: (BuildContext context, SearchController controller) {
                return SearchBar(
                  hintText: "Search",
                  elevation: const MaterialStatePropertyAll(1),
                  backgroundColor: MaterialStatePropertyAll(Colors.grey[100]),
                  shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  )),
                  controller: controller,
                  padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 16)),
                  onTap: () {
                    controller.openView();
                  },
                  onChanged: (_) {
                    controller.openView();
                  },
                  leading: const Icon(Icons.search),

                  //we can remove it
                  trailing: <Widget>[
                    Tooltip(
                      message: 'Filter',
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.tune,
                        ),
                      ),
                    )
                  ],
                );
              }, suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                return List<ListTile>.generate(5, (int index) {
                  final String item = 'item $index';
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      setState(() {
                        controller.closeView(item);
                      });
                    },
                  );
                });
              }),

              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Special Offers",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      letterSpacing: .01,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: MediaQuery.of(context).size.height * .25,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: '25% \n',
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              height: 1),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Today\'s Special! \n',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                    height: 1.9)),
                            TextSpan(
                              text: 'Get discount for every\n',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  height: 1.75),
                            ),
                            TextSpan(
                              text: 'order. only valid for today',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  height: .8),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 160,
                          // margin: EdgeInsets.only(right: 10,left: 90),
                          child: Image.asset(
                            "assets/13.png",
                            fit: BoxFit.cover,
                          ))
                    ],
                  )),

              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              //categories
              SizedBox(
                height: MediaQuery.of(context).size.height * .15,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  children: [
                    customButton(
                      icon: "assets/icons/shirt.png",
                      text: "Men",
                      funtion: () {},
                    ),
                    customButton(
                      icon: "assets/icons/dress.png",
                      text: "Women",
                      funtion: () {},
                    ),
                    customButton(
                      icon: "assets/icons/accessory.png",
                      text: "Accessories",
                      funtion: () {},
                    ),
                    customButton(
                      icon: "assets/icons/device.png",
                      text: "Electronics",
                      funtion: () {},
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Most Popular",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        letterSpacing: .01),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Products()));
                    },
                    child: const Text(
                      "See All",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),

              //Most popular products
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    customMostPopularButton(
                      function: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                      },
                      text: " All ",
                      selected: _selectedIndex == 0,
                    ),
                    customMostPopularButton(
                      function: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                      text: " Men ",
                      selected: _selectedIndex == 1,
                    ),
                    customMostPopularButton(
                      function: () {
                        setState(() {
                          _selectedIndex = 2;
                        });
                      },
                      text: "Women",
                      selected: _selectedIndex == 2,
                    ),
                    customMostPopularButton(
                      function: () {
                        setState(() {
                          _selectedIndex = 3;
                        });
                      },
                      text: "Accessories",
                      selected: _selectedIndex == 3,
                    ),
                    customMostPopularButton(
                      function: () {
                        setState(() {
                          _selectedIndex = 4;
                        });
                      },
                      text: "Electronics",
                      selected: _selectedIndex == 4,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),

              //Grid view of the Most popular products
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.5, // Adjust the height as needed
                child: GridView.builder(
                    itemCount: 4,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, i) {
                      return Container(
                        height: 40,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(left: 10, top: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20)),
                        child: Text("Container $i"),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
