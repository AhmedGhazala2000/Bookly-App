/// amountInMicros : 23990000
/// currencyCode : "USD"

class ListPrice {
  ListPrice({
      num? amountInMicros, 
      String? currencyCode,}){
    _amountInMicros = amountInMicros;
    _currencyCode = currencyCode;
}

  ListPrice.fromJson(dynamic json) {
    _amountInMicros = json['amountInMicros'];
    _currencyCode = json['currencyCode'];
  }
  num? _amountInMicros;
  String? _currencyCode;
ListPrice copyWith({  num? amountInMicros,
  String? currencyCode,
}) => ListPrice(  amountInMicros: amountInMicros ?? _amountInMicros,
  currencyCode: currencyCode ?? _currencyCode,
);
  num? get amountInMicros => _amountInMicros;
  String? get currencyCode => _currencyCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amountInMicros'] = _amountInMicros;
    map['currencyCode'] = _currencyCode;
    return map;
  }

}