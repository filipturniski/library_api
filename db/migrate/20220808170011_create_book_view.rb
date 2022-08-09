class CreateBookView < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE VIEW Book_views AS
            select b.name ,
            a.name_author ,
            count(b.id) as numberOfCopies
           from authors a
          JOIN books b ON  b.authors_id = a.id
          GROUP BY  b.name ,
           a.name_author;
        SQL
      end

      dir.down do
        execute <<-SQL
          DROP VIEW IF EXISTS Book_views;
        SQL
      end
    end
  end
end
