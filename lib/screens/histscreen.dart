import 'dart:async';
import 'package:footballquiz/sharedpref.dart';
import 'package:quiz_view/quiz_view.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class histscreen extends StatefulWidget {
  const histscreen({Key? key}) : super(key: key);

  @override
  State<histscreen> createState() => _histscreenState();
}

class _histscreenState extends State<histscreen> {

  var  coins = CacheHelper.getData(key: "coins") ;

  List qustions = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/jas.json');
    final data = await json.decode(response);
    setState(() {
      qustions = data["hist"];
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
  bool holdanswer = false ;
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
                holdanswer = true ;
                Timer timer = Timer(Duration(seconds: 2), () {
                  setState(() {
                    holdanswer = false;
                  });
                });
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
                holdanswer = true ;
                Timer timer = Timer(Duration(seconds: 2), () {
                  setState(() {
                    holdanswer = false;
                  });
                });
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
      body: qustions.isEmpty ? Center(child : CircularProgressIndicator() ):Stack(

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
                            TextStyle(fontSize: 20  ,fontWeight: FontWeight.bold ,color: Colors.white ),textAlign: TextAlign.center,),
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
                        TextStyle(fontSize: 20  ,fontWeight: FontWeight.bold ,color: Colors.white ),textAlign: TextAlign.center,),
                        ),
                      )


                          ],
                    ),


                  ),
                ),

              ],


            ),
            vide(),
            btn1 ? RotatedBox(quarterTurns: 2,
                child :QuistionContainer(
                    Colors.redAccent.shade400, player1score, player2score)) :
            QuistionContainer(
                Colors.green.shade900, player2score, player1score),
            Visibility(
                visible: holdanswer,
                child:Center(child:Container(
                  height: MediaQuery.of(context).size.height * 0.95,
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                      gradient: LinearGradient(
                          colors: [Colors.red.shade900,Colors.green.shade900],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter
                      )
                  ),
                ) ,)
            ) ,

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
              gradient: LinearGradient(
                  colors: [Colors.red.shade900,Colors.green.shade900],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter

              ),              borderRadius: BorderRadius.circular(20),
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
              Timer timer = Timer(Duration(seconds: 1), () {
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
              });


              //isvisQ = !isvisQ;
            },
            onWrongAnswer: () {
              Timer timer = Timer(Duration(seconds: 1), () {

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



              });
            },
          ),
        ),

      ),

    );


  }

  Widget Victorylose() {


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
                fit: BoxFit.cover,
              ),
            ),
          ),

          Center(child: Column(
            children: [
              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.3,),
              Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.85,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.4,
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
                  child: Column(
                    children: [
                      SizedBox(height: 30,),

                      player1score == 10 ?
                      Center(child: Text(" COINS+10 \nالاحمر أنتصر , مبرووك", style:
                      TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                        textAlign: TextAlign.center,)) :
                      Center(child: Text(" الاخضر أنتصر , مبرووك COINS+10 \n", style:
                      TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                        textAlign: TextAlign.center,),

                      ),
                      SizedBox(height: 30,),

                      Center(child : Material(
                        elevation: 3,
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue.shade900,

                        child: MaterialButton(
                            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            minWidth: MediaQuery
                                .of(context)
                                .size
                                .width * 0.25,
                            onPressed: () {

                              setState(()  {
                                coins = coins + 10 ;
                                CacheHelper.saveData(key: "coin", value: coins);
                                Navigator.pop(context);

                              });
                            },

                            child: Text(
                              "اعادة اللعبه",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                            )

                        ),
                      ),

                      ),
                      SizedBox(height: 30,),

                      Center(child : Material(
                        elevation: 3,
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.green.shade800,

                        child: MaterialButton(
                            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            minWidth: MediaQuery
                                .of(context)
                                .size
                                .width * 0.25,
                            onPressed: () {

                              setState(()  {
                                coins = coins + 20 ;
                                CacheHelper.saveData(key: "coin", value: coins);
                                Navigator.pop(context);

                              });
                            },

                            child: Text(
                              "AD : x2 COINS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                            )

                        ),
                      ),
                      )
                    ],
                  )

              ),
              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.03,),

              SizedBox(height: 10,),

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