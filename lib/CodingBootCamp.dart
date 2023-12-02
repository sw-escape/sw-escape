import 'package:flutter/material.dart';

///////////////////////////////////////////////////////////////
//test용
/*class CodingBootExample extends StatelessWidget {
  const CodingBootExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CoBooCam'),
      ),
      body: Container(
        child: Center(
          child: TextButton(
          ///////////////////////////////////////
              onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return LowestGraduateGPADialog();
                  }
              ),
           //////////////////////////////////////

              child: Text('코부?'),
          ),
        ),
      ),
    );
  }
}*/
///////////////////////////////////////////////////////////////

class CodingBootCampDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CodingBootCampDialogState();
  }
}

class _CodingBootCampDialogState extends State<CodingBootCampDialog> {
  bool _isCheckedPass = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 500,
        //constraints: const BoxConstraints(),
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors:[Color(0xFF507BEC),Color(0xFFADC9FF)]
          )
        ),
        child: Column(
          children: [
            Image.asset('assets/images/BootCampEx.png'),
            const SizedBox(
              height: 60,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black,
                    width: 1
                ),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 5.0,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              width: 200,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text('Pass', style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black45.withOpacity(0.5),
                            blurRadius: 3,
                            offset: const Offset(1.0,1.0),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Transform.scale(
                      scale: 2.5,
                      child: Checkbox(
                        focusColor: Colors.black,
                        value: _isCheckedPass,
                        onChanged: (value) {
                          setState(() {
                            _isCheckedPass = value!;
                            //저장, progress bar 변경
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Transform.scale(
              scale: 1.5,
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(
                      width: 1,
                      color: Colors.black
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  child: Text('Enter', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.black45.withOpacity(0.5),
                          blurRadius: 3,
                          offset: const Offset(1.0,1.0),
                        )
                      ]
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
      contentPadding: const EdgeInsets.all(0.0),
    );
  }
}
