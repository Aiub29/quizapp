import 'package:flutter/material.dart';
import 'package:quiz_app/model/question.dart';
import 'package:quiz_app/contact_page.dart';
class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}
class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex=0;
  List questionBank =[Question.name('1 Dart is a Programming Language', true),
 Question.name('2 Flutter Use Dart Programing Langurage', true),
 Question.name('3 Flutter is a Framework name ', true),
 Question.name('4 Dart is not OOP Programming Language', false),
 Question.name('5 Google is the Owner of Flutter ', true),
 Question.name('6 Flutter is Apps is Cross platform', true),
 Question.name('7 Flutter is free and open-source', true),
 Question.name('8 A Flutter app is always considered as a tree of widgets', true),
 Question.name('9 Flutter apps is not Faster', false),
 Question.name('10 In Flutter apps Development Hot Reload is not available', false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Interview Question'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (context) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset('images/quiz.jpg',
                  width: 250,
                    height: 180,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                       color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.40),
                      border: Border.all(
                        color: Colors.blueGrey.shade900,style: BorderStyle.solid,
                      )
                    ),
                    height: 150.0,
                    child: Center(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(questionBank[_currentQuestionIndex].questionText,
                        style: TextStyle(fontSize: 16.0,color:Colors.white ),),
                    )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(onPressed: () => _prevAnswer(true,context),
                      color: Colors.blueGrey.shade900,
                      child: Icon(Icons.arrow_back,color: Colors.white,),
                    ),
                    RaisedButton(onPressed: () => _checkAnswer(true,context),
                    color: Colors.blueGrey.shade900,
                      child: Text('True',style: TextStyle(color: Colors.white),),
                    ),
                    RaisedButton(onPressed: () => _checkAnswer(false,context),
                    color: Colors.blueGrey.shade900,
                      child: Text('False',style: TextStyle(color: Colors.white),),
                    ),
                    RaisedButton(onPressed: () => _nextAnswer(),
                    color: Colors.blueGrey.shade900,
                      child: Icon(Icons.arrow_forward,color: Colors.white,),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          );
        }
      ),
      drawer: Drawer(

        child: ListView(

          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration:BoxDecoration(
                color: Colors.amber.shade600,
                borderRadius: BorderRadius.circular(10.0),
              ),
              accountName: Text('Aiub Ali'),
              accountEmail: Text('aiubali29@gmail.com'),
              currentAccountPicture:Image.asset('images/aiub.jpg',),

            ),
            ListTile(
                leading: Icon(Icons.home),title: Text('Home'),
                onTap: (){
                  Navigator.pop(context);
                }
            ),


            ListTile(
                leading: Icon(Icons.contacts),title: Text('Contact'),
                onTap: (){
                 Navigator.of(context).push(
                   MaterialPageRoute(builder: (context) => ContactPage()),

                 );
                }
            ),

            ListTile(
                leading: Icon(Icons.share),title: Text('SHARE'),
                onTap: (){
                  Navigator.pop(context);
                }
            ),
          ],
        ),
      ),
    );
  }
  _checkAnswer( bool userChoice, BuildContext context){
  if(userChoice == questionBank[_currentQuestionIndex].isCorrect){
    final snackbar = SnackBar(
      backgroundColor: Colors.green,
        duration: Duration(milliseconds: 500),
        content: Text('Correct'));
    Scaffold.of(context).showSnackBar(snackbar);
setState(() {
  updateQuestion();
});

  }
  else{
    debugPrint('Incorrect !');
    final snackbar = SnackBar(
      backgroundColor: Colors.redAccent,
        duration: Duration(milliseconds: 500),
        content: Text('Incorrect'));
    Scaffold.of(context).showSnackBar(snackbar);
    updateQuestion();
  }
  }
  updateQuestion(){
    setState(() {
      _currentQuestionIndex =(_currentQuestionIndex +1) % questionBank.length;
    });
  }
  _nextAnswer() {
    updateQuestion();
  }

  _prevAnswer(bool bool, BuildContext context) {
   setState(() {
     _currentQuestionIndex =(_currentQuestionIndex -1) % questionBank.length;
   });

  }
}
