class Person {
  String name;
  int age;
  
  Person({this.name, this.age = 30});
  
  Person.veryOld(this.name){
    age = 60;
  }
}

double addNumbers(double num1, double num2){
  //print(num1+num2);
  return num1 + num2;
}

void main() {
  var p1 = Person(name: 'Max',age: 30);
  var p2 = Person(age: 31, name: 'Manu');
  var p3 = Person.veryOld('Max');
  print(p3.name);
  print(p3.age);
  print(p1.name);
  print(p2.name);
  var firstResult = addNumbers(1, 2.6);
  firstResult = addNumbers(1, 1);
  // ...
  print(firstResult + 1);
  print('Hello!');
}