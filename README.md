# Reproducible research: version control and R

Question 4:
- A script for simulating a random_walk is provided in the `question-4-code` folder of this repo. Execute the code to produce the paths of two random walks. What do you observe? (10 points)
   - The two paths are different, both starting and ending in different places. The line on both graphs is jagged because there are lots of abrupt turns. Both graphs have a mix of periods where the line is going in one direction, and periods with many turns in sequence. Every time the code is executed, the paths are different. The values on the axis of the graphs are different. Both graphs show a time period of '500'

- Investigate the term **random seeds**. What is a random seed and how does it work? (5 points)
   - The random number generation in R is done by a pseudo random number generator, which means that its not truly random. Instead, there is a massive but finite number of different patterns of numbers that can be generated. A random seed sets the starting conditions for a pattern to be generated, and so if you use the same random seed/starting conditions every time, you will get the same pattern/numbers generated. Using the same random seed allows you to reproduce the same results from a code containing random number generation every time.
 
- Edit the script to make a reproducible simulation of Brownian motion. Commit the file and push it to your forked `reproducible-research_homework` repo. (10 points)

- Go to your commit history and click on the latest commit. Show the edit you made to the code in the comparison view (add this image to the **README.md** of the fork). (5 points)
   - ![image](https://github.com/MatNoble1/reproducible-research_homework/assets/147311707/a327fd43-bf18-4012-bdcf-760c08eb3b47)

Question 5:
- Import the data for double-stranded DNA (dsDNA) viruses taken from the Supplementary Materials of the original paper into Posit Cloud (the csv file is in the `question-5-data` folder). How many rows and columns does the table have? (3 points)
 - 13 columns, 34 rows (including the column headers)
   
- What transformation can you use to fit a linear model to the data? Apply the transformation. (3 points)
   - Logging both the x and y axis
     
- Find the exponent ($\alpha$) and scaling factor ($\beta$) of the allometric law for dsDNA viruses and write the p-values from the model you obtained, are they statistically significant? Compare the values you found to those shown in **Table 2** of the paper, did you find the same values? (10 points)
   - beta = 0.12172, alpha = 0.4708 (working out is in Transforming_data)
   - p value for intercept = 0.00753, p value for gradient/log(virion_volume_nm_nm_nm) = 6.44e-10
   - Both p values are statisctically significant at a significance level of 0.01
   - Both of my values are completely different to those in the table, the exponent (alpha) is more similar, but the scaling factor (beta) is highly different
 
- Write the code to reproduce the figure shown below. (10 points)
   - Contained in Transforming_data

  <p align="center">
     <img src="https://github.com/josegabrielnb/reproducible-research_homework/blob/main/question-5-data/allometric_scaling.png" width="600" height="500">
  </p>

- What is the estimated volume of a 300 kb dsDNA virus? (4 points)
  - I obtained two different estimates, one based on the Allometric exponent and Scaling factor in linked the paper (6884014.616 nm3), and one based on the Allometric 
  exponent and Scaling factor that I worked out (1.785 nm3). Working out is contained in Tranforming_data

- Explain the difference between reproducibility and replicability in scientific research. How can git and GitHub be used to enhance the reproducibility and replicability of your work? what limitations do they have? (e.g. check the platform [protocols.io](https://www.protocols.io/)).
  
  - The terms reproducibility and replicability don't have set definitions and some researchers use them to mean different things, however the most common distinction I found between them was that reproducibility is taken to mean being able to produce the same results using the same data and method that the original researcher used, while replicability is the ability to produce the same results when the entire experimentla process is replicated (new data is collected and a new method/code is created).
 
  Git and GitHub play highly important roles in increasing reproducibility and replicability of science by providing version control, allowing you to go back and look at every past version of your work throughout a project. This allows you to find important information such as the code or data used to produce a specific figure that may be published somewhere, even if you have since changed your code/data, so that you or others can check your work to ensure that it is reproducible and replicable. Additionally, one important feature of GitHub is that it allows several people to collaborate on a project and propose changes to the project in a way that they can be checked and understood before they are approved, instead of changes being made by one member of a group that no one else has noticed or that overwrite someone else's work. This allows all changes being made by a groupt o a piece of work to be tracked, and facilitates easy location of previous versions of the work. GitHub repositories can also 
be archived on Zenodo for long term storage so that they cna be re-accessed and results can be reproduced/replicated a long time after the original work was completed.

There are some drawbacks to Git and GitHub however. GitHub can be hard to navigate for beginners and when a large number of files are stored in a repository it can get very hard to work out what they are all for very quickly. Additionally, it can be ard to locate relevant repositories on GitHub without having a direct link to them. Other platforms such as protocols.io are much easier to navigate and find publications relevant to your research. GitHub also mainly provides a platform to upload and alter datasets and code used within a project, the rest of the information needed for reproducibility and replicability such as a full methods wakthrough for parts of the research such as fieldwork are often found elsewhere.

## Instructions

The homework for this Computer skills practical is divided into 5 questions for a total of 100 points (plus an optional bonus question worth 10 extra points). First, fork this repo and make sure your fork is made **Public** for marking. Answers should be added to the # INSERT ANSWERS HERE # section above in the **README.md** file of your forked repository.

Questions 1, 2 and 3 should be answered in the **README.md** file of the `logistic_growth` repo that you forked during the practical. To answer those questions here, simply include a link to your logistic_growth repo.

**Submission**: Please submit a single **PDF** file with your candidate number (and no other identifying information), and a link to your fork of the `reproducible-research_homework` repo with the completed answers. All answers should be on the `main` branch.

## Assignment questions 

1) (**10 points**) Annotate the **README.md** file in your `logistic_growth` repo with more detailed information about the analysis. Add a section on the results and include the estimates for $N_0$, $r$ and $K$ (mention which *.csv file you used).
   
2) (**10 points**) Use your estimates of $N_0$ and $r$ to calculate the population size at $t$ = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth? 

3) (**20 points**) Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the **README.md** file so it can be viewed in the repo homepage.
   
