# Conrate

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.

## Installing

*    sudo apt-get install libmagickcore-6-headers libmagickwand-6-headers libmagickcore-dev
*    sudo apt-get install qt5-qmake qtbase5-dev qt5-default libqt5webkit5-dev

## Start server

    puma -C config/puma.rb

## Module

    rails plugin new [module_name] --mountable -T --dummy-path=spec/dummy
