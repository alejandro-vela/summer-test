import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: Colors.black.withOpacity(0.5),
        ),
        Container(
          padding: EdgeInsets.all(40),
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.2),
              borderRadius: BorderRadius.circular(5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: Colors.amber,
                strokeWidth: 2,
              ),
              SizedBox(height: 20),
              Text(
                'Cargando...',
                style: TextStyle(fontSize: 10.sp, color: Colors.black),
              )
            ],
          ),
        )
      ],
    );
  }
}
