# Speed Duration Visualization

This repo contains the code used to create the marginal plot shown below. This scatterplot displays the critical speed (CS) and curvature constant (D') for 320 elite men and women runners, while the boxplots and density curves display the distributions of CS and D' for men and women. Boxes display the median value with 25th and 75th percentiles and whiskers display the 5th and 95th percentiles.


![speed_duration](https://github.com/user-attachments/assets/94d4c485-8556-4f90-9fc8-f11e4aaf1948)


### Brief background on the variables
The sustainable duration of running exercise is dependent upon the intensity, or speed, at which the exercise is performed. This fundamental concept is known as the speed-duration relationship, and for exercise durations of ~2–40 minutes, can be modeled by the hyperbolic equation

$$
t = \frac{D'}{S - CS} \
$$

where `t` is the performance time (s), `D'` is the curvature constant (m), `S` is the average speed (m/s), and `CS` is the critical speed (m/s). Critical speed is the fastest speed that can be sustained primarily by aerobic metabolism while still achieving a metabolic steady state. Critical speed is also a metabolic threshold such that running at speeds faster than CS will cause increased reliance on anaerobic metabolism and a greater accumulation of fatigue-inducing metabolites. For a given speed faster than CS, the time until task failure is dependent on the magnitude of D', suggesting that D' can be viewed as a fatigue buffer (or fatigue constant). 


