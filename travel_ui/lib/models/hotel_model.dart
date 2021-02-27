class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;
  double rating;
  int totalRatings;
  List reviews;
  Hotel(
      {this.imageUrl,
      this.name,
      this.address,
      this.price,
      this.rating,
      this.totalRatings,
      this.reviews});
}

final List<Hotel> hotels = [
  Hotel(
      imageUrl: 'assets/images/hotel0.jpg',
      name: 'Hotel 0',
      address: '404 Great st',
      price: 190,
      rating: 2.7,
      totalRatings: 15,
      reviews: ["Review 1", "Review Two", "Review 4", "Review 9"]),
  Hotel(
      imageUrl: 'assets/images/hotel1.jpg',
      name: 'Hotel 1',
      address: '404 Great st',
      price: 170,
      rating: 3.5,
      totalRatings: 13,
      reviews: ["Review 1", "Review Two", "Review 4", "Review 9"]),
  Hotel(
      imageUrl: 'assets/images/hotel2.jpg',
      name: 'Hotel 2',
      address: '404 Great st',
      price: 300,
      rating: 4.5,
      totalRatings: 2,
      reviews: ["Review 1", "Review Two", "Review 4", "Review 9"]),
];
