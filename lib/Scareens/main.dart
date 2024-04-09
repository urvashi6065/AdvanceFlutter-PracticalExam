import 'package:advanceflutterexampractical/ApiRepo/ApiClass.dart';
import 'package:advanceflutterexampractical/Provider/ProviderClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/Model_Class.dart';
import 'Detail_Screen.dart';
import 'Favorite_Screen.dart';
import 'Splash_Scareen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderClass()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(
          useMaterial3: true,
          // textTheme: TextTheme()
        ),
        home: SplashScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isloading = false;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      isloading = true;
    });

    final providerVar = Provider.of<ProviderClass>(context, listen: false);
    ApiClass().loadApiData(context).then((value) {
      providerVar.setApiData(value);
      setState(() {
        isloading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerVar = Provider.of<ProviderClass>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('Country'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FavoriteScreen()));
              },
              icon: Icon(CupertinoIcons.heart)),
        ],
      ),
      body: (isloading == true)
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: providerVar.countryList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                        // color: Colors.red,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(
                          20,
                        )),
                    child: Center(
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                    image: providerVar
                                        .countryList[index].flags.png,
                                    name: providerVar
                                        .countryList[index].name.common,
                                    lng: providerVar
                                        .countryList[index].population
                                        .toString(),
                                    official: providerVar
                                        .countryList[index].name.official,
                                    cico: providerVar.countryList[index].cioc,
                                    cca2: providerVar.countryList[index].cca2,
                                    ccn3: providerVar.countryList[index].ccn3,
                                    capital:
                                        providerVar.countryList[index].capital,
                                    region:
                                        providerVar.countryList[index].region,
                                    independent: providerVar
                                        .countryList[index].independent,
                                    unMember:
                                        providerVar.countryList[index].unMember,
                                    index: index,
                                  )));
                        },
                        leading: Hero(
                          tag: index,
                          child: Container(
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                    providerVar.countryList[index].flags.png,
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        // child: Image.network()),
                        title: Text(providerVar.countryList[index].name.common),
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
