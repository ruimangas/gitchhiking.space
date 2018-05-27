<p align="center">
  <img src="https://raw.githubusercontent.com/ruimangas/gitchhiking.space/master/app/assets/images/header_mail.png" alt="Gitchhiking logo"/>
</p>

### How to run locally

```
$ docker-compose build
$ docker-compose up
```

#### Creating the database

```
$ docker exec <container-name> rake db:create db:migrate
```

Visit ```localhost:3001```
