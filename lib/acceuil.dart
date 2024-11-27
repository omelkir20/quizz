import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Acceuil extends StatelessWidget {
  const Acceuil ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Material(
      child:Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 200),
            child:Text("Mon app quizz2",
              style: TextStyle(
                  fontSize: 40,
                fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 200, 13, 0)
              ),)),

          Image.asset('assets/images/quiz.png'),
          ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/homePage');
              },
              child: const Text('Quiz'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 200, 13, 0),
              foregroundColor: Colors.white
            ),
          )

        ],
      ),
    );
  }
}
