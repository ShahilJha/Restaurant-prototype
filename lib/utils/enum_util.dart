import 'package:summer_project/enumerators.dart';

class EnumUtil {
  static String jobPositionToString(JobPosition value) {
    String string;
    switch (value) {
      case JobPosition.Receptionist:
        string = 'Receptionist';
        break;

      case JobPosition.KitchenStaff:
        string = 'KitchenStaff';
        break;

      case JobPosition.Waiter:
        string = 'Waiter';
        break;
    }
    return string;
  }

  static JobPosition stringToJobPosition(String string) {
    JobPosition position;
    switch (string) {
      case 'Receptionist':
        position = JobPosition.Receptionist;
        break;

      case 'KitchenStaff':
        position = JobPosition.KitchenStaff;
        break;

      case 'Waiter':
        position = JobPosition.Waiter;
        break;
    }
    return position;
  }

  static String orderStatusToString(OrderStatus value) {
    String string;
    switch (value) {
      case OrderStatus.NewOrder:
        string = 'NewOrder';
        break;

      case OrderStatus.AdditionalOrder:
        string = 'AdditionalOrder';
        break;

      case OrderStatus.FinishedOrder:
        string = 'FinishedOrder';
        break;

      case OrderStatus.PartiallyFinishedOrder:
        string = 'PartiallyFinishedOrder';
        break;
    }
    return string;
  }

  static OrderStatus stringToOrderStatus(String string) {
    OrderStatus status;
    switch (string) {
      case 'NewOrder':
        status = OrderStatus.NewOrder;
        break;

      case 'AdditionalOrder':
        status = OrderStatus.AdditionalOrder;
        break;

      case 'FinishedOrder':
        status = OrderStatus.FinishedOrder;
        break;

      case 'PartiallyFinishedOrder':
        status = OrderStatus.PartiallyFinishedOrder;
        break;
    }
    return status;
  }

  static String foodItemStatusToString(FoodItemStatus value) {
    String string;
    switch (value) {
      case FoodItemStatus.NotReady:
        string = 'NotReady';
        break;

      case FoodItemStatus.NotAvailable:
        string = 'NotAvailable';
        break;

      case FoodItemStatus.Served:
        string = 'Served';
        break;

      case FoodItemStatus.Ready:
        string = 'Ready';
        break;
    }
    return string;
  }

  static FoodItemStatus stringToFoodItemStatus(String string) {
    FoodItemStatus status;
    switch (string) {
      case 'NotReady':
        status = FoodItemStatus.NotReady;
        break;

      case 'NotAvailable':
        status = FoodItemStatus.NotAvailable;
        break;

      case 'Served':
        status = FoodItemStatus.Served;
        break;

      case 'Ready':
        status = FoodItemStatus.Ready;
        break;
    }
    return status;
  }
}
