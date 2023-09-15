# adaptive-cubature

*Adaptive integration of a multivariate function on an axis-aligned hyperrectangle.*

___

This package is powered by the C library [cubature](https://github.com/stevengj/cubature). 
Follow the link for details.

### Usage

```haskell
cubature :: Char                 -- ^ cubature version, 'h' or 'p'
         -> ([Double] -> Double) -- ^ integrand
         -> Int                  -- ^ dimension (number of variables)
         -> [Double]             -- ^ lower limits of integration
         -> [Double]             -- ^ upper limits of integration
         -> Double               -- ^ desired relative error
         -> IO Result            -- ^ output: integral value and error estimate
```

### Example 

```haskell
fExample :: [Double] -> Double
fExample x = exp (-0.5 * (sum $ zipWith (*) x x))

example :: IO Result -- should give 2pi ≈ 6.283185307179586
example = cubature 'h' fExample 2 [-6, -6] [6, 6] 1e-10 
-- Result {_integral = 6.283185282383672, _error = 6.280185128024888e-10}
```