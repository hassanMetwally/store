class BasePayment{
  String paymentId;
  String paymentMethod;
  double amount;
  DateTime paymentDate;

  BasePayment(this.paymentId,this.paymentMethod,this.amount,this.paymentDate);
  BasePayment.fromJson(Map<String,dynamic> jsonObject){
    this.paymentId = jsonObject["payment_id"];
    this.paymentMethod =jsonObject["payment_method"];
    this.amount = jsonObject["amount"];
    this.paymentDate = DateTime.parse(jsonObject["payment_date"]);
  }
}