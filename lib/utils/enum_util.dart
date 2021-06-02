import 'package:summer_project/enumerators.dart';

//TODO: make the string have space
class EnumUtil {
  static String jobPositionToString(JobPosition value) {
    String string;
    switch (value) {
      case JobPosition.Receptionist:
        string = 'Receptionist';
        break;

      case JobPosition.KitchenStaff:
        string = 'Kitchen Staff';
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

      case 'Kitchen Staff':
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
        string = 'New Order';
        break;

      case OrderStatus.AdditionalOrder:
        string = 'Additional Order';
        break;

      case OrderStatus.FinishedOrder:
        string = 'Finished Order';
        break;

      case OrderStatus.PartiallyFinishedOrder:
        string = 'Partially Finished Order';
        break;

      case OrderStatus.ItemNotAvailable:
        string = 'Item Not Available';
        break;
    }
    return string;
  }

  static OrderStatus stringToOrderStatus(String string) {
    OrderStatus status;
    switch (string) {
      case 'New Order':
        status = OrderStatus.NewOrder;
        break;

      case 'Additional Order':
        status = OrderStatus.AdditionalOrder;
        break;

      case 'Finished Order':
        status = OrderStatus.FinishedOrder;
        break;

      case 'Partially Finished Order':
        status = OrderStatus.PartiallyFinishedOrder;
        break;

      case 'Item Not Available':
        status = OrderStatus.ItemNotAvailable;
        break;
    }
    return status;
  }

  static String foodItemStatusToString(FoodItemStatus value) {
    String string;
    switch (value) {
      case FoodItemStatus.NotReady:
        string = 'Not Ready';
        break;

      case FoodItemStatus.NotAvailable:
        string = 'Not Available';
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
      case 'Not Ready':
        status = FoodItemStatus.NotReady;
        break;

      case 'Not Available':
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
