import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF004BBB),
      width: 220,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 100,
            ),
            TextButton(
                onPressed: (){},
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('메인', style: TextStyle(color: Colors.white, fontSize: 18)
                    )
                )
            ),
            TextButton(
                onPressed: (){},
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('전공 기초', style: TextStyle(color: Colors.white, fontSize: 18)
                    )
                )
            ),
            TextButton(
                onPressed: (){},
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('전공', style: TextStyle(color: Colors.white, fontSize: 18)
                    )
                )
            ),
            TextButton(
                onPressed: (){},
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('기타', style: TextStyle(color: Colors.white, fontSize: 18)
                    )
                )
            ),
            TextButton(
                onPressed: (){},
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('공통 졸업 요건', style: TextStyle(color: Colors.white, fontSize: 18)
                    )
                )
            ),
            const SizedBox(
              height: 200,
            ),
            TextButton(
                onPressed: (){},
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('내 정보 수정', style: TextStyle(color: Colors.white, fontSize: 18)
                    )
                )
            ),
          ],
        ),
      ),
    );
  }
}
