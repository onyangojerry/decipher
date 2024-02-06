{-
Name(s): Jerry Onyango, Elsie Okon
Date: 

CSCI 054 - Fall 2023
Week03 problem set

-}

--myZip
-- takes two lists and returns a list of pairs
myZip :: [a] -> [b] -> [(a,b)]
myZip xs ys
   | (length xs) == 0 && (length ys) == 0 = []
   | (length xs) == 0 = []
   | (length ys) == 0 = []
   | otherwise = (head xs, head ys) : myZip (tail xs) (tail ys)

--consAll
-- akes a list of lists and an element, and prepends
--the element to every member of the list of lists
consAll :: [[a]] -> a -> [[a]]
consAll [] _ = []
consAll (x:xs) n = (n:x) : consAll xs n


--cyc helper function
--rotates the elements in a list by a given amount
cyc :: [a] -> [a]
cyc [] = []
cyc (x:xs) = xs ++ [x]

-- tzuyi: need to handle case where list is empty
cycleK :: Integer -> [a] -> [a] 
cycleK n xs
   | null xs = []  -- tzuyi: added to handle empty list
   | n == 0 = xs 
   | n < 0 = cycleK (n + (fromIntegral( length xs))) xs
   | n > (fromIntegral (length xs) ) = cycleK (n `mod` (fromIntegral (length xs))) xs
   | True = cycleK (n-1) (cyc xs)

--toDigits
-- converts a positive integer to a list of digits.
-- tzuyi: incorrect behavior for negative numbers
toDigits :: Integer -> [Integer]
toDigits 0 = []
toDigits n =
  if n < 0 -- tzuyi: added to handle negative numbers
  then []
  else toDigits (n `div` 10) ++ [n`mod`10]

--toDigitsRev
-- converts a positive integer to a list of digits in reverse order.
toDigitsRev :: Integer -> [Integer]
toDigitsRev n = reverse (toDigits n)

--doubleEveryOther
-- which doubles every other number starting from the right
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther [] = []
doubleEveryOther [a] = [a]
doubleEveryOther (x:y:xs) = if (length xs)`mod`2 /= 0 then x:y*2:doubleEveryOther xs
   else x*2:y:doubleEveryOther xs

--sumDigits
-- returns the sum of all the digits
sumDigits :: [Integer] -> Integer
sumDigits xs
   | length xs == 0 = 0
   | head xs > 9 = ((head xs`mod`10) + (head xs`div`10)) + (sumDigits (tail xs))
   | head xs <=9 = (head xs) + sumDigits (tail xs)

--validate
-- takes an integer and returns True if it’s a valid credit card number and False otherwise
validate :: Integer -> Bool
validate m
   | (sumDigits (doubleEveryOther (toDigits m))) `mod` 10 == 0 = True 
   | otherwise = False





cA :: [[a]] -> a -> [[a]]
cA (x:xs) n = (x++[n]):cA xs n
cA [] _ = [] 

tD :: Integer -> [Integer] 
tD n = if n > 0 then tD (n `div` 10) ++ [n `mod` 10] else []