class Guide {
  final String title;
  final String subtitle;
  final String image; // Path or URL to the image

  const Guide({
    required this.title,
    required this.subtitle,
    required this.image,
  });

  static List<Guide> guideList = [
    const Guide(
        title: 'Basic type of investments',
        subtitle: "This is how you set your foot for 2020\n"
            "Stock market recession. What's next",
        image: 'assets/images/guide1.jpeg'),
    const Guide(
        title: 'How much can you start with.. ',
        subtitle: "What do you like to see? It's a very\n"
            "different market from 2018. The way..",
        image: 'assets/images/guide2.jpeg')
  ];
}
