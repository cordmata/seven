val PLAYABLE_CHARS    = List("X", "O")
val WINNING_POSITIONS = List((0,1,2), (3,4,5), (6,7,8), (0,3,6),
                             (1,4,7), (2,5,8), (0,4,8), (2,4,6))

def checkWinner(board: Array[String]): (Boolean, String) = {
    WINNING_POSITIONS.foreach { p =>
        val plays = List(board(p._1), board(p._2), board(p._3))
        if( plays.forall(v => v == plays(0)) && 
            (PLAYABLE_CHARS contains plays(0))) return (true, plays(0))
    }
    return (false, null)
}

//////////////////////////////////////////////////////////
def testCheckWinner() = {
  
	val no = Array( 
	    "X", " ", " ",
        "X", " ", " ",
		"O", " ", " "  
	)
	
    val yes = Array(
    	"O", " ", "X",
    	" ", "O", "X",
        " ", " ", "O" 
    )
	                 
    val (noAnswer, noChar) 	 = checkWinner(no)
    val (yesAnswer, yesChar) = checkWinner(yes)
    
    assert(noAnswer == false)                 
    assert(yesAnswer && yesChar== "O")
    println("Tests pass.")
}

testCheckWinner
//}