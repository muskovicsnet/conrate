# Conratethemes

Theme support for the Conrate Content Management System.

## Installation

Gemfile

    gem 'conratethemes', '0.0.1', path: '../conratethemes'

applications.js

    //= require 'conratethemes/application.js'

application.css

    *= require 'conratethemes/application.css'

routes.rb

    mount Conratethemes::Engine => '/conratethemes'

Copy your template to app/themes

## Usage

    <%= render partial: 'conratethemes/shared/sidebar' %>
    <%= render 'conratethemes/shared/messages' %>

### License

MIT-LICENSE
