abstract class ProofTokenStorage {
  Future<void> saveProofToken(String proofToken);

  Future<String?> readProofToken();

  Future<void> deleteProofToken();
}
