// find the scala API

// http://www.scala-lang.org/api


// find a comparison of java and scala

// http://www.ibm.com/developerworks/java/library/j-scala01228/index.html



// A discussion of val vs var

// http://stackoverflow.com/questions/1791408/what-is-the-difference-between-a-var-and-val-definition-in-scala

// Write a game that will take a tic-tac-toe board with X,O and blank characters and detect the winner or tie or no winner yet. Use classes where appropiate

/* first let me define a micro test lib */

class AssertException(msg: String) extends Exception(msg: String)

def assertThrows[E](f: => Unit)(implicit eType:ClassManifest[E]) {
  try{
   f
  } catch {
    case e: Exception =>
      if ( eType.erasure.isAssignableFrom(e.getClass)) { return }
  }
  throw new AssertException("Expected error of type " + eType.erasure.getName )
}

def assert(condition: Boolean, message: String) {
  if(!condition) { throw new AssertException(message) }
}

def assertNot(condition: Boolean, message: String) {
  assert(!condition, message)
}

/* micro tests tests */

// assertThrows tests
assertThrows[NullPointerException]{ throw new NullPointerException() }
assertThrows[Exception] { throw new NullPointerException() }
assertThrows[AssertException] { assertThrows[Exception]{ } }

// assert tests
assertThrows[AssertException] { assert(1 > 2, "Maths don't work") }
assert(1 <3 -1, "1 loves minus 1")

// asertNot tests
assertThrows[AssertException] { assertNot(1 < 2, "Maths still don't work") }
assertNot( 2 <3 -1, "2 does (not) love -1")


/* Now, to the problem itself */

class InvalidCellException(cellValue: String) extends Exception("Invalid cell value: " + cellValue)

object Cell{
  val VALID_VALUES = Set("X", "O", " ")
}

class Cell(v: String){
  if( !Cell.VALID_VALUES(v) ) { throw new InvalidCellException(v) }
  val value: String = v

  override def equals(other: Any):Boolean= other match {
    case other: Cell => this.value == other.value
    case _ => false
  }
}

type InputLine = (String, String, String)

class Line(input: InputLine) {
  val cells = List(new Cell(input._1), new Cell(input._2), new Cell(input._3))

  def isWinner(player: String):Boolean = {
    !cells.exists( c => c.value != player )
  }

  def hasSpaces():Boolean = {
    cells.exists( c => c.value == " " )
  }

  override def equals(other: Any):Boolean= other match {
    case other: Line => this.cells == other.cells
    case _ => false
  }
}

type InputBoard = (InputLine, InputLine, InputLine)

class Board(input: InputBoard) {
  val rows = List(new Line(input._1), new Line(input._2), new Line(input._3))

  val columns = List(
    new Line( input._1._1, input._2._1, input._3._1 ),
    new Line( input._1._2, input._2._2, input._3._2 ),
    new Line( input._1._3, input._2._3, input._3._3 )
  )

  val diagonals = List(
    new Line( input._1._1, input._2._2, input._3._3 ),
    new Line( input._1._3, input._2._2, input._3._1 )
  )

  val lines = rows ++ columns ++ diagonals

  def isWinner(player: String):Boolean = {
    lines.exists( l => l.isWinner(player) )
  }

  def isFinished():Boolean = {
    ! lines.exists( l => l.hasSpaces() )
  }

  def isTie():Boolean = {
    isFinished() && !isWinner("X") && !isWinner("O")
  }

}


/* Cell tests */
assertThrows[InvalidCellException] { new Cell("Foo") }
assertThrows[InvalidCellException] { new Cell("") }
assert(new Cell("X") == new Cell("X"), "Equality")
assertNot( new Cell("X") == new Cell(" "), "NonEquality")


/* Line tests */
assertThrows[InvalidCellException] { new Line("Foo", "Bar", "Baz") }

assert(    new Line("X", "X", "X").isWinner("X"), "X winner is calculated correctly" )
assertNot( new Line("X", " ", "X").isWinner("X"), "X doesn't win this line" )
assert(    new Line("O", "O", "O").isWinner("O"), "O winner is calculated correctly" )

assertNot( new Line("X", "O", "X").hasSpaces()  , "hasSpaces returns false when there are no spaces")
assert(    new Line(" ", "X", "O").hasSpaces()  , "hasSpaces returns true when there is 1 space" )
assert(    new Line(" ", " ", "O").hasSpaces()  , "hasSpaces returns true when there are 2 spaces" )

assert(    new Line("X", " ", "O") == new Line("X", " ", "O"), "Equality" )
assertNot( new Line("X", "X", "X") == new Line("O", "O", "O"), "Non equality" )


/* Board tests */
val inputBoard = new Board(("X","O","X"), ("O"," ","X"), ("O","X","O"))
val rows =      List(new Line("X","O","X"), new Line("O"," ","X"), new Line("O","X","O"))
val columns =   List(new Line("X","O","O"), new Line("O"," ","X"), new Line("X","X","O"))
val diagonals = List(new Line("X"," ","O"), new Line("X"," ","O"))

assert( inputBoard.rows == rows, "rows" )
assert( inputBoard.columns == columns,  "columns")
assert( inputBoard.diagonals == diagonals, "diagonals")
assert( inputBoard.lines == rows ++ columns ++ diagonals, "lines")


val xWinsByRows = new Board(("X","X","X"), (" "," ","O"), ("O"," ","O"))
assert(                                            xWinsByRows.isWinner("X"), "X wins by rows" )
assert( new Board(("X"," ","O"), ("X"," ","O"), ("X","O"," ")).isWinner("X"), "X wins by columns" )
assert( new Board(("X","O","O"), (" ","X","O"), (" "," ","X")).isWinner("X"), "X wins by diagonals" )


val oWinsByRows = new Board(("X","X"," "), (" "," ","X"), ("O","O","O"))
assert(                                            oWinsByRows.isWinner("O"), "O wins by rows" )
assert( new Board(("X"," ","O"), ("X"," ","O"), (" ","X","O")).isWinner("O"), "O wins by columns" )
assert( new Board(("X"," ","O"), (" ","O","X"), ("O"," ","X")).isWinner("O"), "O wins by diagonals" )

val tieBoard = new Board(("X","X","O"),
                         ("O","O","X"),
                         ("X","O","O"))

assert(    tieBoard.isFinished(), "finished")
assertNot( inputBoard.isFinished(), "not finished")

assert(    tieBoard.isTie(),  "Tie")
assertNot( inputBoard.isTie(), "Not tie when not finished")
assertNot( xWinsByRows.isTie(), "Not tie when one of the players wins")
