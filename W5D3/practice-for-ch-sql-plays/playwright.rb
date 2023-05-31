require 'sqlite3'
require 'singleton'

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