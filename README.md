# OD Project: Tourist Accomodation Recommender 

This project supposes the proof of concept of the course project of the subject Open Data, correspondingto the Spring semester of the MIRI master degree during the course 2018/19.


## Getting Started

These instructions will get you a copy of the project up and running on your local machine. 

### Prerequisites



The following software is required:

* Neo4j with neo4j-graph-algorithms. 
* Python 3.5 or higher with pip.

It is important to assure that the adequate version of neo4j-graph-algorithms is installed for your neo4j version. Otherwise, errors could occur. As an example, the following error appears if you do not use the correct version of the algorithms:

```
Neo.ClientError.Procedure.ProcedureCallFailed:
 Failed to invoke procedure `algo.closeness.harmonic`:
  Caused by: java.lang.NoSuchMethodError: org.neo4j.kernel.api.Statement.readOperations()Lorg/neo4j/kernel/api/ReadOperations;
```

### Setup

#### Neo4j

 It is necessary to copy the following files in the import directory of your Neo4j instance:
 
 * airbnb_neighbourhoods.csv
 * airbnb.csv
 * distance_neighbourhoods.csv
 * negocios.csv
 * padron_bcn.csv
 * turismo.csv

#### Python project

In order to install the libraries needed for the project, the following command needs to be runed:

```
pip3 install -r requirements.txt
```

The  default credentials for the database are assumed, in case you need to change this configuration the following function parameters in setup.py file in line 5 need to be changed with your information:
```
MenuActions(database url, user, password)
```

## Running the project

In order to run this project, the setup.py file need to be runned with the following command:

```
python setup.py
```

## Authors

* Javier de Jesús Flores Herrera 
* Jorge López Alonso 
* Damian Rubio Cuervo
