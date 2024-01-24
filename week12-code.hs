-- base10to2
-- converts decimal to binary
base10to2 :: Integer -> Integer
base10to2 n 
   | n == 0 = 0
   | n == 1 = 1
   | n < 0 = error " negative number"
   | n`mod` 2 == 0 = 0 + (base10to2 (n ` div` 2) ) *10
   | n `mod` 2 == 1 = 1 + (base10to2 (n `div` 2)) *10
