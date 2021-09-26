class UserNotFoundException implements Exception {
  String toString() => 'Utilisateur introuvable';
}

class UserAlreadyExistException implements Exception {
  String toString() => 'Cet utilisateur existe déja';
}
