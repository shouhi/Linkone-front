import 'package:flutter/material.dart';
import 'package:linkone/utils/const.dart';


class decorate_todo_column extends Container{
decorate_todo_column(String task_name, String due_string, String task_requirement)
  :super(
      margin: EdgeInsets.only(right: 13, left: 13, top: 6.5, bottom: 6.5),
      decoration: BoxDecoration(
        //角丸
        borderRadius: BorderRadius.circular(13),
        color: Colors.white,
      ),
      child: Column(children: [
        Container(
          margin: EdgeInsets.all(13),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top: 7, left: 4, bottom: 9),
                child: (() {
                  if (task_name.length <= 12) {
                    return Text(task_name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Palette.nearBlack,
                                ),
                              );
                  } else {
                    return Text(task_name.substring(0, 11) + "…",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Palette.nearBlack,
                                ),
                              );
                  }
                })(),),
              Container(
                margin: EdgeInsets.only(right: 1, top: 8),
                child: 
                Text("締め切り${due_string}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Palette.nearRed,
                    ),
                  )
                ),
            ],
          ),
          decoration: BoxDecoration(
            border: const Border(
              bottom: const BorderSide(
                color: Palette.underBarOffWhite,
                width: 3,
                
              )
            )
          ),
          
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: 13, left: 13, bottom: 20),
          child: (() {
            if (task_requirement.length <= 78) {
              return Text("要件：${task_requirement}", textAlign: TextAlign.left,);
            } else {
              return Text("要件：${task_requirement.substring(0, 77)}…");
            }
          })(),)
      ],),
    );
  }