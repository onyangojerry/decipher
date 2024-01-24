import Data.Char

{-

Name(s):  Jerry Onyango
Date:  Sun Dec 03 2023

CSCI 054 - Fall 2023
Week14 problem set

-}

-- squareMod
-- takes two integers, returns the mod of the square of the first integer (remainder) divided by the second
squareMod :: Integer -> Integer -> Integer
squareMod b n = b^2 `mod` n

-- powerMod
-- takes three integers as input, returns 1 if the second input is a zero because a number to the power of 0 is just 1.
-- 1 `mod` (any number) = 1
-- if e -> even, the functionnrecursively divides e by two while utilizing the function squareMod on the result (b^(e/2))
-- if e -> odd, the above process is repeated but the result (b^(e/2)) is multiplied by b. Since the result is a big number,
-- the `mod` function makes it easier to deal with
powerMod :: Integer -> Integer -> Integer -> Integer
powerMod b e n 
   | e == 0 = 1 `mod` n 
   | e `mod` 2 == 0 = (squareMod (powerMod b (e`div`2) n) n) `mod` n
   | otherwise = (b*(squareMod (powerMod b (e`div`2) n) n))`mod`n

-- block
-- takes in two integer, utilizes the first integer to break down the second integer into chunks, returns a list
block :: Integer -> Integer -> [Integer]
block n m 
   | m < n = [m]
   | otherwise = m `mod` n : block n (m `div` n)

-- unblock
-- reverses the process that the function block does by taking an integer and a list of integers, recursively combines them to return a single integer.
unblock :: Integer -> [Integer] -> Integer
unblock n [x] = x 
unblock n (x:xs) = x + n * unblock n xs

-- messageToInteger
-- take in a string, utilizes the ord function to return a list of integers that correspond to all the letters in the string.
-- the ublock function combines the integers into a single integer
messageToInteger :: [Char] -> Integer
messageToInteger [x] = unblock 256 [fromIntegral (ord x)]
messageToInteger xs = unblock 256 (map (fromIntegral.ord) xs)

-- integerToMessage
-- takes in an integeger, utilizes the function char which returns the corresponding character of a number
integerToMessage :: Integer -> [Char]
integerToMessage n = map (chr.fromIntegral) (block 256 n)

-- rsaEncode
-- takes in a tuple containig a public key and a message which is turned into an integer first
-- utilizes the powerMode function to encrypt the message
rsaEncode :: (Integer, Integer) -> Integer -> Integer
rsaEncode (e,n) m = powerMod m e n

-- encodeString
-- uilizes five functions:
-- messageToInyteger turns string to an integer, block breaks the integer into chunk, rsaEncode encrypts each integer recursively via map function
--returning a list where which the function unblock turns into a single integer
encodeString :: (Integer, Integer) -> [Char] -> Integer
encodeString (e,n) xs = unblock n (map (rsaEncode (e,n)) (block n (messageToInteger xs)))

-- decodeString
-- reverses the process done by encoding string by taking a tuple (private key) and an integer (the result from encodingString)
-- block function breaks the integer into chunks, rsaEncode uses the public key to decrypt each integer in the list while utilizing the map function
-- unblock returns a single integer from the resulting list. integerToMessage returns the original message, the string
decodeString :: (Integer, Integer) -> Integer -> [Char]
decodeString (d,n) x = integerToMessage (unblock n (map (rsaEncode (d,n)) (block n x)))
