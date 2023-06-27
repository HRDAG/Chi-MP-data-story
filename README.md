# Chi-MP-data-story
This is intended to be a public repo that uses the HRDAG/US-II-MP missing persons database as an input to a brief series of Jupyter notebooks, covering various themes that make up the data story behind missing persons reports in Chicago, IL..

# dataset
The dataset used in this repo is an export from a private parent repo, HRDAG/US-II-MP, which takes a collection of documents received through FOIA requests as input and builds a formatted table to use for analysis. As the investigation is ongoing, the data in that parent repo continues into 2023 and includes an expanding list of features, but here we limit the dataset to 1 January 2000 - 31 December 2022 and features we intend to include in analysis.

# Topics

### 1. What is an event?
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

### 2. What happens as a result of the event?
- Primary: TRT

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

##### UCR code?
- what is the UCR code for?
- what are the circumstances around it changing?

### 3. Who is described in the event?
- Primary: LB

##### demographic breakdown
- race, sex, age (recommend using age group instead of age)
- note the number of reports representing tender age children, especially those under 1 year
- how do the rates of reported missings change overtime for different demographic groups?

##### relation to missing
- who is described by this field
- BP thinks there's a canonicalize script for this field to help simplify the values that isn't currently being applied but could be

##### missing together
- how many observations of multiple assigned the same rdno do we have? (look at the hand fix file in the cleaning task for the manually identified sample)
- how many other incidents of multiple missing persons do we estimate? (assess the number of correctly split records that share date occurred and location and are not just dupes)

- could tie in previously_missing, occupation, and other available fields

### 4. What and Who is not represented?
- Primary: TS

- rates of missingness for each feature
- comments on
    * the implications of different examples of missingness
    * potential explanations for the observed missingness
    * acceptable levels of things like data entry errors, OOB values
- implications of sex as a largely binary variable, without gender field
    * underreported, underrepresented, under-missed groups
- BTS complaints related to attempts to report loved ones missing
- 'runaways' and the perception of who goes missing
- potential implications of unchanged UCR codes (ie. potential missing updates?)

### 5. Naming Names: Detectives and (Still) Missing Persons
- Primary: BP

##### officers
- ((Bonus points if you look them up in CPDP))
- top 5 most frequently observed detective/investigator assigned (caseload, distribution of case status, assignment vs closure vs active case rates, time to close groups)
    * comments on potential context, explanations, reasonable and observed ranges
- Yaverski, Brian (his assigned cases and the things that have been shared with us about peoples encounters with him)
- for all currently "open assigned" records, distribution of detective/investigator assigned
- rates of closed non criminal status across the board. examples of homicide and still missing victims in the data classified as closed non criminal and their associated det/inv assigned. ((any specific FOIA and/or interview details welcome))

##### missing humans
- names of individuals we've identified as missing from Chicago, who are **still missing**, and what their records show. ((any details from interviews welcome))
- names of individuals we've identified as having been missing from Chicago, who were later found as the **victim of a homicide**, and what their records show. ((any specific FOIA and/or interview details welcome))

### 6. What else did we observe?
- Primary: None atm

- high risk individuals, day/month old persons, missing adult with child reports
- details and important tangents from the original incident reports and other FOIA materials
- observances of changed statuses between first and last FOIA of the core MP dataset. are det/inv the same in each version?
- 'historical' rdnos (from reports between 2000-2019) that are missing in at least one version of the table. demographics, beat occurred, time to arrive and close, status
- that one time a police rep (the chief or commissioner?) said 99% of MP reports end up with the person coming home... where did that number come from and which variables are involved in the quote? is it reasonable to use those variables to make that claim?

### Summary
- summary of data story
- status of MP investigation by II
- outstanding questions
