### This Repo contains exercises from the books below:  

+ #### Haskell Programming from the first principles - Christopher Allen & Julie Moronuki
+ #### Haskell Programming By Prof Graham Hutton



Fibonacci Sequance in Haskell λ :heart:
```Haskell
fib = 1 : 1 :[a+b|(a,b)<- zip fib(tail fib)]
```