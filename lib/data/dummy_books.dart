class DummyBook {
  final String id;
  final String title;
  final String owner;
  final String imageUrl;
  final double price;

  DummyBook({
    required this.id,
    required this.title,
    required this.owner,
    required this.imageUrl,
    required this.price,
  });
}

final List<DummyBook> dummyBooks = [
  DummyBook(
    id: '1',
    title: 'Clean Code',
    owner: 'Rahul',
    imageUrl: 'https://picsum.photos/200/300?1',
    price: 299,
  ),
  DummyBook(
    id: '2',
    title: 'Flutter in Action',
    owner: 'Aman',
    imageUrl: 'https://picsum.photos/200/300?2',
    price: 249,
  ),
  DummyBook(
    id: '3',
    title: 'Data Structures',
    owner: 'Saqib',
    imageUrl: 'https://picsum.photos/200/300?3',
    price: 199,
  ),
  DummyBook(
    id: '4',
    title: 'Operating Systems',
    owner: 'Neha',
    imageUrl: 'https://picsum.photos/200/300?4',
    price: 179,
  ),
  DummyBook(
    id: '5',
    title: 'DBMS',
    owner: 'Arjun',
    imageUrl: 'https://picsum.photos/200/300?5',
    price: 220,
  ),
  DummyBook(
    id: '6',
    title: 'Computer Networks',
    owner: 'Zoya',
    imageUrl: 'https://picsum.photos/200/300?6',
    price: 260,
  ),

  // 🔽 Additional Books
  DummyBook(
    id: '7',
    title: 'Java: The Complete Reference',
    owner: 'Kunal',
    imageUrl: 'https://picsum.photos/200/300?7',
    price: 320,
  ),
  DummyBook(
    id: '8',
    title: 'Python Crash Course',
    owner: 'Ishita',
    imageUrl: 'https://picsum.photos/200/300?8',
    price: 280,
  ),
  DummyBook(
    id: '9',
    title: 'Design Patterns',
    owner: 'Rohit',
    imageUrl: 'https://picsum.photos/200/300?9',
    price: 350,
  ),
  DummyBook(
    id: '10',
    title: 'Web Development with React',
    owner: 'Ankit',
    imageUrl: 'https://picsum.photos/200/300?10',
    price: 270,
  ),
  DummyBook(
    id: '11',
    title: 'Kotlin for Android',
    owner: 'Priya',
    imageUrl: 'https://picsum.photos/200/300?11',
    price: 240,
  ),
  DummyBook(
    id: '12',
    title: 'Machine Learning Basics',
    owner: 'Faizan',
    imageUrl: 'https://picsum.photos/200/300?12',
    price: 399,
  ),
  DummyBook(
    id: '13',
    title: 'System Design Interview',
    owner: 'Aditi',
    imageUrl: 'https://picsum.photos/200/300?13',
    price: 420,
  ),
  DummyBook(
    id: '14',
    title: 'C Programming Language',
    owner: 'Nikhil',
    imageUrl: 'https://picsum.photos/200/300?14',
    price: 180,
  ),
  DummyBook(
    id: '15',
    title: 'Algorithms Unlocked',
    owner: 'Sneha',
    imageUrl: 'https://picsum.photos/200/300?15',
    price: 310,
  ),
];
