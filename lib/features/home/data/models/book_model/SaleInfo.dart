import 'RetailPrice.dart';
import 'Offers.dart';

/// country : "US"
/// saleability : "FOR_SALE"
/// isEbook : true
/// listPrice : {"amount":23.99,"currencyCode":"USD"}
/// retailPrice : {"amount":23.99,"currencyCode":"USD"}
/// buyLink : "https://play.google.com/store/books/details?id=qAOhDwAAQBAJ&rdid=book-qAOhDwAAQBAJ&rdot=1&source=gbs_api"
/// offers : [{"finskyOfferType":1,"listPrice":{"amountInMicros":23990000,"currencyCode":"USD"},"retailPrice":{"amountInMicros":23990000,"currencyCode":"USD"},"giftable":true}]

class SaleInfo {
  SaleInfo({
      String? country, 
      String? saleability, 
      bool? isEbook, 
      ListPrice? listPrice, 
      RetailPrice? retailPrice, 
      String? buyLink, 
      List<Offers>? offers,}){
    _country = country;
    _saleability = saleability;
    _isEbook = isEbook;
    _listPrice = listPrice;
    _retailPrice = retailPrice;
    _buyLink = buyLink;
    _offers = offers;
}

  SaleInfo.fromJson(dynamic json) {
    _country = json['country'];
    _saleability = json['saleability'];
    _isEbook = json['isEbook'];
    _listPrice = json['listPrice'];
    _retailPrice = json['retailPrice'] != null ? RetailPrice.fromJson(json['retailPrice']) : null;
    _buyLink = json['buyLink'];
    if (json['offers'] != null) {
      _offers = [];
      json['offers'].forEach((v) {
        _offers?.add(Offers.fromJson(v));
      });
    }
  }
  String? _country;
  String? _saleability;
  bool? _isEbook;
  ListPrice? _listPrice;
  RetailPrice? _retailPrice;
  String? _buyLink;
  List<Offers>? _offers;
SaleInfo copyWith({  String? country,
  String? saleability,
  bool? isEbook,
  ListPrice? listPrice,
  RetailPrice? retailPrice,
  String? buyLink,
  List<Offers>? offers,
}) => SaleInfo(  country: country ?? _country,
  saleability: saleability ?? _saleability,
  isEbook: isEbook ?? _isEbook,
  listPrice: listPrice ?? _listPrice,
  retailPrice: retailPrice ?? _retailPrice,
  buyLink: buyLink ?? _buyLink,
  offers: offers ?? _offers,
);
  String? get country => _country;
  String? get saleability => _saleability;
  bool? get isEbook => _isEbook;
  ListPrice? get listPrice => _listPrice;
  RetailPrice? get retailPrice => _retailPrice;
  String? get buyLink => _buyLink;
  List<Offers>? get offers => _offers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = _country;
    map['saleability'] = _saleability;
    map['isEbook'] = _isEbook;
    map['listPrice'] = _listPrice;
    if (_retailPrice != null) {
      map['retailPrice'] = _retailPrice?.toJson();
    }
    map['buyLink'] = _buyLink;
    if (_offers != null) {
      map['offers'] = _offers?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}