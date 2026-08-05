object Flattener {
  fun flatten(source: Collection<Any?>) = buildList {
    fun go(collection: Collection<Any?>): Unit = collection.forEach {
      when (it) {
        null -> return@forEach
        is Collection<*> -> go(it)
        else -> add(it)
      }
    }

    go(source)
  }
}
