import 'package:dbcrypt/dbcrypt.dart';

verify(psw1, psw2, hashed) {
  print("[VERIFY] $psw1\t$psw2");
  var isCorrect = new DBCrypt().checkpw(psw1, hashed);
  print("[VERIFY] $isCorrect");
}

hash(psw) {
  print("[HASH] plainPassword: $psw");
  var hashed = new DBCrypt().hashpw(psw, new DBCrypt().gensalt());
  print("[HASH] hashedPassword: $hashed");
  return hashed;
}

main() {
  var psw1 = "pass1234";
  var psw2 = "1234pass";
  var hash1 = hash(psw1);
  var hash2 = hash(psw2);
  verify(psw1, psw2, hash2);
  verify(psw1, psw1, hash1);
}
