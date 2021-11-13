import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

class Lenta extends StatefulWidget {
  @override
  _LentaState createState() => _LentaState();
}

class _LentaState extends State<Lenta> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.blue[100],
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4.5,
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white60, elevation: 0),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                            ),
                            Text(
                              "Back",
                              style:
                                  GoogleFonts.alegreyaSans(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "New Born",
                        style: GoogleFonts.alegreyaSans(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      CircleAvatar(
                        radius: 21,
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1617331140180-e8262094733a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=688&q=80"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TabBar(
                      labelStyle: TextStyle(color: Colors.black),
                      indicatorColor: Colors.transparent,
                      tabs: [
                        Tab(
                          child: Text(
                            "Photos",
                            style: GoogleFonts.alegreyaSans(
                                fontSize: 30.0, color: Colors.black54),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Book Now",
                            style: GoogleFonts.alegreyaSans(
                                fontSize: 30.0, color: Colors.black54),
                          ),
                        )
                      ])
                ],
              ),
            ),
            Container(
              height: 600,
              child: gridView(),
            )
          ],
        ),
      ),
    );
  }

  GridView gridView() {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        return InkWell(
          child: Container(
            margin: EdgeInsets.all(5.0),
            height: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                  image: NetworkImage(
                    "https://source.unsplash.com/1200x800/?baby/$index",
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          onTap: () {
            bottomsheet(context, index);
          },
        );
      },
    );
  }

  Future<dynamic> bottomsheet(BuildContext context, int index) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        bool like = false;
        int likeNumber = 99;  
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: MediaQuery.of(context).size.height / 1.6,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(25.0),
                  topRight: const Radius.circular(25.0),
                ),
              ),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 5.0,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextField(
                    style: GoogleFonts.alegreyaSans(
                        color: Colors.black, fontSize: 23),
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Say something",
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.send_outlined),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        height: 50.0,
                        width: 220,
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://images.unsplash.com/photo-1617331140180-e8262094733a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=688&q=80"),
                            ),
                            Text(
                              "Mohammed Sarhan",
                              style: GoogleFonts.alegreyaSans(
                                  color: Colors.black, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_horiz_outlined),
                      ),
                    ],
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      width: MediaQuery.of(context).size.width - 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage(
                              "https://source.unsplash.com/1200x800/?baby/$index",
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    onDoubleTap: () => setState(() {
                      like = !like;
                      if (like == true) {
                        likeNumber += 1;
                      } else {
                        likeNumber = 99;
                      }
                    }),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 180.0),
                    width: MediaQuery.of(context).size.width / 2,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => setState(() {
                            like = !like;
                            if (like == true) {
                              likeNumber += 1;
                            } else {
                              likeNumber = 99;
                            }
                          }),
                          icon: const Icon(Icons.favorite),
                          color: like ? Colors.red : Colors.black38,
                        ),
                        Text(
                          "$likeNumber",
                          style: GoogleFonts.alegreyaSans(
                              color: Colors.black, fontSize: 10.0),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.maps_ugc),
                          color: Colors.black38,
                        ),
                        Text(
                          "20",
                          style: GoogleFonts.alegreyaSans(
                              color: Colors.black, fontSize: 10.0),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove_red_eye,
                          ),
                          color: Colors.black38,
                        ),
                        Text(
                          "1.9k",
                          style: GoogleFonts.alegreyaSans(
                              color: Colors.black, fontSize: 10.0),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Category",
                        style: GoogleFonts.alegreyaSans(
                            color: Colors.black, fontSize: 20.0),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              "Category",
                              style: GoogleFonts.alegreyaSans(
                                  color: Colors.black38, fontSize: 20.0),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            elevation: 0, primary: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Upload",
                        style: GoogleFonts.alegreyaSans(
                            color: Colors.black, fontSize: 20.0),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "13 hours ago",
                        style: GoogleFonts.alegreyaSans(
                            color: Colors.black38, fontSize: 20.0),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
