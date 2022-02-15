final String characterListQuery = r"""
query GetCharacters($page: Int) {
  characters(page: $page) {
    results {
      name,
      id,
      gender,
      image,
      status
    }
  }
}
""";

final String characterDetailsQuery = r"""
  query GetCharacter($id: ID!) {
  character(id: $id) {
    id,
    name,
    image,
    gender,
    status,
    episode {
      episode,
      name,
      id
    }
  }
}
 """;
