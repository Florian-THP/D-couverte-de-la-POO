require "time"
require "pry"

class Event 
  attr_accessor :start_date
  attr_accessor :duration
  attr_accessor :title
  attr_accessor :attendees


  def self.demande 
    puts "Salut, tu veux créer un événement ? Cool !"
    puts "Commençons. Quel est le nom de l'événement ?"
    print"> "
    name = gets.chomp

    puts "Super. Quand aura-t-il lieu ?"
    print"> "
    date = gets.chomp

    puts "Au top. Combien de temps va-t-il durer (en minutes) ?"
    print"> "
    duree = gets.chomp

    puts "Génial. Qui va participer ? Balance leurs e-mails (séparés par des virgules)"
    print "> "
    mailen = gets.chomp.split(",").map(&:strip)  # Split les e-mails et retirer les espaces

    puts "Super, c'est noté, ton évènement a été créé !"
    my_event = Event.new(date, duree,name, mailen)

    puts my_event.to_s
  end



  def initialize(date_update, duration_time, titre_update, email_list)
    @start_date = Time.parse(date_update)
    @duration = duration_time
    @title = titre_update
    @attendees = email_list
  end

  def postpone_24h
    @start_date = @start_date + 86400
  end

  def end_date
    @start_date + (@duration * 60)
  end

  def is_past?
    if @start_date < Time.now
      return true
    else
        return false
    end
  end

  def is_future?
    if @start_date > Time.now
      return true
    else
        return false
    end
  end
  
  def is_soon?
    if @start_date > Time.now && @start_date < (Time.now + 1800)
      return true
    else
      return false
    end
  end

  def to_s
    puts "Titre : #{@title}"
    puts "Date de début : #{@start_date}"
    puts "Durée : #{@duration} minutes"
    puts "Invités : #{@attendees.join(", ")}"
  end

end

Event.demande


