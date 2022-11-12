import 'dart:async';
import 'package:quiz_view/quiz_view.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Buttonsscreen extends StatefulWidget {
  const Buttonsscreen({Key? key}) : super(key: key);

  @override
  State<Buttonsscreen> createState() => _ButtonsscreenState();
}

class _ButtonsscreenState extends State<Buttonsscreen> {

  List qustions = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/jas.json');
    final data = await json.decode(response);
    setState(() {
      qustions = data["qustions"];
      qustions.shuffle();

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }

  int qindex = 0;
  bool btn1 = true;

  bool btn2 = true;
  bool isvisW = true;

  bool isvisQ = false;

  int player1score = 0;

  int player2score = 0;

  @override
  Widget build(BuildContext context) {
    final player1button = Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery
              .of(context)
              .size
              .width * 0.5,
          onPressed: () {
            setState(() {
              if (btn1) {
                btn2 = false;

                isvisQ = !isvisQ;
              }
            });
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            // builder:
            //   (context) => Buttonsscreen()));
          },
          child: Text(
            "الـجـرس",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    final player2button = Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery
              .of(context)
              .size
              .width * 0.5,
          onPressed: () {
            setState(() {
              if (btn2) {
                btn1 = false;

                isvisQ = !isvisQ;
              }
            });


            // Navigator.of(context).push(
            //   MaterialPageRoute(
            // builder:
            //   (context) => Buttonsscreen()));
          },
          child: Text(
            "الـجـرس",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      body: Stack(

          children: <Widget>[
            Column(

              children: [

                RotatedBox(quarterTurns: 2,

                 child : Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 2,
                    //  width: MediaQuery.of(context).size.width / 2,
                    color: Colors.red[900],
                    child: Center(

                      child: Column(
                        children: [
                          SizedBox(height: (MediaQuery.of(context).size.height / 2)*0.15,),
                          Text("$player1score" , style: TextStyle(
                              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10,),
                          player1button,
                        SizedBox(height: (MediaQuery.of(context).size.height / 2)*0.1,),

                          Container(
                            margin: EdgeInsets.all(8),padding: EdgeInsets.all(8),

                            width: MediaQuery.of(context).size.width *0.85,
                            height: MediaQuery.of(context).size.height *0.15,
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 4,
                                  offset: Offset(4, 8), // Shadow position
                                ),
                              ],
                            ),
                            child: Center(child : Text("${qustions[qindex]["qstring"]}" , style:
                            TextStyle(fontSize: MediaQuery.of(context).size.width / 20  ,fontWeight: FontWeight.bold ,color: Colors.white ),textAlign: TextAlign.center,),
                            ),
                          )
                        ],
                      ),

                    ),


                  ),
                ),

                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 2,
                  //  width: MediaQuery.of(context).size.width / 2,
                  color: Colors.green[600],
                  child: Center(
                    child: Column(children: [
                      SizedBox(height: (MediaQuery.of(context).size.height / 2)*0.15,),
                      Text("$player2score" , style: TextStyle(
                          fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10,),
                      player2button,
                      SizedBox(height: (MediaQuery.of(context).size.height / 2)*0.1,),

                      Container(
                        margin: EdgeInsets.all(8),padding: EdgeInsets.all(8),

                        width: MediaQuery.of(context).size.width *0.85,
                        height: MediaQuery.of(context).size.height *0.15,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 4,
                              offset: Offset(4, 8), // Shadow position
                            ),
                          ],
                        ),
                        child: Center(child : Text("${qustions[qindex]["qstring"]}" , style:
                        TextStyle(fontSize: MediaQuery.of(context).size.width / 20  ,fontWeight: FontWeight.bold ,color: Colors.white ),textAlign: TextAlign.center,),
                        ),
                      )


                          ],
                    ),


                  ),
                ),

              ],


            ),
            vide(),
            btn1 ? QuistionContainer(
                Colors.redAccent.shade400, player1score, player2score) :
            QuistionContainer(
                Colors.green.shade900, player2score, player1score),


