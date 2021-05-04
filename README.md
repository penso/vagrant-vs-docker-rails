# README

Pristine Rails app, with a `Post` model and tests, and used to compare speed on
different environment.

# Results

------------------------------------------------------------------------

# Mac mini M1 16G RAM

Parallels M1 + Debian 4.19.0 arm64 + Docker

Finished in 5.162292s, 1.3560 runs/s, 1.7434 assertions/s.
Finished in 5.298611s, 1.3211 runs/s, 1.6986 assertions/s.
Finished in 0.303921s, 23.0323 runs/s, 29.6129 assertions/s.
Finished in 5.173234s, 1.3531 runs/s, 1.7397 assertions/s.
Finished in 0.201871s, 34.6756 runs/s, 44.5829 assertions/s.

docker-compose run app bundle exec make tests  0.20s user 0.03s system 3% cpu 6.979 total
docker-compose run app bundle exec make tests  0.20s user 0.03s system 3% cpu 6.664 total
docker-compose run app bundle exec make tests  0.22s user 0.02s system 3% cpu 6.668 total
docker-compose run app bundle exec make tests  0.20s user 0.04s system 3% cpu 6.499 total
docker-compose run app bundle exec make tests  0.20s user 0.03s system 3% cpu 6.566 total

with docker-compose already running:

docker-compose run app bundle exec rake test  0.20s user 0.02s system 3% cpu 6.062 total

## Mac Docker Desktop 3.3.1 

Finished in 1.104405s, 6.3383 runs/s, 8.1492 assertions/s.
Finished in 5.209888s, 1.3436 runs/s, 1.7275 assertions/s.
Finished in 6.001199s, 1.1664 runs/s, 1.4997 assertions/s.
Finished in 1.104785s, 6.3361 runs/s, 8.1464 assertions/s.
Finished in 6.208288s, 1.1275 runs/s, 1.4497 assertions/s.

docker-compose run app bundle exec make tests  0.44s user 0.14s system 2% cpu 21.385 total
docker-compose run app bundle exec make tests  0.45s user 0.13s system 2% cpu 20.381 total
docker-compose run app bundle exec make tests  0.43s user 0.10s system 2% cpu 20.037 total
docker-compose run app bundle exec make tests  0.44s user 0.10s system 2% cpu 21.316 total
docker-compose run app bundle exec make tests  0.44s user 0.09s system 2% cpu 22.136 total

with docker-compose already running:

docker-compose run app bundle exec rake test  0.47s user 0.13s system 3% cpu 16.038 total

uname -m
aarch64


## Native MacOS + postgres + redis

Finished in 0.523297s, 13.3767 runs/s, 17.1986 assertions/s.
Finished in 0.313440s, 22.3328 runs/s, 28.7136 assertions/s.
Finished in 0.313846s, 22.3039 runs/s, 28.6765 assertions/s.
Finished in 0.256659s, 27.2735 runs/s, 35.0660 assertions/s.
Finished in 0.315064s, 22.2177 runs/s, 28.5656 assertions/s.

make tests  1.14s user 0.51s system 159% cpu 1.037 total
make tests  1.16s user 0.51s system 158% cpu 1.052 total
make tests  1.15s user 0.51s system 162% cpu 1.023 total
make tests  1.15s user 0.49s system 159% cpu 1.025 total
make tests  1.15s user 0.52s system 175% cpu 0.951 total

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
