import 'package:flutter/material.dart';
import 'package:gamingshop/categories.dart';
import 'package:gamingshop/product.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gaming Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Gaming Shop",
              style: GoogleFonts.arvo(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.purpleAccent[200],
                ),
              )),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.only(left: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 7),
                Container(
                  width: double.infinity,
                  height: 70,
                  child: ListView.builder(
                    itemCount: dummyCategories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      final categories = dummyCategories[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Chip(
                          backgroundColor: Colors.white,
                          shadowColor: Colors.purpleAccent,
                          labelPadding: EdgeInsets.fromLTRB(12, 6, 12, 6),
                          label: Text(
                            categories.name,
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w700,
                              textStyle: TextStyle(
                                color: Colors.purpleAccent,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 250,
                  child: PopularProduct(),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.only(right: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Best Deals",
                        style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.indigo,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Divider(
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                ListView.builder(
                  itemCount: dummyProduct.length,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    final product = dummyProduct[index];

                    return SizedBox(
                      height: 100,
                      child: Card(
                        elevation: 7,
                        margin: EdgeInsets.only(right: 10, bottom: 9),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  image: AssetImage(product.urlimage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              width: 230,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    child: Text(
                                      product.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.lato(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  //!just copy and paste
                                  SizedBox(
                                    child: Text(
                                      "Rp. ${product.price}",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.purpleAccent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 25,
                              height: 100,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.purpleAccent,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                ),
                              ),
                              child: Icon(Icons.arrow_forward_ios),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }
}

//make listview item horizontal
class PopularProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyProduct.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        final product = dummyProduct[index];
        return Container(
          width: 170,
          height: 250,
          margin: EdgeInsets.only(right: 15),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: <Widget>[
              Container(
                width: 195,
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(product.urlimage),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                          ),
                        ),
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 195,
                child: Text(
                  product.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
                ),
              ),
              SizedBox(
                width: 195,
                child: Text(
                  "Rp. ${product.price}",
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.purpleAccent,
                  )),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
