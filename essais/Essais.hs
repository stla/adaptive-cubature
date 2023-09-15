import Numerical.Cubature

fun :: [Double] -> Double
fun tt = 
  let t = tt !! 0 
  in
    8 * cos(2*t/(1-t)) / (64*(1-t)**2 + t**2)

example :: IO Result
example = cubature 'h' fun 1 [0] [1] 1e-4 

value :: Double -- approx 1.7677e-7
value = exp (-6) * pi / (2 * exp 10)


fun' :: [Double] -> Double
fun' tt = 
  let t = tt !! 0 
  in
    6 * cos(2*t/(1-t)) / (36*(1-t)**2 + t**2)

example' :: IO Result
example' = cubature 'h' fun' 1 [0] [1] 1e-4

value' :: Double -- approx 9.6513e-6 
value' = exp (-6) * pi / (2 * exp 6)