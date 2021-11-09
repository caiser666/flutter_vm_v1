class ProductModel {
  final String id;
  final String title;
  final String imageUrl;
  final double price;
  late int stock;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.stock,
    required this.imageUrl, 
  });
}

List<ProductModel> products = [
  ProductModel(
    id: "1",
    title: "Biskuit",
    price: 6000,
    stock: 50,
    imageUrl: "https://id-live-05.slatic.net/p/ce8ead9ad7d76c22d15eb917d5bc64a8.jpg_720x720q80.jpg_.webp"
  ),
  ProductModel(
    id: "2",
    title: "Chips",
    price: 8000,
    stock: 60,
    imageUrl: "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//88/MTA-2650208/chitato_chitato-sapi-panggang-55g_full02.jpg"
  ),
  ProductModel(
    id: "3",
    title: "Oreo",
    price: 10000,
    stock: 100,
    imageUrl: "https://images.tokopedia.net/img/cache/500-square/product-1/2018/10/15/1101431/1101431_48e04aa4-52de-4a86-84ac-916396f3d54d_700_700.jpg.webp?ect=4g"
  ),
  ProductModel(
    id: "4",
    title: "Tango",
    price: 12000,
    stock: 100,
    imageUrl: "https://images.tokopedia.net/img/cache/900/VqbcmM/2021/9/22/580807ca-de93-48b9-8ec3-ce7ee03978b8.jpg"
  ),
  ProductModel(
    id: "5",
    title: "Cokelat",
    price: 15000,
    stock: 30,
    imageUrl: "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//88/MTA-3058116/silverqueen_silver-queen-almond-65g_full02.jpg"
  ),
];
