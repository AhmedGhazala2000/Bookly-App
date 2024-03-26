import 'package:equatable/equatable.dart';

import 'item.dart';

class BookModel extends Equatable {
  final String? kind;
  final int? totalItems;
  final List<BookItem>? items;

  const BookModel({this.kind, this.totalItems, this.items});

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        kind: json['kind'] as String?,
        totalItems: json['totalItems'] as int?,
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => BookItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'totalItems': totalItems,
        'items': items?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [kind, totalItems, items];
}
