import 'package:advanceflutterexampractical/Model/Model_Class.dart';
import 'package:advanceflutterexampractical/Provider/ProviderClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final providerVar=Provider.of<ProviderClass>(context,listen: true);
    return Scaffold(
      appBar: AppBar(title: Text('Favorite Page'),
      leading: IconButton(onPressed: () {
        Navigator.of(context).pop();
      }, icon: Icon(CupertinoIcons.back),),
      ),/**/
      body: (providerVar.favoriteList.isEmpty)?Center(child: Text('Data is Empty...')):ListView.builder(
          itemCount: providerVar.favoriteList.length,
          itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(providerVar.favoriteList[index].image!),radius: 50,),
            title: Text(providerVar.favoriteList[index].name!),
            trailing: IconButton(onPressed: () {
              providerVar.DelateFavoriteListData(index);
              // setState(() {
              //   providerVar.favoriteList.removeAt(index);
              // });
            }, icon: Icon(Icons.close),),
          ),
        );
      }),
    );
  }
}
