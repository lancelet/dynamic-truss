module Main where

import qualified Data.Vector.Storable as V

-- Input data

data Material
    = Material
    { youngsModulus :: Float
    , density       :: Float
    , cMass         :: Float
    , cStiffness    :: Float
    }

data Elem
    = Elem
    { n1       :: Int       -- first node
    , n2       :: Int       -- second node
    , area     :: Float     -- cross-sectional area
    , material :: Material  -- material properties
    }

data Node
    = Node
    { px :: Float
    , py :: Float
    }

data DOFDirichlet
    = Fixed
    | Free
data BC
    = BC
    { bcNode :: Int
    , bcx    :: DOFDirichlet
    , bcy    :: DOFDirichlet
    }

data Force
    = Force
    { force :: Float -> Float  -- force as a function of time
    }

data Truss
    = Truss
    { nodes    :: V.Vector Node
    , elements :: V.Vector Elem
    }

data ElemState
    = ElemState
    { residualStress :: Float
    }

data ElemDerived
    = ElemDerived
    { k11 :: Float
    , k12 :: Float
    , k22 :: Float
    , c11 :: Float
    , c12 :: Float
    , c22 :: Float
    }

data NodeStatic
    = NodeStatic
    { mass :: Float
    }

data NodeState
    = NodeState
    { ux :: Float  -- x displacement from px
    , uy :: Float  -- y displacement from py
    , vx :: Float  -- x velocity
    , vy :: Float  -- y velocity
    }

main :: IO ()
main = do
    putStrLn "Hello world"
