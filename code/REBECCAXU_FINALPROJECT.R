library(ggplot2)
library(ggpubr)

#data exploration
ggplot(smmh_82_, aes(x=GAD7)) +
  geom_histogram()
ggplot(head(smmh_82_, 18), aes(x=Screen, y=GAD7)) +
  geom_point()

# sample 18 random rows from dataframe, with pearson
ggplot(smmh_82_[sample(nrow(smmh_82_), 18), ], aes(x=Screen, y=GAD7)) +
  geom_point() + 
  labs(title="Student Anxiety and Social Media Usage", x = "Screen Time",
       y = "Modified GAD7 Score") +
  geom_smooth(method=lm) + 
  stat_cor(method = "pearson", label.x=250, label.y=7)

# sample 481 rows from dataframe, with pearson
ggplot(smmh_82_[sample(nrow(smmh_82_), 481), ], aes(x=Screen, y=GAD7)) +
  geom_point() + 
  labs(title="Student Anxiety and Social Media Usage", x = "Screen Time",
       y = "Modified GAD7 Score") +
  geom_smooth(method=lm) + 
  stat_cor(method = "pearson", label.x=250, label.y=7)

#boxplot GAD7 class vs online
boxplot(smmh_82_$GAD7, smmh_82_$GAD7c, 
          main="Student Anxiety Level", 
          xlab="Dataset Type", ylab="GAD7 Score",
        names=c("Online", "Class"))
#boxplot Screen Time class vs online
boxplot(smmh_82_$Screen, smmh_82_$Screenc, 
        main="Student Social Media Usage", 
        xlab="Dataset Type", ylab= "Screen Time in Minutes",
        names=c("Online", "Class"))

#T-tests for GAD7 and Screen Time
t.test(smmh_82_$GAD7, smmh_82_$GAD7c)
t.test(smmh_82_$Screen, smmh_82_$Screenc)