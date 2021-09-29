// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_service.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JobServiceAdapter extends TypeAdapter<JobService> {
  @override
  final int typeId = 0;

  @override
  JobService read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JobService()
      .._name = fields[0] as String
      .._rate = fields[1] as int
      .._currency = fields[2] as String
      .._paidBreaks = fields[3] as bool
      .._presentBreaks = fields[4] as bool
      .._location = fields[5] as String;
  }

  @override
  void write(BinaryWriter writer, JobService obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj._name)
      ..writeByte(1)
      ..write(obj._rate)
      ..writeByte(2)
      ..write(obj._currency)
      ..writeByte(3)
      ..write(obj._paidBreaks)
      ..writeByte(4)
      ..write(obj._presentBreaks)
      ..writeByte(5)
      ..write(obj._location);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobServiceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
