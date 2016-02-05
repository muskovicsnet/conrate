class Feature < ActiveRecord::Base
  extend Flip::Declarable
  # extend Flip::Cacheable

  # strategy Flip::CookieStrategy
  strategy Flip::DatabaseStrategy
  strategy Flip::DeclarationStrategy
  default false

  # Declare your features here, e.g:
  #
  # feature :world_domination,
  #   default: true,
  #   description: "Take over the world."

  feature :conrate_blogs, default: false
  feature :conrate_galleries, default: false
  feature :conrate_menus, default: false
  feature :conrate_jobs, default: false
  feature :conrate_pages, default: false
  feature :notifications, default: false
  feature :conrate_security, default: true
  feature :conrate_settings, default: true
  feature :conrate_themes, default: true
  feature :conrate_security_facebook, default: false
  feature :conrate_webshop, default: false
end
