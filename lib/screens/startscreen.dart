
import 'package:flutter/material.dart';
import 'package:footballquiz/screens/footscreen.dart';
import 'histscreen.dart';
import 'genscreen.dart';
class Startscreen extends StatefulWidget {
  const Startscreen({Key? key}) : super(key: key);

  @override
  State<Startscreen> createState() => _StartscreenState();
}


final TextEditingController name1controller = new TextEditingController();
final TextEditingController name2controller = new TextEditingController();



class _StartscreenState extends State<Startscreen> {
  @override
  Widget build(BuildContext context) {

    final StartButton = Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(30),
      color: Colors.deepPurpleAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width * 0.5,
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                builder:
                    (context) => Buttonsscreen()));
          },
          child: Text(
            "Start the game",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );


    final player1name = TextFormField(
      autofocus: false,
      controller: name1controller,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Name");
        }
      },
      onSaved: (value) {
        name1controller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(

        prefixIcon: Icon(Icons.person),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Player1 name",
        border: OutlineInputBorder(

          borderRadius: BorderRadius.circular(25),
        ),

      ),


    );

    final player2name = TextFormField(
        autofocus: false,
        controller: name2controller,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Name");
          }
        },
        onSaved: (value) {
          name2controller.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person, ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Player2 name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),

        )

    );


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
              child : Column(


                children: <Widget>[

                  SizedBox(height: 50,),


                  Text("اهلا بك في لعبة الجرس  \n اختر التحدي الذي تريده" ,
                   textAlign: TextAlign.center
                    , style: TextStyle(
                        fontSize: 24 ,color: Colors.white,fontWeight: FontWeight.bold),

                  ),


                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder:
                              (context) => histscreen()));
                      debugPrint('history game');
                    },
                    child: Column(children: [
                      Image.asset("assets/images/histvector.png",
                        height: MediaQuery.of(context).size.width * 0.4
                        ,width: MediaQuery.of(context).size.width * 0.4,),
                      Center(child :Text("تحدي التاريخ" , style:
                      TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold ,color: Colors.white ),
                        textAlign: TextAlign.center,),)
                    ],)
                  ),

                  SizedBox(height: 40,),

                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder:
                              (context) => Buttonsscreen()));
                      debugPrint('Hi there');
                    },
                    child: Column(children: [
                      Image.asset("assets/images/footvector.png",
                        height: MediaQuery.of(context).size.width * 0.5
                        ,width: MediaQuery.of(context).size.width * 0.5,),
                      Center(child :Text("تحدي كرة القدم" , style:
                      TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold ,color: Colors.white ),
                        textAlign: TextAlign.center,),)
                    ],)
                  ),

                  SizedBox(height: 40,),

                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder:
                              (context) => genscreen()));
                      debugPrint('film game');
                    },
                    child:  Column(children: [
                      Image.asset("assets/images/filmvector.png",
                        height: MediaQuery.of(context).size.width * 0.5
                        ,width: MediaQuery.of(context).size.width * 0.5,),
                      Center(child :Text("تحدي الأفلام" , style:
                      TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold ,color: Colors.white ),
                        textAlign: TextAlign.center,),)
                    ],)
                  ),




                ],
              ),

            ),

          ),
        ]

      )

    );
  }


}
