#Clinical Trials of cancer treatment

outcomes <- matrix(c(23, 21, 5.6), ncol = 3, byrow = TRUE)
colnames(outcomes) =c("Exemestane", "Enzalutamide/ Fulvestrant", "Nivolumab/Cabozantinib" )
outcomes

# Dietary prevention of cancers in cruciferous vegitables. 100 Grams
cruciferous = matrix(c(34, 43, 16, 25, 11, 28, 49, 25, 38, 25, 27, 32, 148, 141, 24, 80, 71, 35, 200, 60, 41, 25, 103, 58), ncol =12, byrow = TRUE )
colnames(cruciferous) = c("Broccoli", "Brussel Sprouts", "Radishes", "Cauliflower", "Watercress", "Turnips", "Kale", "Cabbage", "Rutabega", "Arugula", "Kohlrabi", "Collard Greens")
rownames(cruciferous) = c("Calories", "Vitamin C")

plot(cruciferous[1,], cruciferous[2,], xlab = "Calories", ylab="Vitamin C")
text(cruciferous[1,], cruciferous[2,], labels = c("Broccoli", "Brussel Sprouts", "Radishes", "Cauliflower", "Watercress", "Turnips", "Kale", "Cabbage", "Rutabega", "Arugula", "Kohlrabi", "Collard Greens"))

avg = cruciferous[2,] / cruciferous[1,]
plot(avg, xlab = "Calorie", ylab = "Concentration")
text(avg, labels = c("Broccoli", "Brussel Sprouts", "Radishes", "Cauliflower", "Watercress", "Turnips", "Kale", "Cabbage", "Rutabega", "Arugula", "Kohlrabi", "Collard Greens"))
model <- lm(cruciferous[1,]~cruciferous[2,])
summary(model)
abline(lm(cruciferous[1,]~cruciferous[2,]), col="red")

# Dietary prevention of cancers in umbelliferous vegitables. 100 Grams
umbelliferous = matrix(c(41, 43, 375, 36, 16706, 687, 1270, 8424 ), ncol = 4, byrow=TRUE)
colnames(umbelliferous) = c("Carrots", "Dill", "Cumin", "Parsley")
rownames(umbelliferous) = c("Calories", "Vitamin A")
umbelliferous
u_calories = umbelliferous[1,]
u_vitamin_a = umbelliferous[2,]
u_avg = u_vitamin_a / u_calories
plot(u_avg, xlab="Calorie", ylab = "Concentration of Vitamin A")
text(u_avg, labels = c("Carrots", "Dill", "Cumin", "Parsley"))

# Most common contributor to tumor growth
all_foods <- read_excel("Projects/Cancer Analysis/Untitled spreadsheet.xlsx")
c <- as.list(strsplit(as.character(all_foods), split = ", ")[[2]])

# Optimal consumption of soy based products
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
