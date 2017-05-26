Auto Insurance Expert System

Created an expert system in Jess that computes the auto insurance premium based on the following knowledge:
A perfect driver (a driver with no risk) spends about $700 a year for a standard coverage. An individual’s insurance premium may be higher depending on the various risk factors explained in the following rules:
2. If a driver is 18 or younger or 75 or older then her age-risk-factor is 5%, otherwise the age-risk-factor is 0.
3. If the car costs less than or equal to $5000, then the price-factor is 0. If it costs between $5000-$20000, then the price-risk-factor is 5% and if it costs over $20000 then the price-risk-factor is 10%.
4. If the driver commutes less than or equal to 20 miles to work then her commute-risk-factor is 0, if she commutes somewhere between 20-50 miles then her commute-risk-factor is 2%, otherwise, her commute-risk-factor is 5%.
5. If the driver had accumulated less than or equal to 10 offense points in her deriving record then her offense-risk-factor is 0, if her accumulated points is anywhere between 10-20 points then her offense-risk-factor is 2% if she went over 20 offense points then her offense-risk-factor is 10%
6. If the driver has a good credit score (over 700 points) then her credit-risk-factor is 0. If her credit score is between 600-700 points, then her credit-risk-factor is 2%, otherwise if her credit score is less than or equal to 600, her credit-risk-factor is 5%.
7. The total-average-risk of a driver is computed as:
(age-risk-factor + price-risk-factor + commute-risk-factor + offense-risk-factor +credit-risk-factor ) / 5
8. The insurance premium of a driver is computed as:
700 * (1+ Total-average-risk)
