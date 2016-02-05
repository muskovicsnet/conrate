module ConrateFlip
  class CheckRight
    def self.check?(request)
      request.env['warden'].authenticate? && request.env['warden'].user.has_role?(:conratesecurity_admin)
    end
  end
end
