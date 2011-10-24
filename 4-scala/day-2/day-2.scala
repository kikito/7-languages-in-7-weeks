// find a discussion on how to use Scala files

// I'll assume you mean this: http://stackoverflow.com/questions/1284423/read-entire-file-in-scala

// What makes a closure different than a code block?

// http://stackoverflow.com/questions/1812401/exactly-what-is-the-difference-between-a-closure-and-a-block
// Basically, in Scala "block" means "piece of code" while "closure" means "Object with a Block inside". Like ruby's blocks vs Lambdas or Procs.

// use foldLeft to compute the total size of a list of strings

val c = (0 /: List("Uns", "Dos", "Tres", "Catorcey!")) { (count,_) => count + 1 }

println(c) // 4

// Write a Censor trait with a method that will replace Shoot and Darn with Pucky and Beans. Use a map to store the mapping.

val shootDarn  = Map( "Shoot" -> "Pucky", "Darn" -> "Beans" )

trait Censor {
  def fithAmmendmentMyAss(text: String, filters: Map[String, String]): String = {
      (text /: filters) { (str, filter) => str.replaceAll(filter._1, filter._2) }
  }
}

class Conservative extends Censor

println(new Conservative().fithAmmendmentMyAss("I Shoot bears near my Darn", shootDarn))

// load the curse words and censored versions from a file

val fileLines = scala.io.Source.fromFile("words.txt").getLines()
var wordsFromFile = Map[String,String]()

def arr2Tuple(arr: Array[String]):(String, String) = { arr(0) -> arr(1) }

fileLines.foreach(line => wordsFromFile += arr2Tuple(line.split(" ")))

println(new Conservative().fithAmmendmentMyAss("This is an innocent message from your granma", wordsFromFile))

