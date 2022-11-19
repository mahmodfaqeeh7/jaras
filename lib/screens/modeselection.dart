import 'package:flutter/material.dart';
import 'package:footballquiz/screens/Gamescreen.dart';
class modeselect extends StatefulWidget {
  const modeselect({Key? key}) : super(key: key);

  @override
  State<modeselect> createState() => _modeselectState();
}

class _modeselectState extends State<modeselect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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


              children: [


                SizedBox(height: MediaQuery.of(context).size.height*0.25,),
                Image.asset("assets/images/Logo.png",
                  height: MediaQuery.of(context).size.width * 0.35
                  ,width: MediaQuery.of(context).size.width * 0.35,),

                Text("اختر المود الذي تريده" , textAlign: TextAlign.center,
                  style: TextStyle(color : Colors.white ,fontSize: 28 , fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),


                Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.amber.shade900,
                  child: MaterialButton(
                      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      minWidth: MediaQuery
                          .of(context)
                          .size
                          .width * 0.5,
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder:
                                    (context) => Gamescreen()));



                      },
                      child: Text(
                        "واحد ضد واحد",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ),

                SizedBox(height: 10,),

                Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white24,
                  child: MaterialButton(
                      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      minWidth: MediaQuery
                          .of(context)
                          .size
                          .width * 0.5,
                      onPressed: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        // builder:
                        //   (context) => Buttonsscreen()));

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);


                      },
                      child: Text(
                        "لاعب واحد",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(height: 10,),

                Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white24,
                  child: MaterialButton(
                      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      minWidth: MediaQuery
                          .of(context)
                          .size
                          .width * 0.5,
                      onPressed: () {

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);


                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        // builder:
                        //   (context) => Buttonsscreen()));
                      },
                      child: Text(
                        "اونلاين",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ),


                SizedBox(height: 10,),



              ],


            ),

          ),
      )
        ]
      ),
    );
  }
  static const snackBar = SnackBar(
    content: Text('ما زلنا نعمل عليها ! \nأنتظرونا قريبا ' , textAlign: TextAlign.center, style: TextStyle(fontSize: 16),),
  );
}
