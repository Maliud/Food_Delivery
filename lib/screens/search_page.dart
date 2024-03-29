import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/model/item_model.dart';
import 'package:food_delivery/router/router.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> history = [
    "Margarita Pizza",
    "Cheese Burger",
    "Tavuk Dürüm",
    "Döner",
    "Çiğ Köfte",
    "Pide & Lahmacun",
    "Tatlı",
    "Kebap",
  ];
  TextEditingController _controller = TextEditingController();
  bool close = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, left: 10, right: 20),
                  child: TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(CupertinoIcons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: "Kebap",
                      contentPadding: const EdgeInsets.all(14),
                      suffixIcon: _controller
                              .text.isNotEmpty // Check if text is not empty
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  _controller.clear();
                                });
                              },
                              icon: const Icon(Icons.close),
                            )
                          : const SizedBox.shrink(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        close = value.isNotEmpty;
                      });
                    },
                  )),
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 15),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Son Aramalar",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Urbanist-Italic'),
                    )),
              ),
              SizedBox(
                height: 350,
                child: ListView.builder(
                  itemCount: history.length,
                  itemBuilder: (context, index) {
                    var data = history[index];
                    return ListTile(
                      title: Text(
                        data,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Urbanist-Italic'),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              history.removeAt(index);
                            });
                          },
                          icon: Icon(Icons.close)),
                      onTap: () {
                        setState(() {
                          _controller.text = data;
                        });
                      },
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 15),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "En Çok Sipariş Edilen Ürün",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Urbanist-Italic'),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  var data = ItemModel(
                      id: 5,
                      image: "assets/pizza_image.png",
                      name: "Margarita Pizza ",
                      desc:
                        "Sadece en taze malzemelerle hazırlanan eşsiz lezzetimizle tanışın! Margarita pizzamız, nefis mozzarella peyniri, taptaze domates ve taze fesleğenle harmanlanarak damaklarınıza unutulmaz bir lezzet şöleni sunuyor. İtalyan mutfağının en özel tatlarından biri olan margarita pizza, lezzetin zirvesine çıkar!",
                      price: 14,
                      time: "45 Dak",
                      calories: "410 Kal",
                      rating: "4.5",
                      placeholderImage: "assets/chilli.png");
                  GoRouter.of(context)
                      .pushNamed(Routers.productpage.name, extra: data);
                },
                child: Container(
                  height: 250,
                  width: 390,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade900,
                          blurRadius: 2.0,
                        )
                      ],
                      // border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(30)),
                  child: Image.asset(
                    "assets/pizza_img.jpg",
                    fit: BoxFit.cover,
                    width: 380,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
