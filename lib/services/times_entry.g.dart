// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'times_entry.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimesEntryAdapter extends TypeAdapter<TimesEntry> {
  @override
  final int typeId = 2;

  @override
  TimesEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimesEntry()
      .._monthStartDate = fields[0] as int
      .._dayOfWeekStart = fields[1] as int;
  }

  @override
  void write(BinaryWriter writer, TimesEntry obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj._monthStartDate)
      ..writeByte(1)
      ..write(obj._dayOfWeekStart);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimesEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
