# CS 164: Programming Assignment 1

## Getting started

Run the following command to generate and compile your parser, and then run all the provided tests:

```
mvn clean package

java -cp "chocopy-ref.jar:target/assignment.jar" chocopy.ChocoPy --pa1 chocopy.pa1.StudentParser --dir src/test/data/pa1/sample/ --test
```

In the starter code, only one test should pass. Your objective is to build a parser that passes all the provided tests and meets the assignment specifications.

To manually observe the output of your parser when run on a given input ChocoPy program, run the following command (replace the last argument to change the input file):

```
java -cp "chocopy-ref.jar:target/assignment.jar" chocopy.ChocoPy --pa1 chocopy.pa1.StudentParser --in src/test/data/pa1/sample/expr_plus.py
```

You can check the output produced by the staff-provided reference implementation on the same input file, as follows:

```
java -cp "chocopy-ref.jar:target/assignment.jar" chocopy.ChocoPy --pa1 chocopy.reference.RefParser --in src/test/data/pa1/sample/expr_plus.py
```

## Assignment specifications

See `PA1.pdf` for a detailed specification of the assignment.

Refer to `chocopy_language_reference.pdf` for specifications on the ChocoPy language. 

## Receiving updates to this repository

Add the `upstream` repository remotes (you only need to do this once in your local clone):

```
git remote add upstream https://github.com/cs164fall2018/pa1-chocopy-parser.git
```

To sync with updates upstream:
```
git pull upstream master
```

## Submission writeup

Team member 1: 

Team member 2: 

(Students should edit this section with their write-up)
