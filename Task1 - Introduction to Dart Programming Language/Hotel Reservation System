import 'dart:io';
void main ()
{

  var rooms=  List(100);
  for (var i =0;i<100 ;i++)
  {
    rooms[i]=true;
  }

  var hotelier;
while(true) {

  print('if user wants to check-in enter 1 ,else enter 0');
  var checkIn = int.parse(stdin.readLineSync());
  print('enter name:');
  var name = stdin.readLineSync();
  print('enter id :');
  var id = int.parse(stdin.readLineSync());

  var x, price;


  if (checkIn == 1) {

    print('enter room degree');
    var stars = int.parse(stdin.readLineSync());
     hotelier = Reservation(name, id, x);

    var i;
    if (stars == 5) {
      i = 71;
    }
    else if (stars == 4) {
      i = 51;
    } else {
      i = 0;
    }

    for (i; i < 100; i++) {
      if (rooms[i]) {
        x = i;
        break;
      }
    }
    rooms[i] = false;
    if (x > 70) {
      price = '\$300';
    }
    else if (x > 50) {
      price = '\$200';
    }
    else {
      price = '\$100';
    }
    print('name=$name \nid=$id\nroom number=$x \ncost per day=$price');
  }

  else {
    print('enter room number :');
    var room=int.parse(stdin.readLineSync());
    var h=Reservation(name, id, room);
    var cost = price *( DateTime
        .now()
        .difference(h.checkInDate)
        .inDays);
    rooms[room] = true;
    print('the total cost = $cost');
  }
}
}


class Reservation
{
  final DateTime checkInDate=DateTime.now();
  String name;
  int id ;
  int roomNO;
  Reservation(this.name,this.id,this.roomNO);

}
