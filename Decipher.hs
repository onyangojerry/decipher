import Data.Char

{-

Name:Jerry Onyango
Date:  <09/24/23>

-}

-- sanitize
-- This function takes a list of characters and returns a new list such that all characters other
-- han blanks and letters have been removed and in which all letters have been shifted to uppercase.
sanitize :: [Char] -> [Char]
sanitize a = map toUpper (filter (\y -> ord y == 32 || (ord y <= 90) && (ord y >= 65) || (ord y <= 122) && (ord y >= 97)) a)


-- caesar
-- This function takes an integer and a string and encodes the string using the shift value specified by the integer.
-- It does this by mapping the helper function, helpCaesar x number of times (if x is negative then it calls it (x + 27) times.
caesar :: Int -> [Char] -> [Char]
caesar x y 
 | x < 0 = caesar (x + 27) y
 | x > 27 = caesar (x - 27) y
 | x == 0 = y
 | otherwise = caesar (x - 1) (map helpCaesar (sanitize y))


--helpCaesar
-- This helper function takes a capitol letter and returns the capitol letter that immediately follows it in the alphabet.
-- The only exception to this that if the input is 'Z', then it returns ' ' and if the input is ' ', then it returns 'A'.
helpCaesar :: Char -> Char
helpCaesar b 
 | (ord b >= 65) && (ord b <= 90) = if b == 'Z' then ' ' else chr ((ord b) + 1)
 | b == ' ' = 'A'
 | otherwise = error "Input not a capitol letter or space!"


-- keepFirst
-- This function takes a list and returns a filtered list with only the first occurance of each element.
-- In other words, it eliminates duplicates.
keepFirst :: (Eq a) => [a] -> [a]
keepFirst a 
 | length a == 0 = []
 | (last a) `elem` (init a) = keepFirst (init a)
 | otherwise = keepFirst (init a) ++ [(last a)]


-- subst
-- This function that takes a string which is a pangram and returns a list of tuples. Each tuple will specify
-- one substitution in the cipher such that you can use it as a map or key to encode/decode a message.
subst :: String -> [(Char, Char)]
subst x 
 | length a == 0 = []
 | length a == 1 = [(' ', head a)]
 | otherwise = (['A'..'Z']!!(27 - (length a)), (head a)) : subst (tail a)
  where a = (keepFirst x)


-- substEncipher
-- This function takes a pangram string as the first parameter and a plaintext message as the second. 
-- It uses the pangram and subst to create a key/map in the form of a list of tuples and it encodes the 
-- plaintext message with this map/key to return an encrypted string. 
substEncipher :: String -> String -> String
substEncipher a b 
 | length (sanitize b) == 0 = ""
 | head (sanitize b) == ' ' = snd (last x) : substEncipher a (tail (sanitize b))
 | otherwise = snd (x !! (((ord (head (sanitize b))) `mod` 65))) : substEncipher a (tail (sanitize b))
  where x = (subst (keepFirst (sanitize a)))


-- substDecipher
-- This function undoes what substEncipher did. It takes a pangram string as the first parameter and an
-- encoded message as the second. It uses subst to recreate the key/map used to encode the message and
-- uses this to return the original message. It does this by calling a helper function on each of the
-- characters in the encoded message one at a time.
substDecipher :: String -> String -> String
substDecipher a b 
 | length (sanitize b) == 0 = ""
 | otherwise = substDecipherHelper (head(sanitize b)) x : substDecipher a (tail b)
 where x = (subst (keepFirst (sanitize a)))


-- substDecipherHelper
-- This function is a helper function for dubstDecipher that takes a character and a list of tuples which is a map/
-- key used to transform the character back to its original character. It returns this value in the form of a Char.
substDecipherHelper :: Char -> [(Char, Char)] -> Char
substDecipherHelper a b
 | a == snd (head b) = fst (head b)
 | otherwise = substDecipherHelper a (tail b)
