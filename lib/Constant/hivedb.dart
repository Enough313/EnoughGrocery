//
//
// import 'package:enough_grocery/Screens/populardeal/model/populardeal.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/adapters.dart';
//
// class HiveBoxes {
//   static Box? popularDealBox;
//
//   static Future<void> initHive() async {
//     await Hive.initFlutter();
//     Hive.registerAdapter(PopularDealModelAdapter());
//     popularDealBox = await Hive.openBox('popularDealBox');
//   }
// }
//
// class PopularDealModelAdapter extends TypeAdapter<PopularDealModel> {
//   @override
//   final int typeId = 0;
//
//   @override
//   PopularDealModel read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return PopularDealModel(
//       id: fields[0] as int,
//       name: fields[1] as String,
//       price: fields[2] as int,
//       actualprice: fields[3] as int,
//       quantity: fields[4] as int,
//       favourite: fields[5] as bool,
//       image: fields[6] as String,
//     );
//   }
//
//   @override
//   void write(BinaryWriter writer, PopularDealModel obj) {
//     writer
//       ..writeByte(7)
//       ..writeByte(0)
//       ..write(obj.id)
//       ..writeByte(1)
//       ..write(obj.name)
//       ..writeByte(2)
//       ..write(obj.price)
//       ..writeByte(3)
//       ..write(obj.actualprice)
//       ..writeByte(4)
//       ..write(obj.quantity)
//       ..writeByte(5)
//       ..write(obj.favourite)
//       ..writeByte(6)
//       ..write(obj.image);
//   }
// }
//
