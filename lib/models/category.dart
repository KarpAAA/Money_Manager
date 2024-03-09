import 'package:hive/hive.dart';
import 'package:some2/models/transaction_type.dart';

part 'generated/category.g.dart';

@HiveType(typeId: 0)
class Category{

  @HiveField(0)
  String name;

  @HiveField(1)
  TransactionType type;

  @HiveField(2)
  int color;

  @HiveField(3)
  int icon;

  Category(this.name,this.color, this.icon, this.type);

  @override
  bool operator ==(Object other) {

    if (identical(this, other)) return true;
    if (other is! Category) return false;

    return name == other.name &&
        type == other.type;
  }

  @override
  int get hashCode {
    int result = 17;
    result = 37 * result + name.hashCode;
    result = 37 * result + type.hashCode;
    return result;
  }

}