           if(player1score ==10 || player2score ==10)
            Victorylose()

          ]

      ),

    );
  }

  Widget vide() {
    return Center(child: Visibility(
        visible: isvisW,

        child: Center(child:
        Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade500,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 4,
                  offset: Offset(4, 8), // Shadow position
                ),
              ],
            ),
            child: Center(

              //  SizedBox(height: 50,),

              child: ElevatedButton(
                onPressed: () {
                  Timer timer = Timer(Duration(seconds: 3), () {
                    setState(() {
                      isvisW = false;
                    });
                  });
                },


                child:
                Text("\nجــاهــز ؟ \n اضغط وانتظر \n (أستعد)\n",textAlign: TextAlign.center,),
              ),

              // SizedBox(height: 50,),


            )),
        )
    ),

    );
  }

  Widget QuistionContainer(Color qcolor, int myscore, int enemyscore) {

    return  Visibility(
      visible: isvisQ,
      child: Center(
        child: Container(
          //color: Colors.black54,
          // padding: EdgeInsets.all(50),
          // margin: EdgeInsets.all(50),
          child: QuizView(

            showCorrect: true,
            tagBackgroundColor: Colors.deepOrange,
            tagColor: Colors.black,
            questionTag: "Question: ${qindex+1}",
            answerColor: Colors.white,
            answerBackgroundColor: Colors.blueAccent,
            questionColor: Colors.white,
            backgroundColor: qcolor,
            width: MediaQuery
                .of(context)
                .size
                .width * 0.90,
            height: MediaQuery
                .of(context)
                .size
                .height * 0.70,
           // question: "${qustions[qindex]["qstring"]}",
            rightAnswer: "${qustions[qindex]["rightanswer"]}",
            wrongAnswers: qustions[qindex]["wronganswers"],
            onRightAnswer: () {
              if (btn1) {
                player1score = player1score + 1;
              }
              if (btn2) {
                player2score = player2score + 1;
              }
              setState(() {
                isvisQ = false;
                btn1 = true;
                btn2 = true;

                print("my score is : $player1score ");
                print("enemysocre is : $player2score  ");
              });
              // }

              qindex++;
              if (qindex >= qustions.length) {
                qindex = 0;
              }

              //isvisQ = !isvisQ;
            },
            onWrongAnswer: () {
              if (btn1) {
                player2score = player2score + 1;
              }
              if (btn2) {
                player1score = player1score + 1;
              }
              setState(() {
                isvisQ = false;
                btn1 = true;
                btn2 = true;
                enemyscore = enemyscore + 1;
                print("my score is : $player1score ");
                print("enemysocre is : $player2score  ");
              });
              qindex++;
              if (qindex >= qustions.length) {
                qindex = 0;
              }
              // isvisQ = !isvisQ;
            },
          ),
        ),

      ),

    );


  }

  Widget Victorylose()
  {
    return
      Stack(
        children: [
        Container(
        width: double.infinity,
        height: double.maxFinite,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/vic.jpg"),
            fit : BoxFit.cover ,
          ),
        ),
      ),

         Center(child :Column(
           children: [
             SizedBox(height: MediaQuery.of(context).size.height *0.3,),
             Container(
                 margin: EdgeInsets.all(8),padding: EdgeInsets.all(8),
                 width: MediaQuery.of(context).size.width *0.85,
                 height: MediaQuery.of(context).size.height *0.15,
                 decoration: BoxDecoration(
                   color: player2score == 10 ? Colors.teal : Colors.pink[900],
                   borderRadius: BorderRadius.circular(20),
                   boxShadow: [
                     BoxShadow(
                       color: Colors.black45,
                       blurRadius: 4,
                       offset: Offset(4, 8), // Shadow position
                     ),
                   ],
                 ),
                 child: player1score == 10 ?
                 Center(child : Text("الاحمر أنتصر , مبرووك" , style:
                 TextStyle(
                     fontSize: 20 ,fontWeight: FontWeight.bold ,color: Colors.white ),
                   textAlign: TextAlign.center,) ):
                 Center(child :Text("الاخضر أنتصر , مبرووك" , style:
                 TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold ,color: Colors.white ),
                   textAlign: TextAlign.center,),)

             ),
             SizedBox(height: MediaQuery.of(context).size.height *0.03,),
             ElevatedButton(
                 onPressed:
                 Navigator.of(context).pop, child:  Text(
                 "اعادة اللعبة",
                 textAlign: TextAlign.center,
                 style: TextStyle(
                     fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)


             ))

           ],

         ),
         )
        ],

      );

  }

}

/*
 Widget QuistionContainer()
  {
    return  Visibility(
        visible: isvisQ,

        child: Container(
          color: Colors.black54,
          padding: EdgeInsets.all(50),
          margin: EdgeInsets.all(50),
          child: Column(
            children: <Widget>[
              Text("when did uncle messi fazer make messi alive ? " , style:
              TextStyle(fontWeight: FontWeight.bold , fontSize: 15 ,color: Colors.white),),

              SizedBox(height: 10),
              ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ElevatedButton(
                       onPressed:(){
                         setState(() {
                           isvisQ =!isvisQ;
                         });

                       } , child: Text("198$index "),
                        );


                  }),

            ],

          ),

        ),

    );
  }
 */