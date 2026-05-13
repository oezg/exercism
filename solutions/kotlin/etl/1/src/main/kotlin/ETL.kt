object ETL {
    fun transform(source: Map<Int, Collection<Char>>) =
        source.flatMap { (score, letters) -> letters.map { (it.lowercaseChar() to score) } }.toMap()
}
