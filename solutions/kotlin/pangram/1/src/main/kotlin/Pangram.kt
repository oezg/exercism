object Pangram {

  fun isPangram(input: String) =
    input.lowercase().run {
      ('a'..'z').all {
        it in this
      }
    }
}
