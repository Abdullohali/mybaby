import 'package:bottom_bar/bottom_bar.dart';
import 'package:children/ui/lenta.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Children extends StatefulWidget {
  const Children({Key? key}) : super(key: key);

  @override
  _ChildrenState createState() => _ChildrenState();
}

class _ChildrenState extends State<Children> {
  PageController controller = PageController(initialPage: 0);
  int _currentPage = 0;
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 210,
              width: 800,
              child: Pageview(context),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0, right: 270.0),
              child: Text(
                "All Categories",
                style: GoogleFonts.alegreyaSans(
                    fontSize: 20.0, color: Colors.black),
              ),
            ),
            Container(
              height: 600,
              child: gridview(),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: _currentPage,
        onTap: (int index) {
          // _pageController.jumpToPage(index);
          setState() {
            _currentPage = index;
          }

          ;
        },
        items: <BottomBarItem>[
          BottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Colors.blue,
          ),
          BottomBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorites'),
            activeColor: Colors.red,
            darkActiveColor: Colors.red.shade400, // Optional
          ),
          BottomBarItem(
            icon: Icon(Icons.person),
            title: Text('Account'),
            activeColor: Colors.greenAccent.shade700,
            darkActiveColor: Colors.greenAccent.shade400, // Optional
          ),
          BottomBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: Colors.orange,
          ),
        ],
      ),
    );
  }

  GridView gridview() {
    return GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  child: Container(
                    margin: EdgeInsets.all(20.0),
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 130.0,
                          width: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(80.0),
                                  top: Radius.circular(20.0)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://source.unsplash.com/1600x900/?baby/$index"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "New Born",
                          style: GoogleFonts.alegreyaSans(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Lenta()));
                  },
                );
              },
              itemCount: 10,
            );
  }

  PageView Pageview(BuildContext context) {
    return PageView(
                scrollDirection: Axis.horizontal,
                controller: controller,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20.0),
                            ),
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://images.unsplash.com/photo-1610901137736-d7cc46657b11?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1135&q=80",
                                ),
                                fit: BoxFit.cover)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: Icon(Icons.menu),
                            ),
                            IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: Icon(
                                Icons.notifications_outlined,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ),
                        top: 170.0,
                        left: 300.0,
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20.0),
                            ),
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://images.unsplash.com/photo-1583086762675-5a88bcc72548?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1172&q=80",
                                ),
                                fit: BoxFit.cover)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: Icon(Icons.menu),
                            ),
                            IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: Icon(
                                Icons.notifications_outlined,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ),
                        top: 170.0,
                        left: 300.0,
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20.0),
                            ),
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://images.unsplash.com/photo-1533483595632-c5f0e57a1936?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
                                ),
                                fit: BoxFit.cover)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: Icon(Icons.menu),
                            ),
                            IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: Icon(
                                Icons.notifications_outlined,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ),
                        top: 170.0,
                        left: 300.0,
                      )
                    ],
                  ),
                ]);
  }
}
