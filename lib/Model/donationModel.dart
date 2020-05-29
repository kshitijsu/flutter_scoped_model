import 'package:scoped_model/scoped_model.dart';

class DonationModel extends Model {
  int _count = 0;
  bool _donateClicked = false;

  get count => _count;
  get donateClicked => _donateClicked;

  set donateClicked(bool donate) {
    if (donate == null) {
      throw new ArgumentError();
    }
    _donateClicked = donate;
    notifyListeners();
  }

  void increrment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
