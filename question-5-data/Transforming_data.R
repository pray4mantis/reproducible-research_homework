library(ggplot2)
library(janitor)
library(simplr)

#Loading in dataset
data <- Cui_etal2014

#Altering the dataset names so they're easier to code with
data1 <- clean_names(data)
data1

#Plotting the data as it is
ggplot(data1, aes(virion_volume_nm_nm_nm, genome_length_kb))+
  geom_point()

#transforming the axes to get a linear relationship
ggplot(data1, aes(x = log(virion_volume_nm_nm_nm), y = log(genome_length_kb)))+
  geom_point()

#Compare the two models to see which is better
model1 <- lm(genome_length_kb ~ virion_volume_nm_nm_nm, data = data1)
plot(model1)

model2 <- lm(log(genome_length_kb) ~ log(virion_volume_nm_nm_nm), data = data1)
plot(model2)
#These plots indicate model 2 is a better linear model

#Get equation of linear model
summary(model2)
#So equation is log(V) = 0.4708log(L) - 2.106
#Simplify this to the form V = betaL^alpha
# V = exp(0.4708log(L) - 2.106)
# V = (exp(log(L)^0.4708)) x (exp^- 2.106)
# V = (L^0.4708) x (exp^- 2.106)
# V = 0.12172L^0.4708
#beta = 0.12172, alpha = 0.4708

#Creating a graph of log(genome length) against log(virion volume)
ggplot(data1, aes(x = log(virion_volume_nm_nm_nm), y = log(genome_length_kb)))+
  geom_point()+
  geom_smooth(method = "lm")+
  ylab('log [Virion volume (nm3)')+
  xlab('log [Genome length (kb)]')

#Predict volume of a 300 kb dsDNA virus based on Allometric exponent and Scaling factor in the paper
#V = betaL^alpha
#V = 1,182 x (300^1.52)
#V = 6884014.616 nm3

#Predict volume based on my alpha and beta
#V = betaL^alpha
#V = 0.12172 x (300^0.4708)
#V = 1.785 nm3
