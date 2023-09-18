

/* Problem 1 */


data silk;

input site genotype length;

datalines;

1 1 29.87

1 2 32.51

1 3 35.76

2 1 28.16

2 2 30.82

2 3 33.14

3 1 32.08

3 2 34.17

3 3 36.29

4 1 30.84

4 2 33.46

4 3 34.95

5 1 29.44

5 2 32.99

5 3 35.89

;

run;


proc anova data=silk;

 class site genotype;

 model length = genotype site;

 run;


/* Problem 2 */ 


data fnp;

  input specialty city competency;

  datalines;

       1       1     91.7

       1       1     74.9

       1       1     88.2

       1       1     79.5

       1       2     86.3

       1       2     88.1

       1       2     92.0

       1       2     69.5

       1       3     82.3

       1       3     78.7

       1       3     89.8

       1       3     84.5

       2       1     80.1

       2       1     76.2

       2       1     70.3

       2       1     89.5

       2       2     71.3

       2       2     73.4

       2       2     76.9

       2       2     87.2

       2       3     90.1

       2       3     65.6

       2       3     74.6

       2       3     79.1

       3       1     71.5

       3       1     49.8

       3       1     55.1

       3       1     75.4

       3       2     80.2

       3       2     76.1

       3       2     44.2

       3       2     50.5

       3       3     48.7

       3       3     54.4

       3       3     60.1

       3       3     70.8

;

run;



proc means data=fnp mean std;

class specialty city;

var competency;

run;


proc anova data=fnp;

class specialty city;

model competency = specialty city specialty*city;

means specialty/tukey lines;

means city/tukey lines;

run;

proc means data=fnp mean std;

class specialty;

var competency;

run;


/* Problem 3 */

data pines;

  input species location diameter;

  datalines;

            1           1     23

            1           1     15

            1           1     16

            1           1     13

            1           1     21

            1           2     25

            1           2     20

            1           2     21

            1           2     16

            1           2     18

            1           3     21

            1           3     17

            1           3     16

            1           3     24

            1           3     27

            1           4     14

            1           4     17

            1           4     19

            1           4     20

            1           4     24

            2           1     28

            2           1     22

            2           1     25

            2           1     19

            2           1     26

            2           2     30

            2           2     26

            2           2     26

            2           2     20

            2           2     28

            2           3     19

            2           3     24

            2           3     19

            2           3     25

            2           3     29

            2           4     17

            2           4     21

            2           4     18

            2           4     26

            2           4     23

            3           1     18

            3           1     10

            3           1     12

            3           1     22

            3           1     13

            3           2     15

            3           2     21

            3           2     22

            3           2     14

            3           2     12

            3           3     23

            3           3     25

            3           3     19

            3           3     13

            3           3     22

            3           4     18

            3           4     12

            3           4     23

            3           4     22

            3           4     19


;

run;


proc anova data=pines;

class species location;

model diameter = species location species*location;

means species/tukey lines;

run;

proc mixed data=pines method=type3 covtest cl;
	class species location;
	model = species;
	random location;
	lsmeans species/diff cl adjust=tukey;
run;
