class Item
  attr_reader :id
  attr_accessor :label, :author, :archived, :genre, :source, :publish_date

  def initialize(publish_date, archived: false)
    @id = rand(1..1_000)
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre(genre)
    self.genre = genre
  end

  def add_author(author)
    self.author = author
  end

  def move_to_archive
    self.archived = true if can_be_archived?
  end

  def can_be_archived?
    (Time.now.year - publish_date.year) > 10
  end
end
