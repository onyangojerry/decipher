{-

Name(s):  Jerry Onyango, Elsie Okon
Date:  <Sept 10, 2023>

CSCI 054 - Fall 2023
Week02 problem set

-}


-- cube n
-- returns n^3
cube :: (Num a) => a -> a
cube n = n * n * n

-- tak (x,y,z)
-- returns large integer
tak :: (Int,Int,Int) -> Int
-- this is not the correct translation of the function described
-- in the problem set
-- tak (x, y, z) = if x <= y then y else tak (x - 1, y-1, z-1)
tak (x, y, z) = if x <= y
  then y
  else tak (tak (x - 1, y, z), tak(y-1,z,x), tak(z-1,x,y))


-- List Compehension

-- cubeAll [x]
-- takes a list of integers and returns a list of the integers cubed
cubeAll :: [Int] -> [Int]
-- tzuyi: cubeAll of empty list should be an empty list, but also
--   don't need to use pattern matching
-- cubeAll [] = error "empty list sorry"
cubeAll xs = [cube n | n <- xs]

--lengthPairs [xs]
-- takes a list of integers as input and returns a list of tuples of element and its length
lengthPairs :: [String] -> [(String, Int)]
-- tzuyi: don't need following line
--    lengthPairs [] = error "empty list"
lengthPairs xs = [(x, length x) | x <- xs]


-- List Recursion

--myLength [x]
-- takes a list as input and return the length of the list
myLength ::[a] -> Int
-- tzuyi: length of an empty list is 0.  additionally this does
--   not use list recursion!
-- myLength [] = error "empty list"
myLength xs = length xs

-- duplicate [x]
-- takes a list of elements and returns a list of the elements doubled
duplicate :: [a]-> [a]
-- tzuyi: on an empty list should return empty list, not give an error
duplicate [] = []
-- duplicate [] = error "empty List"
duplicate [x] = [x,x]
duplicate (x:xs) = x: x : duplicate xs

-- lessThanAll [x]
-- takes a number and a list of numbers as input and returns all True if all numbers in the list are less than the number
lessThanAll :: (Ord a) => a -> [a] -> Bool
lessThanAll a [] = True
lessThanAll a [x] = if a < head [x] then True else False
lessThanAll a (x:xs) = a < x && lessThanAll a (xs)

dup :: [a] -> [a] 
dup [] = []
dup xs = [head xs] ++ [head xs]++ dup (tail xs) 







maxn :: (Ord a) => (a,a,a) -> a 
maxn (x,y,z) = max x (max y z)


cA :: [Integer] -> [Integer]
cA [x] = [x*x*x]
cA (x:xs) = [x*x*x] ++ cA xs

lP :: [String] -> [(String, Int)] 
lP xs = [(x, length x) | x <- xs]


les :: Integer -> [Integer] -> Bool
les n [] = True
les n xs = if n< head xs then les n (tail xs) else False
