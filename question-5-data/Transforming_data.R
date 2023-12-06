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
model1 <- lm(virion_volume_nm_nm_nm ~ genome_length_kb, data = data1)
plot(model1)


model2 <- lm(log(virion_volume_nm_nm_nm) ~ log(genome_length_kb), data = data1)
plot(model2)
#These plots indicate model 2 is a better linear model

#Get equation of linear model
summary(model2)
#So equation is log(V) = 1.5152log(L) + 7.0748
#Simplify this to the form V = betaL^alpha
# V = exp(1.5152log(L) + 7.0748)
# V = (exp(log(L)^1.5152)) x (exp^7.0748)
# V = (L^1.5152) x (exp^7.0748)
# V = 1181.8071L^1.5152

#beta = 1181.8071, alpha = 1.5152

#Creating a graph of log(genome length) against log(virion volume)
ggplot(data1, aes(x = log(genome_length_kb), y = log(virion_volume_nm_nm_nm)))+
  geom_point()+
  geom_smooth(method = "lm")+
  ylab('log [Virion volume (nm3)]')+
  xlab('log [Genome length (kb)]')

#Predict volume of a 300 kb dsDNA virus
#V = betaL^alpha
#V = 1,182 x (300^1.52)
#V = 6884014.616 nm3