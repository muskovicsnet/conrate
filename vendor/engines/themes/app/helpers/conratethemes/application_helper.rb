module Conratethemes
  module ApplicationHelper
    def self.bootstrap_alert_class(name)
      case name.to_s
      when 'notice'
        'success'
      when 'alert'
        'danger'
      when 'warning'
        'warning'
      end
    end

    def self.bootstrap_alert_icon(name)
      case name.to_s
      when 'notice'
        'info-circle'
      when 'alert'
        'exclamation-triangle'
      when 'warning'
        'exclamation-circle'
      end
    end
  end
end
