class Validator {

  Validator({bool validation, Function fail, Function success}) {
    validation ? success.call() : fail.call();
  }

}