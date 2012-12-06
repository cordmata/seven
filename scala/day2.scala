val words = List("I", "will", "be", "24", "characters", "long.")
println((0 /: words) {(count, word) => count + word.length})

trait Censor {

    val replacementsForNaughty = Map(("shoot", "plucky"), ("darn", "beans"))

    def replaceNaughty(naughty: String): String = {
        var notNaughty = naughty
        for ((bad, good) <- replacementsForNaughty) notNaughty = naughty.toLowerCase.replaceAll(bad.toLowerCase, good)
        return notNaughty
    }

}

class CensorTest() extends Censor {

    val testString = "Shoot man, I'm feeling pretty plucky today."

    def test = { println(this.replaceNaughty(testString)) }
    
}

val t = new CensorTest()
t.test