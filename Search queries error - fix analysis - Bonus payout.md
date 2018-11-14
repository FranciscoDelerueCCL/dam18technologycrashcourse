# Analysis on the fix of the Search queries error and consequence team bonus payout



--------

### Context

Clients are complaining that the searches for a destination sometimes fail.
The development team has being working on a fix during the month of August 2018.
The subject of this analysis is to measure the effectiveness of such fix and advice on the consequent bonus payout for the team.

### Some considerations

Please take into account the following
- Data from Barcelona as destination is considered as representative of the entire population.
- Error rate is defined as number of queries with error over the total number of queries
- No clear day identified as the day the fix was implemented in production, so it is consider as a ongoing development (or series of developments) occurring during the entire month of August.
- On the 18th August an huge increase in queries in error takes place (+272% regarding the previous day). This could be considered as an outlier, if the rootcause is identified to be of any other source, not having such insights it is consider in our analysis.

#### Main KPIs:

Average Error Rate in August = 1,53 %
Average Error Rate in September = 1,03 %
**Variation of error rate = -32 %**

### Conclusion

In September, after the fix implementation, the error rate drops around 32%.
The effectiveness of the fix may be determined as the variation of error rate, so being 32%.
**As the fix did not solve all the search queries errors, the full payout of the bonus may not be justified, we do recommend to pay it proportionally to the effectiveness of the fix.**
**The team bonus should be 32% of the agreed total amount of the bonus.**

### Further analysis

For further analysis, the following may be consider:
- Release date of fix (or series of developments) should be taken into account. This would allow us to better analyze the pre and post behaviour of the system, and also better determine the error rate to each time period.

### Attachments

Table with: Day	SUM de queries/correct	SUM de queries/error	SUM de users	Date	Queries error rate


