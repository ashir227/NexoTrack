// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PortfolioModelAdapter extends TypeAdapter<PortfolioModel> {
  @override
  final int typeId = 0;

  @override
  PortfolioModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PortfolioModel(
      name: fields[0] as String,
      qty: fields[1] as double,
      buyPrice: fields[2] as double,
      totalinvest: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, PortfolioModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.qty)
      ..writeByte(2)
      ..write(obj.buyPrice)
      ..writeByte(3)
      ..write(obj.totalinvest);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PortfolioModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
