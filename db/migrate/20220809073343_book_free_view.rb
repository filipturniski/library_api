class BookFreeView < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE VIEW book_free_views AS
            select b.name ,
            a.id as author_id,
            a.name_author ,
            count(b.id) as numberOfCopies
           from authors a
          JOIN books b ON  b.authors_id = a.id
		   where b.status_id = 1
		   and a.status_id = 1
          GROUP BY  b.name ,
           a.id,
           a.name_author;
        SQL
      end

      dir.down do
        execute <<-SQL
          DROP VIEW IF EXISTS book_free_views;
        SQL
      end
    end
  end
end
