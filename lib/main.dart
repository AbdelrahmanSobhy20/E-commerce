import 'package:e_commerce/provider/purchases.dart';
import 'package:e_commerce/sql/SQLP.dart';
import 'package:e_commerce/view/splash/splash1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/check_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  await ProductsData.instance.open();
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Purchasses(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
           // routes: {
           //   '/': (context) =>  const Splash1() ,
           //   'navigation': (context) => const NavigationScreen(),
           // },
        home: Splash1(),
      ),
    );
  }
}

class Hello extends StatelessWidget {
  const Hello({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserProvider>(
        builder: (context, resultProvider, _) {
          return Center(child: Text("Hello, ${resultProvider.result}"));
        },
      ),
    );
  }
}


/*
FutureBuilder<List<ProductsResponse?>>(
future: PorductsAPI().getAllProducts(),
builder: (context, snapshot) {
if (snapshot.hasData) {
print(snapshot.data!);
print(snapshot.data![1]!.title);
return ListView.builder(
scrollDirection: Axis.vertical,
shrinkWrap: true,
itemCount: snapshot.data?.length,
itemBuilder: (BuildContext context, int i) {
return Container(
height: 200,
child: Image.network(snapshot.data![i]!.image));
},
);
}
if (snapshot.hasError) {
print(snapshot.error.toString());
return Container();
}
return const Center(
child: SizedBox(
height: 100,
width: 100,
child: CircularProgressIndicator(),
),
);
},
),

 */