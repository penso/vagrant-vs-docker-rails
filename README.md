# README

Pristine Rails app, with a `Post` model and tests, and used to compare speed on
different environment.

# Results

------------------------------------------------------------------------

Mac mini M1 16G RAM

Parallels M1 + Debian 4.19.0 arm64 + Docker
docker-compose run app bundle exec rake test  0.20s user 0.02s system 3% cpu 6.462 total

with docker-compose already running:

docker-compose run app bundle exec rake test  0.20s user 0.02s system 3% cpu 6.062 total

Mac Docker Desktop 3.3.1 
docker-compose run app bundle exec rake test  0.48s user 0.11s system 2% cpu 20.906 total

with docker-compose already running:

docker-compose run app bundle exec rake test  0.47s user 0.13s system 3% cpu 16.038 total

uname -m
aarch64

------------------------------------------------------------------------

MBP16 2019, 32G RAM, 8-core Intel Core i9 2.3Ghz

Vagrant 2.2.15 + Virtualbox 6.1.16 + Debian buster64 + Docker

time docker-compose run app bundle exec rake test
real	0m4.127s
user	0m0.244s
sys	0m0.028s

with docker-compose already running:
real	0m3.789s
user	0m0.229s
sys	0m0.036s

with rsync synced folder:
real	0m3.584s
user	0m0.199s
sys	0m0.071s
with rsync synced folder, with docker-compose already running:
real	0m3.525s
user	0m0.221s
sys	0m0.044s

Mac Docker Desktop 3.2.2

docker-compose run app bundle exec rake test  0.49s user 0.10s system 4% cpu 13.865 total

with docker-compose already running:

docker-compose run app bundle exec rake test  0.49s user 0.10s system 6% cpu 9.169 total
uname -m: x86_64
