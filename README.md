# Chi-MP-data-story
This is intended to be a public repo that uses the HRDAG/US-II-MP missing persons database as an input to a brief series of Jupyter notebooks, covering various themes that make up the data story behind missing persons reports in Chicago, IL..

## Topics

### What is an event?
- Primary: TRT
Goal: To start a discussion of the data story behind missing persons reports, it behooves us to define the basic unit of the thing we're talking about. What info must we have to 'observe' a missing person report?

At HRDAG, we typically design a dataset around the question "Who did what to whom?" However, these records don't include perpetrators, so we're going to modify this to "Who was last seen where?" This means we should have at least:
- date last seen (AKA date occurred)
- location last seen (AKA address)
- some details on the person (this will be covered as its own topic)

##### person identifiers & the `rd` field
When the Chicago Police Department is made aware of a report of a missing person, policy dictates that an officer goes to the scene (or takes a call in the station?) and verifies whether the report is a "Bona Fide" missing persons case. If it is, the officer is meant to generate a Missing Person Incident Report for each individual involved.

Importantly, each Incident Report created by CPD has its own `rd` or record number, which can be treated as a unique identifier for each unique person in the event - _if it's true that only one person was described in the Incident Report._ As we go through the records shared by CPD, we observe a couple dozen reports between 1 January 2000 and 31 December 2021 for which it appears this is not the case.

For example, `rd_no` 'JA172886' has the same last seen date and last seen location in several rows of data, but the person details describe two distinct individuals:
* Person A is a 32 year old person born in 1985, no race documented
* Person B is a 22 year old Black person born in 1995
If we were to look only at this data and speculate about possible explanations, we could imagine that an officer got some poor or incomplete information initially, and later received new information about the case and updated the incident to describe the correct individual. Maybe the initial filing had typos in the age and birth year, and those were updated accurately. In either case, one of those persons described is not a real MP, and we should disregard those records.

Alternatively, if we do not assume that policy is always followed, then we can believe that this is an example of a record number being assigned to more than one missing person. But we want to be more scientific about this process than a simple guess, so to follow up on our theory, we submitted FOIA requests for a sample of the `rd_no`s where we believed more than one human was described in the same Incident Report, including JA172886. 
In the case of JA172886, there is a handwritten Incident Report including a narrative field, as well as a digital Supplementary Incident Report. In the narrative and digital records, two distinct humans are described as the subjects of the investigation. One is a 32 year old female with no documented race and the other is a 22 year old Black female. 
##### date occurred
- talk about date last seen, date occurred
- **does the number of reports change in the two decades we observe?** frequency of reports overtime

##### location
- talk about last seen location, address, beat (or district) occurred
- **do certain areas of Chicago have more missing persons reports than others?** cross beat occurred with monthly counts of new rdnos
<F13><F12>
### What happens as a result of the event?
- Primary: BP

##### date officer arrived
- talk about date officer arrived
- what do we expect it to mean based on policy
- what have we been told it can mean thru interviews
- what do we notice about it
- **do officers respond quicker or more often to certain areas of Chicago?** cross beat occurred and missing date officer arrived

##### notification time
- talk about notification time
- what do we expect it to mean based on policy
- what have we been told it can mean thru interviews
- what do we notice about it
- **does the MP section ever know about a case before an officer arrives?** how often does this happen? what are possible explanations?

##### closed date
- talk about last update, status update, closed date
- what do we expect it to mean based on policy
- what have we been told it can mean thru interviews
- what do we notice about it
- DTA1, 2, 3

##### beat assigned
- talk about beat occurred, beat assigned
- what have we been told about beat numbers or officer deployment in interviews

### Who is described in the event?
- Primary: LB

### What and Who is not represented?
- Primary: TS

### Naming Names: Detectives and (Still) Missing Persons
- Primary: BP

### What else did we observe?
- Primary: None atm

### Summary
- 
