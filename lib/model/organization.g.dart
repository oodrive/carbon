// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrganizationAdapter extends TypeAdapter<Organization> {
  @override
  final int typeId = 0;

  @override
  Organization read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Organization(
      name: fields[1] as String,
      year: fields[2] as int,
    )
      ..id = fields[0] as String
      ..sites = (fields[3] as List).cast<Site>();
  }

  @override
  void write(BinaryWriter writer, Organization obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.year)
      ..writeByte(3)
      ..write(obj.sites);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrganizationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SiteAdapter extends TypeAdapter<Site> {
  @override
  final int typeId = 1;

  @override
  Site read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Site(
      name: fields[1] as String,
    )
      ..id = fields[0] as String
      ..scope1 = fields[2] as Scope1
      ..scope2 = fields[3] as Scope2
      ..scope3 = fields[4] as Scope3;
  }

  @override
  void write(BinaryWriter writer, Site obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.scope1)
      ..writeByte(3)
      ..write(obj.scope2)
      ..writeByte(4)
      ..write(obj.scope3);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SiteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class Scope1Adapter extends TypeAdapter<Scope1> {
  @override
  final int typeId = 2;

  @override
  Scope1 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Scope1()
      ..heatGeneration = (fields[0] as List).cast<Emission>()
      ..electricityProduction = (fields[1] as List).cast<Emission>()
      ..ownedTransport = (fields[2] as List).cast<Emission>()
      ..otherEmissions = (fields[3] as List).cast<Emission>();
  }

  @override
  void write(BinaryWriter writer, Scope1 obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.heatGeneration)
      ..writeByte(1)
      ..write(obj.electricityProduction)
      ..writeByte(2)
      ..write(obj.ownedTransport)
      ..writeByte(3)
      ..write(obj.otherEmissions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Scope1Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class Scope2Adapter extends TypeAdapter<Scope2> {
  @override
  final int typeId = 3;

  @override
  Scope2 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Scope2()
      ..electricityPurchase = (fields[0] as List).cast<Emission>()
      ..otherEmissions = (fields[1] as List).cast<Emission>();
  }

  @override
  void write(BinaryWriter writer, Scope2 obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.electricityPurchase)
      ..writeByte(1)
      ..write(obj.otherEmissions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Scope2Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class Scope3Adapter extends TypeAdapter<Scope3> {
  @override
  final int typeId = 4;

  @override
  Scope3 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Scope3()
      ..businessTravel = (fields[0] as List).cast<Emission>()
      ..employeeCommuting = (fields[1] as List).cast<Emission>()
      ..homeworkingEmissions = (fields[2] as List).cast<Emission>()
      ..dataCenter = (fields[3] as List).cast<Emission>()
      ..services = (fields[4] as List).cast<Emission>()
      ..goods = (fields[5] as List).cast<Emission>()
      ..capitalGoods = (fields[6] as List).cast<Emission>()
      ..waste = (fields[7] as List).cast<Emission>()
      ..productElectricityUsage = (fields[8] as List).cast<Emission>()
      ..otherEmissions = (fields[9] as List).cast<Emission>();
  }

  @override
  void write(BinaryWriter writer, Scope3 obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.businessTravel)
      ..writeByte(1)
      ..write(obj.employeeCommuting)
      ..writeByte(2)
      ..write(obj.homeworkingEmissions)
      ..writeByte(3)
      ..write(obj.dataCenter)
      ..writeByte(4)
      ..write(obj.services)
      ..writeByte(5)
      ..write(obj.goods)
      ..writeByte(6)
      ..write(obj.capitalGoods)
      ..writeByte(7)
      ..write(obj.waste)
      ..writeByte(8)
      ..write(obj.productElectricityUsage)
      ..writeByte(9)
      ..write(obj.otherEmissions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Scope3Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EmissionAdapter extends TypeAdapter<Emission> {
  @override
  final int typeId = 5;

  @override
  Emission read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Emission(
      type: fields[0] as String,
    )
      ..quantity = fields[1] as double
      ..amortizationPeriod = fields[2] as int
      ..adjustmentCoefficient = fields[3] as double
      ..note = fields[4] as String;
  }

  @override
  void write(BinaryWriter writer, Emission obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.amortizationPeriod)
      ..writeByte(3)
      ..write(obj.adjustmentCoefficient)
      ..writeByte(4)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmissionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Organization _$OrganizationFromJson(Map<String, dynamic> json) {
  return Organization(
    name: json['name'] as String,
    year: json['year'] as int,
  )
    ..id = json['id'] as String
    ..sites = (json['sites'] as List<dynamic>)
        .map((e) => Site.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$OrganizationToJson(Organization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'year': instance.year,
      'sites': instance.sites,
    };

Site _$SiteFromJson(Map<String, dynamic> json) {
  return Site(
    name: json['name'] as String,
  )
    ..id = json['id'] as String
    ..scope1 = Scope1.fromJson(json['scope1'] as Map<String, dynamic>)
    ..scope2 = Scope2.fromJson(json['scope2'] as Map<String, dynamic>)
    ..scope3 = Scope3.fromJson(json['scope3'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SiteToJson(Site instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'scope1': instance.scope1,
      'scope2': instance.scope2,
      'scope3': instance.scope3,
    };

Scope1 _$Scope1FromJson(Map<String, dynamic> json) {
  return Scope1()
    ..heatGeneration = (json['heatGeneration'] as List<dynamic>?)
            ?.map((e) => Emission.fromJson(e as Map<String, dynamic>))
            .toList() ??
        []
    ..electricityProduction = (json['electricityProduction'] as List<dynamic>?)
            ?.map((e) => Emission.fromJson(e as Map<String, dynamic>))
            .toList() ??
        []
    ..ownedTransport = (json['ownedTransport'] as List<dynamic>?)
            ?.map((e) => Emission.fromJson(e as Map<String, dynamic>))
            .toList() ??
        []
    ..otherEmissions = (json['otherEmissions'] as List<dynamic>?)
            ?.map((e) => Emission.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];
}

Map<String, dynamic> _$Scope1ToJson(Scope1 instance) => <String, dynamic>{
      'heatGeneration': instance.heatGeneration,
      'electricityProduction': instance.electricityProduction,
      'ownedTransport': instance.ownedTransport,
      'otherEmissions': instance.otherEmissions,
    };

Scope2 _$Scope2FromJson(Map<String, dynamic> json) {
  return Scope2()
    ..electricityPurchase = (json['electricityPurchase'] as List<dynamic>?)
            ?.map((e) => Emission.fromJson(e as Map<String, dynamic>))
            .toList() ??
        []
    ..otherEmissions = (json['otherEmissions'] as List<dynamic>?)
            ?.map((e) => Emission.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];
}

Map<String, dynamic> _$Scope2ToJson(Scope2 instance) => <String, dynamic>{
      'electricityPurchase': instance.electricityPurchase,
      'otherEmissions': instance.otherEmissions,
    };

Scope3 _$Scope3FromJson(Map<String, dynamic> json) {
  return Scope3()
    ..businessTravel = (json['businessTravel'] as List<dynamic>?)
            ?.map((e) => Emission.fromJson(e as Map<String, dynamic>))
            .toList() ??
        []
    ..employeeCommuting = (json['employeeCommuting'] as List<dynamic>?)
            ?.map((e) => Emission.fromJson(e as Map<String, dynamic>))
            .toList() ??
        []
    ..homeworkingEmissions = (json['homeworkingEmissions'] as List<dynamic>?)
            ?.map((e) => Emission.fromJson(e as Map<String, dynamic>))
            .toList() ??
        []
    ..dataCenter = (json['dataCenter'] as List<dynamic>?)
            ?.map((e) => Emission.fromJson(e as Map<String, dynamic>))
            .toList() ??
        []
    ..services = (json['services'] as List<dynamic>?)
            ?.map((e) => Emission.fromJson(e as Map<String, dynamic>))
            .toList() ??
        []
    ..goods = (json['goods'] as List<dynamic>?)
            ?.map((e) => Emission.fromJson(e as Map<String, dynamic>))
            .toList() ??
        []
    ..capitalGoods = (json['capitalGoods'] as List<dynamic>?)
            ?.map((e) => Emission.fromJson(e as Map<String, dynamic>))
            .toList() ??
        []
    ..waste = (json['waste'] as List<dynamic>?)
            ?.map((e) => Emission.fromJson(e as Map<String, dynamic>))
            .toList() ??
        []
    ..productElectricityUsage =
        (json['productElectricityUsage'] as List<dynamic>?)
                ?.map((e) => Emission.fromJson(e as Map<String, dynamic>))
                .toList() ??
            []
    ..otherEmissions = (json['otherEmissions'] as List<dynamic>?)
            ?.map((e) => Emission.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];
}

Map<String, dynamic> _$Scope3ToJson(Scope3 instance) => <String, dynamic>{
      'businessTravel': instance.businessTravel,
      'employeeCommuting': instance.employeeCommuting,
      'homeworkingEmissions': instance.homeworkingEmissions,
      'dataCenter': instance.dataCenter,
      'services': instance.services,
      'goods': instance.goods,
      'capitalGoods': instance.capitalGoods,
      'waste': instance.waste,
      'productElectricityUsage': instance.productElectricityUsage,
      'otherEmissions': instance.otherEmissions,
    };

Emission _$EmissionFromJson(Map<String, dynamic> json) {
  return Emission(
    type: json['type'] as String,
  )
    ..quantity = (json['quantity'] as num).toDouble()
    ..amortizationPeriod = json['amortizationPeriod'] as int? ?? 1
    ..adjustmentCoefficient =
        (json['adjustmentCoefficient'] as num?)?.toDouble() ?? 1
    ..note = json['note'] as String? ?? '';
}

Map<String, dynamic> _$EmissionToJson(Emission instance) => <String, dynamic>{
      'type': instance.type,
      'quantity': instance.quantity,
      'amortizationPeriod': instance.amortizationPeriod,
      'adjustmentCoefficient': instance.adjustmentCoefficient,
      'note': instance.note,
    };

OrganizationList _$OrganizationListFromJson(Map<String, dynamic> json) {
  return OrganizationList(
    (json['organizations'] as List<dynamic>)
        .map((e) => Organization.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$OrganizationListToJson(OrganizationList instance) =>
    <String, dynamic>{
      'organizations': instance.organizations,
    };
