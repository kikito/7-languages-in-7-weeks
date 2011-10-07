# this program works, but for some reason it prints "nil" before letting me enter a number

tries := 10
guess := nil
secret := (Random value * 100) floor
stdio := File standardInput

while(tries > 0 and guess != secret,
  ("You have " .. (tries asNumber) .. " tries left. Insert number:") println
  guess := stdio readLine asNumber
  if( guess < secret, "You are getting colder" println )
  if( guess > secret, "You are getting hotter" println )
  tries = tries - 1
)

if( guess == secret,
  ("You found the secret number! It was " .. secret asString) println,
  ("You failed to find the secret number. It was " .. secret asString) println
)
