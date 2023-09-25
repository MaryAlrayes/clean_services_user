import 'package:flutter/material.dart';

showLoadingDialog(
  BuildContext context,String text
) {

  return Dialog(

   child: Padding(
     padding: const EdgeInsets.all(16.0),
     child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
      Text(text),
      const SizedBox(height: 16,),
      const CircularProgressIndicator(),
     ],),
   ),
  );
}
