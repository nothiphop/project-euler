-- https://projecteuler.net/problem=19

allDays :: ((Int,Int,Int),(Int,Int,Int)) -> [(String, Int)]

isMondayOnFirst :: (String, Int) -> Bool
isMondayOnFirst ("Monday",1) = True
isMondayOnFirst _ = False

countSundaysOnFirst :: ((Int,Int,Int),(Int,Int,Int)) -> Int
countSundaysOnFirst (from,to) = length (filter isMondayOnFirst allDays(from, to))

-- countSundaysOnFirst ((1,1,1991),(31,12,200))
