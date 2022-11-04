class ModelRentalMobil {
  int? id;
  String? name;
  String? owner;
  String? image;
  String? firstPrice;
  String? secondPrice;

  ModelRentalMobil({this.id, this.name, this.owner, this.image, this.firstPrice, this.secondPrice});

  ModelRentalMobil.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    owner = data['owner'];
    image = data['image'];
    firstPrice = data['firstPrice'];
    secondPrice = data['secondPrice'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'owner': owner,
      'image': image,
      'firstPrice': firstPrice,
      'secondPrice': secondPrice,
    };
  }
}
