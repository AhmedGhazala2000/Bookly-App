// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookEntityAdapter extends TypeAdapter<BookEntity> {
  @override
  final int typeId = 0;

  @override
  BookEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookEntity(
      category: fields[10] as String?,
      image: fields[0] as String,
      title: fields[1] as String,
      authorName: fields[2] as String,
      price: fields[3] as int?,
      priceSaleability: fields[4] as String?,
      priceCurrency: fields[5] as String?,
      averageRating: fields[8] as num,
      ratingsCount: fields[9] as num,
      previewLink: fields[6] as String?,
      buyLink: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BookEntity obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.authorName)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.priceSaleability)
      ..writeByte(5)
      ..write(obj.priceCurrency)
      ..writeByte(6)
      ..write(obj.previewLink)
      ..writeByte(7)
      ..write(obj.buyLink)
      ..writeByte(8)
      ..write(obj.averageRating)
      ..writeByte(9)
      ..write(obj.ratingsCount)
      ..writeByte(10)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
