// "_id": "65bbca5e6096740150c54169",
// "ProductName": "Macbook air 2023 m2",
// "ProductCode": "M2AIR",
// "Img": "https://cdn.mos.cms.futurecdn.net/gbho6bhS4xVL3gU2MVYx7U.jpg",
// "UnitPrice": "175000",
// "Qty": "5",
// "TotalPrice": "600000",
// "CreatedDate": "2024-01-24T09:34:55.480Z"

class Product {
  String? id;
  String? productName;
  String? productCode;
  String? unitPrice;
  String? productQuantity;
  String? totalPric;
  String? image;
  String? createdDate;

  Product(
      {this.id,
      this.productName,
      this.productCode,
      this.unitPrice,
      this.productQuantity,
      this.totalPric,
      this.image,
      this.createdDate});

  Product.jason(Map<String, dynamic> jason) {
    id= jason['_id'];
    productName= jason['ProductName'];
    image= jason['Img'];
    createdDate= jason['CreatedDate'];
    productCode= jason['ProductCode'];
    productQuantity= jason['Qty'];
    totalPric= jason['TotalPrice'];
    unitPrice= jason['UnitPrice'];
  }
}
