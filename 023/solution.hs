import Factors
import Data.List
import qualified Data.Set as Set

sumDivisors :: Int -> Int
sumDivisors = sum . deleteLast . factors
  where deleteLast = reverse . tail . reverse

sumDivisorsUnder :: Int -> [(Int, Int)]
sumDivisorsUnder n = map (\num -> (num, sumDivisors num)) [2..(n-1)]

abundantNumsUnder :: Int -> [Int]
abundantNumsUnder n = map fst $ filter isAbundant (sumDivisorsUnder n)
  where
    isAbundant (num,sumDivs) = sumDivs > num

knownMinNeverSumOfAbundants = 28123

allAbundants :: [Int]
allAbundants = abundantNumsUnder knownMinNeverSumOfAbundants

allSumsOf2Abundants :: Set.Set Int
allSumsOf2Abundants = Set.fromList [x + y | x <- allAbundants, y <- allAbundants, x + y <= knownMinNeverSumOfAbundants]

findNotSumOfAbundants :: Int
findNotSumOfAbundants = sum $ Set.toList notSumOfAbundants
  where
    allPossibleNumbers = Set.fromList [1..knownMinNeverSumOfAbundants]
    notSumOfAbundants = allPossibleNumbers Set.\\ allSumsOf2Abundants

main = print findNotSumOfAbundants -- 29sec
