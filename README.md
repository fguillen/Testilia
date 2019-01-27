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

## Docker

### Install server basics
    ./server_setup.sh

### Restore backups

Go to S3 to get the backups

    docker exec -i a324c67ea86f mysql -uroot -proot testnauticos < /tmp/hpq.20180629.daily.sql
    mv /tmp/public/paperclip/production/* /var/apps/TestNauticos/public/paperclip/production/

### Activate SweetyBacky

    vim /root/secret/.s3.passwd # set the S3 credentials
    chmod -R 600 /root/secret/
    apt-get install ruby-all-dev build-essential zlib1g-dev mysql-client
    gem install "sweety_backy"
    crontab -l | { cat; echo "50 22 * * * /bin/bash -l -c '/usr/local/bin/sweety_backy /var/apps/TestNauticos/config/sweety_backy.conf >> /tmp/sweety_backy.TestNauticos.log 2>&1'"; } | crontab -


### Redeploy

    ssh root@testnauticos.com
    cd /var/apps/TestNauticos
    git pull
    docker-compose restart app
    docker-compose restart web

### Consoling

    docker-compose exec app bundle exec rails c
    docker-compose exec db mysql -uroot -p hpq
