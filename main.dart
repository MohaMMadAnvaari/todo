import 'dart:io';

import 'Name.dart';
import 'todo.dart';

List<Name> nameList = [];
List<Todo> todoList = [];
void main() {
  while (true) {
    print("1: لیست افراد\n"
        "2: لیست عنوان توضیحات و فرد\n"
        "\n3:لیست افراد و وظایف"
        "\n4: لیست وظایف"
        "\n5: دان کردن وظایف"
        "\n6:ویرایش وظایف دان نشده"
        "7: حذف وظایف");
    String? input = stdin.readLineSync();
    while (input != '1' && input != '2' && input != '3' && input != '4' &&
        input != '5' && input != '6' && input != '7' && input != 0) {
      print('عدد درست را وارد کنید');
      input = stdin.readLineSync();
    }
    int input1 = int.parse(input!);
    if (input1 == 0) {
      main();
    }
    else {
      switch (input1) {
        case(1):
          {
            print('نام فرد مورد نظر را ثبت کنید');
            String? inputName = stdin.readLineSync();
            while (inputName == ' ') {
              print('فرد مورد نظر را درست ثبت کنید');
              inputName = stdin.readLineSync();
            }
            if(inputName == '0'){
              main();
            }
            print('نام خانوادگی فرد مورد نظر را ثبت کنید');
            String? inputLastName = stdin.readLineSync();
            while (inputLastName == ' ') {
              print('نام خانوادگی فرد مورد نظر را درست ثبت کنید');
              inputLastName = stdin.readLineSync();
            }
            print('مشخصات فرد مورد نظر ثبت شد');
            Name name = Name(inputName!, inputLastName!);
            nameList.add(name);
          }
        case(2):
          {
            print('عنوان را ثبت کنید');
            String? inputTitle = stdin.readLineSync();
            while (inputTitle == ' ') {
              print('عنوان را درست ثبت کنید');
              String? inputTitle = stdin.readLineSync();
            }
            print('توضیحات را وارد کنید');
            String? inputDescribe = stdin.readLineSync();
            while (inputDescribe == ' ') {
              print('توضیحات را درست وارد کنید');
              String? inputDescribe = stdin.readLineSync();
            }
            print(' مشخصات و توضیحات به درستی ثبت شد');

            for(int i=0; i<nameList.length; i++){
              print('${i+1}: ${nameList[i].name}_ ${nameList[i].lastName}');
            }
            print('فرد مورد نظر را انتخاب کنید');
            String? input12 = stdin.readLineSync();
            int input122 = int.parse(input12!);
            while(input122 <1 || input122>nameList.length ){
              print('فرد مورد نظر را انتخاب کنید');
              input12 = stdin.readLineSync();
            }
            input122 = int.parse(input12!);
            Name newName = nameList[input122-1];
            Todo todo = Todo(inputTitle!, inputDescribe!,newName);
            todoList.add(todo);

          }
        case(3):
          {
            for (int i = 0; i < nameList.length; i++) {
              print('${i + 1}:${nameList[i].name}${nameList[i]
                  .lastName}');
              for(int j = 0 ; j < todoList.length ; j++){
                if(nameList[i] == todoList[j].person){
                  print('${todoList[j].title} / ${todoList[j].describtion}');
                }
              }
            }
          }

        case(4):
          {
            for (int i = 0; i < todoList.length; i++) {
              print('${todoList[i].title}_ ${todoList[i].describtion}');

            }
          }
      }
    }
  }
}