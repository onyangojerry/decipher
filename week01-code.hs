{-

Name(s):  <write names here>
Date:  <submission date>

CSCI 054 - Fall 2023
Week01 problem set

-}


-- numList n
-- returns a list of integers from n downto 1
numList :: Integer -> [Integer]
numList n =
   if n <= 0
      then []
   else
      n : (numList (n-1))


-- sumFormula n
-- returns the sum of the integers from 1 to n (using formula)
sumFormula :: Integer -> Integer
sumFormula n = round ( (fromIntegral n) * (fromIntegral (n+1)) / 2.0 )


-- sumList n
-- returns the sum of the integers from 1 to n (recursively)
sumList :: Integer -> Integer
sumList n =
   if n <= 1
      then 1
      else
         n + sumList (n-1)

-- sumCheck 
-- returns True if sumFormula and sumList return the same value;
--   returns False otherwise
sumCheck :: Integer -> Bool
sumCheck n  =
   if sumList n == sumFormula n then True else False


-- min3
-- takes a tuple containing 3 numbers and returns the smallest number
min3 :: (Ord a) => (a, a, a) -> a
min3 (x,y,z) = 
   min x (min y z)
   -- type signature (Ord a) => (a, a, a) makes sure the elements in the input 
   --tuple are of the same type and the output as well. Ord ensures the elements
   --are of the class order



-- revision mode:
nList :: Integer -> [Integer]
nList n 
   |n == 0 = [n]
   |n==1=[1]
   |n>1=[n] ++ nList (n-1)

sumL :: [Integer] -> Integer
sumL [] = 0
sumL [x]= x 
sumL xs = head xs + sumL (tail xs)


repeatE :: (Eq a) => a -> [a] -> [a] 
repeatE n xs 
   |length xs == 0 = []
   |n == head xs = head xs: head xs: repeatE n (tail xs)
   |otherwise = head xs: repeatE n (tail xs)


mult :: Integer -> [Integer] -> [Integer] 
mult n xs 
   |length xs == 0 = []
   |n == 0 = xs
   |n>0= head xs:head xs : mult (n-1) (tail xs)


multi :: Integer -> [Integer] -> [Integer]
multi n xs = concat [replicateN n x | x <- xs]
  where
    replicateN 0 _ = []
    replicateN m y = y : replicateN (m - 1) y

