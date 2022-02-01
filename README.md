# Full Stack Technical Test

This project is based on a technical test for full stack developer in Ruby on Rails.

# Prerequisites

Have previously installed:
- [Docker](https://docs.docker.com/engine/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

# Run the project

```bash
git clone https://github.com/sebascp/fullstack_technical_test.git
```
```bash
cd fullstack_technical_test
```
```bash
sudo docker-compose build
```
```bash
sudo docker-compose run web rails db:create
```
```bash
sudo docker-compose up
```
Congratulations! You can now view the project at [localhost:3000](http://localhost:3000/)

# run tests
```bash
sudo docker-compose run web bundle exec rspec spec/*
```

# Where do you see the cycle numbers to find the answer?

Once the run
```bash
sudo docker-compose up
```
You can see how the project runs. When you perform the word count action, either by text or file upload, you can go to where the project is running and view the number of cycles it performed

# Computational complexity of the algorithm

It is an application designed to give the best performance in terms of information processing and rendering, therefore it is built on a monolithic system and renders the front in only HTML and CSS to give greater speed.

Something that was not taken into account in the construction of the application was the size of the text, since the view that renders the histogram receives the parameters by Query string and this has a limit of 1024 characters.
