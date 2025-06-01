# Shapiro-Wilk test for normality by group
by(data$Log_CFU, data$Temperature, shapiro.test)

# Q-Q plots
par(mfrow=c(1,3))
for (temp in levels(data$Temperature)) {
  qqnorm(data$Log_CFU[data$Temperature == temp], main=paste("Q-Q Plot for", temp))
  qqline(data$Log_CFU[data$Temperature == temp])
}


# Install and load car package if needed
if (!require(car)) install.packages("car")
library(car)

# Levene's test
leveneTest(Log_CFU ~ Temperature, data=data)


# Perform ANOVA
anova_model <- aov(Log_CFU ~ Temperature, data=data)
summary(anova_model)


# Tukey HSD test
TukeyHSD(anova_model)



library(ggplot2)

# Plot means with error bars
ggplot(data, aes(x=Temperature, y=Log_CFU, fill=Temperature)) +
  stat_summary(fun=mean, geom="bar") +
  stat_summary(fun.data=mean_se, geom="errorbar", width=0.2) +
  labs(title="Mean Microbial Growth by Storage Temperature",
       y="Log CFU/g", x="Storage Temperature (°C)") +
  theme_minimal()