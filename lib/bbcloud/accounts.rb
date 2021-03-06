module Brightbox
  class Account < Api

    def ram_free
      [ram_limit.to_i - ram_used.to_i, 0].max
    end

    def to_row
      attributes.merge({ :ram_free => ram_free, 
                         :cloud_ip_limit => limits_cloudips
                       })
    end

    def self.all
      a = conn.account
      a.connection = conn
      [a]
    end

    def self.get(id)
      a = conn.account
      a.connection = conn
      if a.id == id
        a
      else
        nil
      end
    end

    def self.default_field_order
      [:id, :name, :cloud_ip_limit, :ram_limit, :ram_used, :ram_free]
    end

    def to_s
      @id
    end

  end
end
