import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String description;
  final double height;
  const Description(
      {super.key, required this.description, required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), // 둥근 모서리
            border: Border.all(color: Colors.black), // 까만색 테두리
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 10, vertical: 5), // 안쪽 여백 설정
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                description,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
