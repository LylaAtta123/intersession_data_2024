data("ChickWeight")
class(ChickWeight)
head(ChickWeight)
dim(ChickWeight)
table(ChickWeight$Diet)

plt5 <- ggplot(data = ChickWeight) +
  geom_point(mapping = aes(x=Time, y=weight, color = Diet)) +
  scale_color_viridis(discrete = TRUE) +
  labs(title = "Weight of Chicks Over Time", x = "Number of Days Since Birth", y = "Body Weight (gm)", color = "Diet") +
  theme_classic()

plt5

#saving the figure
png("chick_weight.png", width = 1000, height = 500)
plt5
dev.off()

###DATA ANALYSIS###
#perform t test to see if statistically significant difference between body weights in diet 1 vs diet 4

Diet1 <- ChickWeight %>% filter(Diet == "1")
Diet4 <- ChickWeight %>% filter(Diet == "4")

t.test(Diet1$weight, Diet4$weight, alternative = "two.sided")

#p-value is 1.685e-05 < .05, so the means are statistically different

###plotting diets 1 and 4###
diets <- ChickWeight %>% filter(Diet %in% c("1", "4"))

plt6 <- ggplot(data = diets) +
  geom_point(mapping = aes(x = Time, y = weight, color = Diet)) +
  scale_color_viridis(discrete = TRUE) +
  labs(title = "Weight of Chicks Over Time", x = "Number of Days Since Birth", y = "Body Weight (gm)", color = "Diet") +
  theme_classic()

plt6

png("chick_weight_diets.png", width = 1000, height = 500)
plt6
dev.off()
