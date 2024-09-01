# Speed Duration Marginal Plot

The sustainable duration of running exercise is dependent upon the intensity, or speed, at which the exercise is performed. This fundamental concept is known as the speed-duration relationship, and for exercise durations of ~2–40 minutes, can be modeled by the hyperbolic equation:

$$
t = \frac{D'}{S - CS} \
$$

where `t` is the performance time (s), `D'` is the curvature constant (m), `S` is the average speed, and `CS` is the critical speed.


This repo contains the code used to create a marginal plot that displays the two parameters for elite men and women runners. The scatterplot displays the CS and D' for individual runners, while the boxplots and density curves display the distributions of CS and D' for men and women. Boxes display the median value with 25th and 75th percentiles and whiskers display the 5th and 95th percentiles. 

