import 'package:flutter/material.dart';

class Despcription extends StatelessWidget {
  final String description;
  final double height;
  const Despcription(
      {super.key, required this.description, required this.height});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), // 둥근 모서리
          border: Border.all(color: Colors.black), // 까만색 테두리
          color: Colors.white,
        ),

        padding: const EdgeInsets.all(20), // 안쪽 여백 설정
        child: Text(
          description,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
