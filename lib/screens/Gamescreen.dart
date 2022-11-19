import 'package:flutter/material.dart';
import 'package:footballquiz/screens/footscreen.dart';
import 'histscreen.dart';
import 'genscreen.dart';
import 'package:footballquiz/sharedpref.dart';

class Gamescreen extends StatefulWidget {
  const Gamescreen({Key? key}) : super(key: key);

  @override
  State<Gamescreen> createState() => _GamescreenState();
}

var coinscount =0 ;

class _GamescreenState extends State<Gamescreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    coinscount =  CacheHelper.getData(key: "coin") ??0;
    while(CacheHelper.getData(key: "coin")==null){
      CircularProgressIndicator();
      CacheHelper.saveData(key: "coin", value: 0);

    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        extendBodyBehindAppBar: true,

        appBar: AppBar(
        title: const Center(child:Text("الـجـرس", style: TextStyle(fontWeight: FontWeight.bold),),),
    actions: <Widget>[
    Container(
    width: MediaQuery.of(context).size.width * 0.15,
    padding: EdgeInsets.all(2),
    margin: EdgeInsets.all(2),
    decoration:  BoxDecoration(borderRadius: BorderRadius.circular(25) ,
    color: Colors.white12,
    boxShadow: [
    BoxShadow(
    color: Colors.black45,
    blurRadius: 2,
    offset: Offset(1, 4), // Shadow position
    ),
    ],
    ),
    child:Center(child :
    Row(
    children: [
    Center(child : Icon(Icons.currency_bitcoin_rounded , color: Colors.white),),
    Center(child : Text( "$coinscount" ,
    style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),),],

    ),
    ),
    ),
    SizedBox(width: MediaQuery.of(context).size.width*0.1,)
    ], //<Widget>[]

    flexibleSpace: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                gradient: LinearGradient(
                colors: [Colors.red,Colors.pink],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter
                )
            ),
        ),
         backgroundColor: Colors.transparent
         ,leading: IconButton(
            icon: const Icon(Icons.menu),
    tooltip: 'Menu Icon',
    onPressed: () {
      print(CacheHelper.getData(key: "coin"));
    },
    ),
    ),

    body: Stack(

    children :
    [
    Container(
    width: double.infinity,
    height: double.maxFinite,
    alignment: Alignment.center,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage("assets/images/back.jpg"),
    fit : BoxFit.cover ,
    ),
    ),
    ),

    SingleChildScrollView(
    child :Center (
    child :
        Column(

          children: <Widget>[
                SizedBox(height: 100,),


            Text("اهلا بك في لعبة الجرس  \n اختر التحدي الذي تريده" ,
              textAlign: TextAlign.center
              , style: TextStyle(
                  fontSize: 24 ,color: Colors.white,fontWeight: FontWeight.bold),

            ),

          GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              shrinkWrap: true,
              children: [
                GestureDetector(
                    onTap: () {

                      Navigator.of(context).push(
                          MaterialPageRoute(builder:
                              (context) => genscreen())).then((value) => setState(() {Changedata();
                                }) );
                      debugPrint('general game');

                    },
                    child: Column(children: [
                      Image.asset("assets/images/filmvector.png",
                        height: MediaQuery.of(context).size.width * 0.35
                        ,width: MediaQuery.of(context).size.width * 0.35,),
                      Center(child :Text("تحدي معلومات عامه" , style:
                      TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold ,color: Colors.white ),
                        textAlign: TextAlign.center,),)
                    ],)
                ),
                GestureDetector(
                    onTap: () {

                      Navigator.of(context).push(
                          MaterialPageRoute(builder:
                              (context) => genscreen())).then((value) => setState(() {
                                Changedata();
                        }) );
                      debugPrint('geo game');

                    },
                    child: Column(children: [
                      Image.asset("assets/images/geovector.png",
                        height: MediaQuery.of(context).size.width * 0.35
                        ,width: MediaQuery.of(context).size.width * 0.35,),
                      Center(child :Text("تحدي الجغرافيا" , style:
                      TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold ,color: Colors.white ),
                        textAlign: TextAlign.center,),)
                    ],)
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder:
                              (context) => genscreen())).then((value) => setState(() {
                        Changedata();
                      }) );
                      debugPrint('film game');
                    },
                    child:  Column(children: [
                      Image.asset("assets/images/islamicvector.png",
                        height: MediaQuery.of(context).size.width * 0.35
                        ,width: MediaQuery.of(context).size.width * 0.35,),
                      Center(child :Text("تحدي الدين الأسلامي" , style:
                      TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold ,color: Colors.white ),
                        textAlign: TextAlign.center,),)
                    ],)
                ),
                GestureDetector(
                    onTap: () {
                      if(coinscount > 50){
                        coinscount = coinscount - 50;
                        CacheHelper.saveData(key: "coin", value: coinscount);
                        Navigator.of(context).push(
                            MaterialPageRoute(builder:
                                (context) => histscreen())).then((value) => setState(() {
                                 Changedata();
                                }) );
                        debugPrint('general game');
                      }
                      else {
                        ScaffoldMessenger.of(context).showSnackBar(snackBar2);

                      }

                    },
                    child: Column(children: [
                      Image.asset("assets/images/histvector.png",
                        height: MediaQuery.of(context).size.width * 0.35
                        ,width: MediaQuery.of(context).size.width * 0.35,),
                      Center(child :Text("تحدي التاريخ" , style:
                      TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold ,color: Colors.white ),
                        textAlign: TextAlign.center,),)
                    ],)
                ),
                GestureDetector(
                    onTap: () {
                      if(coinscount > 100){
                        coinscount = coinscount - 100;
                        CacheHelper.saveData(key: "coin", value: coinscount);
                        Navigator.of(context).push(
                            MaterialPageRoute(builder:
                                (context) => Buttonsscreen())).then((value) => setState(() {
                                  Changedata();
                                }));
                        debugPrint('general game');
                      }
                      else {
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      }

                    },
                    child: Column(children: [
                      Image.asset("assets/images/footvector.png",
                        height: MediaQuery.of(context).size.width * 0.35
                        ,width: MediaQuery.of(context).size.width * 0.35,),
                      Center(child :Text("تحدي كرة القدم" , style:
                      TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold ,color: Colors.white ),
                        textAlign: TextAlign.center,),)
                    ],)

                ),
                GestureDetector(
                    onTap: () {
                      if(coinscount > 100){
                        coinscount = coinscount - 100;
                        CacheHelper.saveData(key: "coin", value: coinscount);
                        Navigator.of(context).push(
                            MaterialPageRoute(builder:
                                (context) => Buttonsscreen())).then((value) => setState(() {
                                Changedata();
                                }) );
                        debugPrint('general game');
                      }
                      else {
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      }

                    },
                    child:  Column(children: [
                      Image.asset("assets/images/worldcup.png",
                        height: MediaQuery.of(context).size.width * 0.35
                        ,width: MediaQuery.of(context).size.width * 0.35,),
                      Center(child :Text("تحدي كأس العالم" , style:
                      TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold ,color: Colors.white ),
                        textAlign: TextAlign.center,),)
                    ],)
                ),




              ]
                ),
              ]
            ),
             ),
        ),
        ]
        )
        );
      }


  static const snackBar = SnackBar(
    content: Text('أنت تملك أقل من 100 عمله للاسف ! \nالعب اكثر للحصول على العملات ' , textAlign: TextAlign.center,),
  );
  static const snackBar2 = SnackBar(
    content: Text('أنت تملك أقل من 50 عمله للاسف ! \nالعب اكثر للحصول على العملات ' , textAlign: TextAlign.center,),
  );

  Changedata()
  {
    setState(() {
      coinscount = CacheHelper.getData(key: "coin") ?? 0;

    });
  }
}

