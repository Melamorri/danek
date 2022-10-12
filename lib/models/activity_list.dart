class ActivityList {
  String name;
  String image;
  String gif;
  String wav;

  ActivityList({
    required this.name,
    required this.image,
    required this.gif,
    this.wav = '',
  });
}

List<ActivityList> ativityList = [
  ActivityList(
    name: 'Читать книгу',
    image: 'assets/images/readbookbutton.png',
    gif:
        'https://advance-club.ru/images/uploads/kakie-knigi-predlojit-rebenku-2.gif',
  ),
  ActivityList(
      name: 'Чистить зубы',
      image: 'assets/images/toothbrushbutton.png',
      gif: 'http://file.mobilmusic.ru/7d/28/db/878164.gif',
      wav: 'teeth.mp3'),
  ActivityList(
      name: 'Играть в игрушки',
      image: 'assets/images/toysbutton.png',
      gif: 'https://i.gifer.com/aMs.gif',
      wav: 'toys.mp3'),
  ActivityList(
    name: 'Вкусно поесть',
    image: 'assets/images/eatbutton.png',
    gif:
        'https://i.pinimg.com/originals/26/6a/31/266a31e4d7dcf4eb9deba7dd32ca8a34.gif',
  ),
  ActivityList(
    name: 'Делать зарядку',
    image: 'assets/images/gymbutton.png',
    gif: 'https://media.tenor.com/fhBpSJxEozwAAAAC/iworkout-winniethepooh.gif',
  ),
];
// нужно тогда добавить сюда же  стоимость действия,  это переменная cash
//прописано в helpers/activity_button   

