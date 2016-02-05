class AclEnum
  @@values = {
    'READABLE' => 1,
    'INDEXABLE' => 2,
    'EDITABLE' => 3,
    'DESTROYABLE' => 4,
    'MENUABLE' => 5
  }

  def self.get_value(value)
    @@values[value]
  end

  def self.get_key(key)
    @@values.invert[key]
  end

  def self.get_keys()
    @@values.keys
  end
end