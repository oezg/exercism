object EliudsEggs {

    fun eggCount(number: Int) =
         generateSequence(number) { it and (it - 1) }
             .takeWhile { it > 0 }
             .count()
}