4) (**30 points**) Sometimes we are interested in modelling a process that involves randomness. A good example is Brownian motion. We will explore how to simulate a random process in a way that it is reproducible:

   - A script for simulating a random_walk is provided in the `question-4-code` folder of this repo. Execute the code to produce the paths of two random walks. What do you observe? (10 points)
   - Investigate the term **random seeds**. What is a random seed and how does it work? (5 points)
   - Edit the script to make a reproducible simulation of Brownian motion. Commit the file and push it to your forked `reproducible-research_homework` repo. (10 points)
   - Go to your commit history and click on the latest commit. Show the edit you made to the code in the comparison view (add this image to the **README.md** of the fork). (5 points)

5) (**30 points**) In 2014, Cui, Schlub and Holmes published an article in the *Journal of Virology* (doi: https://doi.org/10.1128/jvi.00362-14) showing that the size of viral particles, more specifically their volume, could be predicted from their genome size (length). They found that this relationship can be modelled using an allometric equation of the form **$`V = \beta L^{\alpha}`$**, where $`V`$ is the virion volume in nm<sup>3</sup> and $`L`$ is the genome length in nucleotides.

   - Import the data for double-stranded DNA (dsDNA) viruses taken from the Supplementary Materials of the original paper into Posit Cloud (the csv file is in the `question-5-data` folder). How many rows and columns does the table have? (3 points)
   - What transformation can you use to fit a linear model to the data? Apply the transformation. (3 points)
   - Find the exponent ($\alpha$) and scaling factor ($\beta$) of the allometric law for dsDNA viruses and write the p-values from the model you obtained, are they statistically significant? Compare the values you found to those shown in **Table 2** of the paper, did you find the same values? (10 points)
   - Write the code to reproduce the figure shown below. (10 points)

  <p align="center">
     <img src="https://github.com/josegabrielnb/reproducible-research_homework/blob/main/question-5-data/allometric_scaling.png" width="600" height="500">
  </p>

  - What is the estimated volume of a 300 kb dsDNA virus? (4 points)

**Bonus** (**10 points**) Explain the difference between reproducibility and replicability in scientific research. How can git and GitHub be used to enhance the reproducibility and replicability of your work? what limitations do they have? (e.g. check the platform [protocols.io](https://www.protocols.io/)).
