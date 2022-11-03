soybased <- matrix(c(46, 60, 327, 449, 1.6, 10.5, 51.5, 43.3,0,.8, 17.5, 8.1 ), ncol = 4, byrow=TRUE)
colnames(soybased) = c("Soy Milk (Imitation)", "Soy Sauce", "Soy Flour", "Soy Beans")
rownames(soybased) = c("Calories (kcal)", "Protien (g)", "Fiber (g)")
soybased

x <- soybased[1,]
y <- soybased[2,] / soybased[1,]
z <- soybased[3,] / soybased[1,]

# Make a scatter plot
rgl_init()

# Add x, y, and z Axes
label_vector <- paste0(c("Soy Milk (Imitation)", "Soy Sauce", "Soy Flour", "Soy Beans"))
rgl.bg( sphere = FALSE, fogtype = "none", color = c("white", "white"), 
        back = "lines", fogScale = 1)
plot3d(x, y, z, xlab = "Calories (kcal)", ylab = "Protien (g) Concentration per kcal", zlab = "Fiber (g) Concentration per kcal", col= "red" , type ="s", radius=5)
text3d(x, y, z, label_vector,adj=c(-0.25,0))
