import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/provider/data_provider.dart';
import 'package:food_delivery/router/router.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';


order_placed(BuildContext context, int items, int price) {
  final dataprovider = Provider.of<DataProvider>(context, listen: false);
  showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return OrderSheet(
          item: items, price: price, list: dataprovider.likedproduct);
    },
  );
}

class OrderSheet extends StatefulWidget {
  final int item;
  final int price;
  final List list;
  const OrderSheet(
      {super.key, required this.item, required this.price, required this.list});

  @override
  State<OrderSheet> createState() => _OrderSheetState();
}

class _OrderSheetState extends State<OrderSheet> {
  bool ani = false;
  showmess() {
    Timer(Duration(seconds: 2), () {
      return showorderdialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final dataprovider = Provider.of<DataProvider>(context, listen: false);
    return Stack(
      children: [
        Positioned(
          top: 100,
          child: Center(
            child: LottieBuilder.asset(
              "assets/loti_animation.json",
              animate: ani,
              fit: BoxFit.fill,
              repeat: false,
              height: MediaQuery.of(context).size.height * 0.5,
              width: 500,
              options: LottieOptions(enableApplyingOpacityToLayers: true),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: CupertinoActionSheet(
            title: Text(
              "Sipariş Özeti",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Urbanist-Italic'),
            ),
            message: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sepetteki ürün ${widget.item} ",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Urbanist-Italic'),
                ),
                Text(
                  "${widget.price}\₺",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Urbanist-Italic'),
                )
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Material(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: ListView.builder(
                      itemCount: widget.list.length,
                      itemBuilder: (context, index) {
                        var data = widget.list[index];
                        return GestureDetector(
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                                Routers.productpage.name,
                                extra: data);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: ListTile(
                              horizontalTitleGap: 10,
                              style: ListTileStyle.list,
                              leading: SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.asset(
                                  data.image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              title: Text(
                                data.name,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Urbanist-Italic'),
                              ),
                              subtitle: Text(
                                data.desc,
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                              ),
                              trailing: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                   " Adet" + data.placeholderImage,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Urbanist-Italic'),
                                  ),
                                  Text(
                                    data.price.toString() + "\₺",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Urbanist-Italic'),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: const Text(
                "Sipariş Onayı",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Urbanist-Italic'),
              ),
              onPressed: () {
                print("object");
                dataprovider.likedproduct.clear();
                setState(() {
                  ani = true;
                  showmess();
                });
              },
            ),
          ),
        ),
        Positioned(
          top: 400,
          child: Center(
            child: LottieBuilder.asset(
              "assets/loti_animation.json",
              animate: ani,
              fit: BoxFit.fill,
              repeat: false,
              height: MediaQuery.of(context).size.height * 0.6 - 200,
              width: 500,
              options: LottieOptions(enableApplyingOpacityToLayers: true),
            ),
          ),
        ),
      ],
    );
  }
}

showorderdialog(BuildContext context) {
  return QuickAlert.show(
    context: context,
    type: QuickAlertType.confirm,
    text: 'Siparişiniz Başarıyla Verildi! ',
    confirmBtnText: 'Takip Sırası',
    cancelBtnText: "Daha Fazla Alışveriş Yapın",
    confirmBtnColor: Colors.green,
    title: "Başarılı",
    onConfirmBtnTap: () {
      GoRouter.of(context).pushNamed(Routers.mappage.name,
          pathParameters: {'flag': 'true', 'pad': '20'});
    },
    onCancelBtnTap: () {
      GoRouter.of(context).pushNamed(Routers.navigation.name);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Siparişin için teşekkürler 😄",
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: 'Urbanist-Italic'),
          )));
    },
    barrierColor: Colors.grey.shade400.withOpacity(0.7),
  );
}
