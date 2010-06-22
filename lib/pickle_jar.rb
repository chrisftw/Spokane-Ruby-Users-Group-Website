class PickleJar

  @random = []
  def self.add_name(name)
    @random << name.to_s.strip
    @random.uniq!
    puts "Added #{name.to_s.strip}"
  end

  def self.add_names(names)
    names.split(',').each { |n| @random << n.downcase.strip }
    @random.uniq!
    puts "Jar now has #{@random.length} names."
  end

  def self.remove_name(name)
    puts "Removed #{@random.delete(name.to_s)} from the jar."
  end
  
  def self.pick_name
    shake_it_up # extra random?  maybe...  but I doubt it.
    name = @random.delete_at(rand(@random.length))
    "THE WINNER IS: (drum roll).......#{name}"
  end

  def self.shake_it_up  # Just for fun...  already random but makes people feel better.
    @random = @random.sort_by{rand}[0..@random.length]
    "SHAKE SHAKE SHAKE"
  end

  def self.peek_in_jar
    puts @random
  end

end

# "[A-Z]{0,2}SPAN[A-Z]{0,2}"