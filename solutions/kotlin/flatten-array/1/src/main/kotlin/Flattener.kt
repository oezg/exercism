object Flattener {
  fun flatten(source: Collection<Any?>, acc: List<Any> = emptyList()): List<Any> {
    if (source.isEmpty()) return acc
    val tail = source.drop(1)
    return when (val head = source.first()) {
      null -> flatten(tail, acc)
      is Collection<*> -> flatten(tail, acc + flatten(head))
      else -> flatten(tail, acc + head)
    }
  }
}