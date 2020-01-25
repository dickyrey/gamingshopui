import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gamingshop/product.dart';

class DetailProductPage extends StatelessWidget {
  final Product product;
  DetailProductPage({this.product});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Hero(
          tag: product.price,
          child: Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(product.urlimage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.only(left: 23),
              child: CircleAvatar(
                radius: 20,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  iconSize: 17,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 23.0),
                child: IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                  color: Colors.red,
                ),
              ),
            ],
          ),
          body: Container(
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width,
            child: DraggableScrollableSheet(
              minChildSize: 0.50,
              expand: true,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(33, 32, 30, 1.0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Container(
                            height: 5,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          product.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          product.brand,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              color: Colors.white60,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Rp. ${product.price}",
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 23,
                                  color: Colors.purpleAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "Rating",
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: Colors.purpleAccent,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.purpleAccent,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.purpleAccent,
                                    ),
                                    Icon(
                                      Icons.star_half,
                                      color: Colors.purpleAccent,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: Colors.purpleAccent,
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 30,
                              //! this image acctualy must be store logo. :D
                              backgroundImage: AssetImage(product.urlimage),
                            ),
                            SizedBox(width: 15),
                            Text(
                              product.store,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 30),
                        Text(
                          "Description",
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                        Divider(),
                        Text(
                          product.description,
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.purple,
            label: Container(
              width: 150,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Add to cart",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Icon(Icons.shopping_cart, color: Colors.white)
                ],
              ),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
