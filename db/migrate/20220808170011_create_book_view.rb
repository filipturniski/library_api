class CreateBookView < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE VIEW Book_views AS
            select b.name ,
            a.id as author_id,
            a.name_author ,
            sum(fbw.status_id = 4 or fbw.status_id is null)   as numberOfFreeCopies,
            count(b.id) as numberOfCopies
             from authors a
            JOIN books b ON  b.authors_id = a.id
            left JOIN book_free_views fbw ON  fbw.book_id = b.id
            where b.status_id = 1
              and a.status_id = 1
            GROUP BY  b.name ,
             a.id,
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
