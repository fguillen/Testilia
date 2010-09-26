# Testilia

Multi-test quiz system.

Simple application to store and manage online tests.

CVS exams digester, user management, user history tracking.


## Install
    
    git clone git://github.com/fguillen/Testilia.git
    cd Testilia
    rake db:migrate
    rake db:seed
    rake test
    script/server


## Seed
See the example cvss on:
    /test/fixtures/test_1.cvs
    /etc/escuela_balear_tests/cvs/*.cvs

See the file:
    /db/seeds.rb

Use:
    exam = Exam.create_from_cvs( exam_name, cvs_path )
      

## TODO

* Use a NoSQL database.
* Now each question only can have 4 answers and only one can be the correct one.