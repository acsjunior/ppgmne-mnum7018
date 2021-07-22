library(MASS)

help(fitdistr)


# Simula do modelo e estima por máxima verossimilhança.
y <- rweibull(n = 150, shape = 3, scale = 10)

mle <- MASS::fitdistr(x = y, densfun = "weibull")
mle

str(mle)

# Escala da densidade (ruim).
plot(density(y, from = 0))
curve(dweibull(x,
               shape = mle$estimate["shape"],
               scale = mle$estimate["scale"]),
      add = TRUE, col = "red")

# Escala da acumulada (melhor).
plot(ecdf(y))
curve(pweibull(x,
               shape = mle$estimate["shape"],
               scale = mle$estimate["scale"]),
      add = TRUE, col = "red")