object EliudsEggs {

    fun eggCount(number: Int) =
         generateSequence(number) { it / 2 }
             .takeWhile { it > 0 }
             .count { it and 1 == 1 }
}
