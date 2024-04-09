import 'package:advanceflutterexampractical/Provider/ProviderClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/Model_Class.dart';

class DetailScreen extends StatefulWidget {
  final String? image;
  final String? name;
  final String? lng;
  final String? official;
  final String? cico;
  final String? cca2;
  final String ccn3;
  final List capital;
  final Region region;
  final bool independent;
  final bool unMember;
  final int index;

  // final int index;
  // final List<CountryApiModel> Lits;

  const DetailScreen({
    Key? key,
    required this.image,
    required this.name,
    required this.lng,
    required this.official,
    required this.cico,
    required this.cca2,
    required this.ccn3,
    required this.capital,
    required this.region,
    required this.independent,
    required this.unMember,
    required this.index,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isHeart = false;

  @override
  Widget build(BuildContext context) {
    final providerVar = Provider.of<ProviderClass>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name!),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(CupertinoIcons.back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //  mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: widget.index,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(widget.image!), fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  height: 250,
                  width: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name"),
                      SizedBox(
                        height: 5,
                      ),
                      Text("population"),
                      SizedBox(
                        height: 5,
                      ),
                      Text("official"),
                      SizedBox(
                        height: 5,
                      ),
                      Text("cca2"),
                      SizedBox(
                        height: 5,
                      ),
                      Text("ccn3"),
                      SizedBox(
                        height: 5,
                      ),
                      Text("status"),
                      SizedBox(
                        height: 5,
                      ),
                      Text("region"),
                      SizedBox(
                        height: 5,
                      ),
                      Text("independent"),
                      SizedBox(
                        height: 5,
                      ),
                      Text("unMember"),
                    ],
                  ),
                ),
                Container(
                  height: 250,
                  width: 15,
                  // color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(":-"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(":-"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(":-"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(":-"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(":-"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(":-"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(":-"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(":-"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(":-"),
                    ],
                  ),
                ),
                Container(
                  height: 250,
                  width: 130,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name!),
                      SizedBox(
                        height: 5,
                      ),
                      Text(widget.lng!),
                      SizedBox(
                        height: 5,
                      ),
                      Text(widget.official!),
                      SizedBox(
                        height: 5,
                      ),
                      Text(widget.cca2!),
                      SizedBox(
                        height: 5,
                      ),
                      Text(widget.ccn3.toString()),
                      SizedBox(
                        height: 5,
                      ),
                      Text(widget.capital.first),
                      SizedBox(
                        height: 5,
                      ),
                      Text(widget.region.toString()),
                      SizedBox(
                        height: 5,
                      ),
                      (widget.independent == true)
                          ? Text("independent")
                          : Text("dependent"),
                      SizedBox(height: 5,),
                      (widget.unMember == true)
                          ? Text("Member")
                          : Text("unMember"),
                      // Text(widget.)
                      // Text(widget.cca2!),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    (isHeart == true)
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                isHeart = false;
                              });
                            },
                            icon: Icon(
                              CupertinoIcons.heart_fill,
                              color: Colors.red,
                            ))
                        : IconButton(
                            onPressed: () async {
                              FavoriteModel favorite = FavoriteModel(
                                  name: widget.name, image: widget.image);
                              setState(() {
                                isHeart = true;
                              });
                              providerVar.setFavoriteListAddData(favorite);
                            },
                            icon: Icon(CupertinoIcons.heart)),
                    Text('Like'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Text('Like'),
                    IconButton(
                        onPressed: () async {
                          await Clipboard.setData(ClipboardData(
                              text:
                                  "${widget.name}\n${widget.lng}\n${widget.official}\n${widget.cca2}\n${widget.ccn3}\n${widget.capital.first}\n${widget.region}\n${widget.independent}\n${widget.unMember}"));
                        },
                        icon: Icon(Icons.copy)),
                    Text('Copy Text'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
