class CreateBookView < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE VIEW Book_views AS
            select b.nameBook ,
            a.nameAuthor ,
            count(b.idBook) as numberOfCopies
           from authors a
          JOIN books b ON  b.idAuthor = a.idAuthor
          GROUP BY  b.nameBook ,
           a.nameAuthor;
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
