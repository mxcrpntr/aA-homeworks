require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
  def self.find_by_title(title)
    PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM
        plays
      WHERE
        title = ?
    SQL
  end
  def self.find_by_playwright(name)
  PlayDBConnection.instance.execute(<<-SQL, name)
    SELECT
      *
    FROM
      plays
    WHERE
      playwright_id IN (
      SELECT
        id
      FROM
        playwrights
      WHERE
        name = ?
      )
  SQL
  end
end

class Playwright
  attr_accessor :id, :name, :plays

  def initialize(options)
      @id = options['id']
      @name = options['name']
      @plays = options['plays']
  end
  def self.all
      data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
      data.map { |datum| Play.new(datum) }
  end
  def self.find_by_name(name)
  PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
        *
      FROM
        playwrights
      WHERE
        name = ?
    SQL
  end
  def create
      raise "#{self} already in database" if self.id
      PlayDBConnection.instance.execute(<<-SQL, self.name, self.plays)
        INSERT INTO
          playwrights (name, plays)
        VALUES
          (?, ?)
      SQL
      self.id = PlayDBConnection.instance.last_insert_row_id
  end
  def update
      raise "#{self} not in database" unless self.id
      PlayDBConnection.instance.execute(<<-SQL, self.name, self.plays, self.id)
        UPDATE
          playwrights
        SET
          name = ?, plays = ?, id = ?
        WHERE
          id = ?
      SQL
  end
  def get_plays
      raise "#{self} not in database" unless self.id
      PlayDBConnection.instance.execute(<<-SQL, self.id)
        SELECT
          plays
        FROM
          playwrights
        WHERE
          id = ?
      SQL
  end
end