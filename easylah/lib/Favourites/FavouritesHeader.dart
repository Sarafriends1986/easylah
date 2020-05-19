import 'package:easylah/Database/MyData.dart';
import 'package:easylah/Products/ProductDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class FavouritesHeader extends StatefulWidget {
  final String loginUser;
  final String uid_name;
  final String prod_name;
  final String prod_desc;
  final String uid_location;
  final String prod_price;
  final String prod_picture;

  const FavouritesHeader(
      {Key key,
        this.loginUser,
        this.uid_name,
        this.prod_name,
        this.prod_desc,
        this.uid_location,
        this.prod_price,
        this.prod_picture})
      : super(key: key);
  @override
  _FavouritesHeaderState createState() => _FavouritesHeaderState();
}

class _FavouritesHeaderState extends State<FavouritesHeader> {

  String currentProfileImage =
      'https://supermariorun.com/assets/img/hero/hero_chara_mario_update_pc.png';
  String dbLoginuser = MyData().getLoginUser();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetails(
                    //loginUser: dbLoginuser,
                    uid_name: widget.uid_name,
                    prod_name: widget.prod_name,
                    prod_price: widget.prod_price,
                    prod_desc: widget.prod_desc,
                    uid_location: widget.uid_location,
                    prod_picture: widget.prod_picture),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 70,
              child: Material(
                  color: Colors.white,
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(4.0),
                  shadowColor: Color(0x802196F3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 68,
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(4.0),
                          child: Image(
                            fit: BoxFit.fill,
                            alignment: Alignment.center,
                            image: NetworkImage(currentProfileImage),
                          ),
                        ),
                      ),
                      Container(
                        height: 68,
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: myDetailsContainer1(),
                        ),
                      ),
                      Container(
                        height: 68,
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(4.0),
                          child: Image(
                            fit: BoxFit.fill,
                            alignment: Alignment.center,
                            image: AssetImage(widget.prod_picture),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }

  Widget myDetailsContainer1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.60,
            alignment: Alignment.topLeft,
            height: 20,
            child: Text(
              widget.prod_name,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.pink,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
              width: MediaQuery.of(context).size.width * 0.60,
              alignment: Alignment.topCenter,
              child: Row(

                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'S\$${widget.prod_price}',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      decoration: TextDecoration.none,
                    ),
                    softWrap: true,
                  ),
                  SizedBox(width: 4,),
                  Text(
                    widget.prod_desc,
                    overflow: TextOverflow.ellipsis,
                    //textAlign: TextAlign.left,
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 14,
                      decoration: TextDecoration.none,
                    ),
                    softWrap: true,
                  ),


                ],
              )
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.60,
            alignment: Alignment.topLeft,
            height: 20,
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.blue,
                  size: 18.0,
                ),
                Text(
                  widget.uid_name,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                  softWrap: true,
                ),
              ],
            ),

          ),
        ),
      ],
    );
  }
}
