import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/purchases.dart';
import '../sql/SQLP.dart';
import '../sql/sqlModels/sql_productsModel.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<SQLProduct> productsToBuy = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "My Cart",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
        ),
        body: FutureBuilder<List<SQLProduct>>(
            future: ProductsData.instance.getAllProducts(),
            builder: (BuildContext context,
                AsyncSnapshot<List<SQLProduct>> snapshot) {
              if (snapshot.hasData) {
                productsToBuy = snapshot.data!;
                return ListView.builder(
                  itemCount: productsToBuy.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: Card(
                        surfaceTintColor: const Color(0xFFFFFFFF),
                        elevation: 0,
                        child: Container(
                          //margin: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Container(
                                //margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 100,
                                width: 100,
                                child: Image.network(
                                    productsToBuy.elementAt(i).image),
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 195,
                                        child: Text(
                                          productsToBuy.elementAt(i).title,
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  content: const Text(
                                                    'Are you sure !',
                                                    style: TextStyle(
                                                        fontSize: 26,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          setState(() {});
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  const SnackBar(
                                                                      content: Text(
                                                                          'Item deleted Successfully')));
                                                          Navigator.pop(
                                                              context);
                                                          ProductsData.instance
                                                              .delete(
                                                                  productsToBuy
                                                                      .elementAt(
                                                                          i)
                                                                      .id);
                                                          productsToBuy
                                                              .removeAt(i);
                                                        },
                                                        child: const Text(
                                                          'YES',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.blue),
                                                        )),
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text('NO',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .red))),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.delete_outline_rounded,
                                            size: 30,
                                          )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                  // if(productsToBuy.elementAt(i).category == "men's clothing"){}
                                        width: 15,
                                        height: 15,
                                        decoration: BoxDecoration(
                                          color: productsToBuy.elementAt(i).category == "men's clothing"? Colors.black :
                                          productsToBuy.elementAt(i).category == "jewelery"? Colors.blue :
                                          productsToBuy.elementAt(i).category == "electronics"? Colors.yellow : Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(productsToBuy.elementAt(i).category),
                                      const SizedBox(
                                        width: 130,
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${productsToBuy
                                            .elementAt(i)
                                            .price*Provider.of<Purchasses>(context).num}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.attach_money,
                                        color: Colors.green[400],
                                        size: 22,
                                      ),
                                      const SizedBox(
                                        width: 40,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(16))),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () =>
                                                  Provider.of<Purchasses>(
                                                          context,
                                                          listen: false)
                                                      .increment(),
                                              icon: const Icon(
                                                Icons.add,
                                                size: 20,
                                              ),
                                              style: const ButtonStyle(
                                                  tapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap),
                                            ),
                                            Text(
                                              "${Provider.of<Purchasses>(context).num}",
                                              strutStyle: const StrutStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            IconButton(
                                                onPressed: () =>
                                                    Provider.of<Purchasses>(
                                                            context,
                                                            listen: false)
                                                        .decrement(),
                                                icon: const Icon(
                                                  Icons.remove,
                                                  size: 20,
                                                ),
                                                style: const ButtonStyle(
                                                    tapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              if (snapshot.hasError) {
                print(snapshot.error.toString());
              }
              if (productsToBuy == []) {
                Center(
                  child: SizedBox(
                    height: 600,
                    width: MediaQuery.sizeOf(context).width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/no items.png"),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "NO ITEMS",
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Center(
                child: SizedBox(
                  height: 600,
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/no items.png"),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "NO ITEMS",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
